renv::install("/usr/lib/R/site-library/XML")
library(XML)
library(methods)
data <- xmlParse("~/workspace_pipelines/sc_refdata/msigdb/msigdb_v7.4.xml")
data[[1]]
list <- xmlToList(data)

genesets_enframed <-
  map(.x = list, .f = enframe)

geneset_names <- map(genesets_enframed, .f = function(x) {
  setname <- x %>% filter(name == "STANDARD_NAME") %>% pull(value)
})
names(genesets_enframed) <- geneset_names

#put metadata in 1 big table
msigdb_geneset_metadata <- map_dfr(genesets_enframed, .f = function(x) {
  res <- x[1:18,] %>%
    mutate(value = ifelse(value == "", NA, value)) %>%
    pivot_wider(values_fill = NA)
  return(res)
})

msigdb_geneset_metadata <- msigdb_geneset_metadata[,1:18]


msigdb_genesets <- map(genesets_enframed, .f = function(x) {
  res <- x %>%
    filter(name == "MEMBERS_MAPPING") %>%
    select(value) %>%
    separate_rows(value, sep = "\\|") %>%
    separate(value, into = c("id", "gene_short_name", NA), sep = ",") %>%
    mutate(gene_short_name = ifelse(gene_short_name == "", NA, gene_short_name))
  return(res)
}) %>% set_names(nm = names(genesets_enframed))


save(msigdb_genesets, file = "data/msigdb_genesets.rda", compress = "bzip2")
save(msigdb_geneset_metadata, file = "data/msigdb_geneset_metadata.rda", compress = "bzip2")
