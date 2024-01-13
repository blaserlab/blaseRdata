library(tidyverse)
library(GenomicRanges)
library(conflicted)
conflict_prefer("select", "dplyr")
conflict_prefer("filter", "dplyr")
hg38_gff <- read_delim(file = "https://ftp.ensembl.org/pub/release-111/gff3/homo_sapiens/Homo_sapiens.GRCh38.111.chr.gff3.gz",
                       delim = "\t",
                       comment = "#",
                       col_names = c("seqid",
                                     "source",
                                     "type",
                                     "start",
                                     "end",
                                     "score",
                                     "strand",
                                     "phase",
                                     "attributes"))


hg38_biomart <- read_delim("/workspace/refdata/biomart/hg38_biomart_20240113.txt", delim = "\t")

hg38_full_model <-
  hg38_gff %>%
  filter(type %in% c("five_prime_UTR", "CDS", "three_prime_UTR")) %>%
  mutate(parent_transcript = str_extract(attributes, "Parent=transcript:ENST[:digit:]*")) %>%
  select(-attributes) %>%
  mutate(parent_transcript = str_replace(parent_transcript, "Parent=transcript:", "")) %>%
  left_join(
    hg38_biomart %>% select(
      parent_transcript = `Transcript stable ID`,
      APPRIS = `APPRIS annotation`,
      length = `Transcript length (including UTRs and CDS)`,
      gene_name = `Gene name`
    )
  ) %>%
  mutate(APPRIS = factor(
    APPRIS,
    levels = c(
      "principal1",
      "principal2",
      "principal3",
      "principal4",
      "principal5",
      "alternative1",
      "alternative2"
    )
  )) %>%
  mutate(seqid = paste0("chr", seqid)) %>%
  select(-c(score, phase))

hg38_full_model_gr <- makeGRangesFromDataFrame(hg38_full_model, keep.extra.columns = T)
genome(hg38_full_model_gr) <- "hg38"

# rename so it makes more sense with other data elements
hg38_granges_reduced <- hg38_full_model_gr
save(hg38_granges_reduced, file = "data/hg38_granges_reduced.rda", compress = "gzip")
tools::checkRdaFiles("data/hg38_granges_reduced.rda")

dr11_gff <- read_delim(file = "https://ftp.ensembl.org/pub/release-111/gff3/danio_rerio/Danio_rerio.GRCz11.111.chr.gff3.gz",
                       delim = "\t",
                       comment = "#",
                       col_names = c("seqid",
                                     "source",
                                     "type",
                                     "start",
                                     "end",
                                     "score",
                                     "strand",
                                     "phase",
                                     "attributes"))
dr11_biomart <- read_delim("/workspace/refdata/biomart/grcz11_biomart_20240113.txt", delim = "\t")

dr11_full_model <-
  dr11_gff %>%
  filter(type %in% c("five_prime_UTR", "CDS", "three_prime_UTR")) %>%
  mutate(parent_transcript = str_extract_all(attributes, "Parent=transcript:ENSDART[:digit:]*")) %>%
  select(-attributes) %>%
  mutate(parent_transcript = str_replace(parent_transcript, "Parent=transcript:", "")) %>%
  left_join(
    dr11_biomart %>% select(
      parent_transcript = `Transcript stable ID`,
      APPRIS = `APPRIS annotation`,
      length = `Transcript length (including UTRs and CDS)`,
      gene_name = `Gene name`
    )
  ) %>%
  mutate(APPRIS = factor(
    APPRIS,
    levels = c(
      "principal1",
      "principal5",
      "alternative1",
      "alternative2"
    )
  )) %>%
  mutate(seqid = paste0("chr", seqid)) %>%
  select(-c(phase, score))

dr11_full_model_gr <- makeGRangesFromDataFrame(dr11_full_model, keep.extra.columns = T)
genome(dr11_full_model_gr) <- "danRer11"

# rename so it makes more sense with other data elements
zfin_granges_reduced <- dr11_full_model_gr
save(zfin_granges_reduced, file = "data/zfin_granges_reduced.rda", compress = "gzip")
tools::checkRdaFiles("data/zfin_granges_reduced.rda")

