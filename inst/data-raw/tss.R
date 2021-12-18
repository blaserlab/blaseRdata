library("blaseRtools")
library("blaseRdata")
library("tidyverse")
library("GenomicRanges")
library(GenomicFeatures)
library(GenomicAlignments)

TSS <- function(txdb) {
  if(!is(txdb,'TxDb'))
    stop('txdb has to be an object of class TxDb ...')

  TSSr <- promoters(txdb, upstream=0, downstream=0)
  ann <- select(txdb, keys=transcripts(txdb)$tx_name,
                keytype='TXNAME', columns=c('TXNAME','GENEID'))
  ind <- which(duplicated(TSSr$tx_name)==TRUE)
  if(length(ind) >0)
  {
    TSSr <- TSSr[-c(ind)]
    ann <- ann[-c(ind),]
  }
  rownames(ann) <- ann[,1]
  names(TSSr) <- ann[TSSr$tx_name,'GENEID']
  # take min pos for - and max for + strand genes
  ind <- which(as.character(strand(TSSr))=='+')
  pos_start <- start(TSSr)[ind]
  end(TSSr)[ind] <- pos_start

  ind <- which(as.character(strand(TSSr))=='-')
  pos_end <- end(TSSr)[ind]
  start(TSSr)[ind] <- pos_end
  return(TSSr)
}

hs_txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
hg38_tss <- TSS(hs_txdb)
names(hg38_tss) <- NULL
hg38_tss <- blaseRtools:::buff_granges(hg38_tss, gen = "hg38")

save(hg38_tss, file = "data/hg38_tss.rda", compress = "bzip2")
tools::checkRdaFiles("data/hg38_tss.rda")

dr_txdb <- TxDb.Drerio.UCSC.danRer11.refGene::TxDb.Drerio.UCSC.danRer11.refGene
dr11_tss <- TSS(dr_txdb)
names(dr11_tss) <- NULL
dr11_tss <- blaseRtools:::buff_granges(dr11_tss, gen = "danRer11")

save(dr11_tss, file = "data/dr11_tss.rda", compress = "bzip2")
tools::checkRdaFiles("data/dr11_tss.rda")

