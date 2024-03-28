library(biomaRt)
library(tidyverse)
ensembl <- useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl")
ens_hgnc_uniprot <- getBM(attributes=c('ensembl_gene_id', 'hgnc_symbol', 'uniprotswissprot'),
                        # filters = 'ensembl_gene_id',
                        # values = '',
                        mart = ensembl)
Hs_ens_hgnc_uniprot <- as_tibble(ens_hgnc_uniprot)
dir.create("data")
save(Hs_ens_hgnc_uniprot, file = "data/Hs_ens_hgnc_uniprot.rda", compress = "bzip2")
