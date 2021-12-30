hg38_remove_genes <- read_tsv("~/workspace_pipelines/sc_refdata/gene_names/human_gene_names.txt") %>%
  as_tibble() %>%
  select(gene_name = `Gene name`) %>%
  select(gene_name) %>%
  distinct() %>%
  filter(str_detect(gene_name, pattern = "^MT-|RPS|RPL")) %>%
  pull(gene_name)

mm39_remove_genes <- read_tsv("~/workspace_pipelines/sc_refdata/gene_names/mouse_gene_names.txt") %>%
  as_tibble() %>%
  select(gene_name = `Gene name`) %>%
  select(gene_name) %>%
  distinct() %>%
  filter(str_detect(gene_name, pattern = "rpl|rps|Rpl|Rps|^mt-")) %>%
  pull(gene_name)

dr11_remove_genes <- read_tsv("~/workspace_pipelines/sc_refdata/gene_names/zfish_gene_names.txt") %>%
  as_tibble() %>%
  select(gene_name = `Gene name`) %>%
  select(gene_name) %>%
  distinct() %>%
  filter(str_detect(gene_name, pattern = "^mt-|rpl|rps")) %>%
  pull(gene_name)

save(mm39_remove_genes, file = "data/mm39_remove_genes.rda", compress = "gzip")
save(hg38_remove_genes, file = "data/hg38_remove_genes.rda", compress = "gzip")
save(dr11_remove_genes, file = "data/dr11_remove_genes.rda", compress = "gzip")
