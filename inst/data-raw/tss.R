
make_promoter_gr <- function(data) {
  prelim <-
    data[mcols(data)$type == "mRNA"]
  mcols(prelim)$tss <-
    ifelse(strand(prelim) == "+",
           start(prelim),
           end(prelim))
  res <- prelim
  start(res) <- mcols(res)$tss-200
  end(res) <- mcols(res)$tss+200
  strand(res) <- "*"
  mcols(res)$gene <- mcols(res)$gene_name
  mcols(res)$type <- NULL
  mcols(res)$gene_name <- NULL
  mcols(res)$label <- NULL
  return(res)
}



zfin_promoters <- make_promoter_gr(zfin_granges)
save(zfin_promoters, file = "data/zfin_promoters.rda", compress = "gzip")
tools::checkRdaFiles("data/zfin_promoters.rda")

hg38_promoters <- make_promoter_gr(hg38_granges)
save(hg38_promoters, file = "data/hg38_promoters.rda", compress = "gzip")
tools::checkRdaFiles("data/hg38_promoters.rda")
