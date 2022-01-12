#' @title Wordlist Hashtable
#' @description Wordlist from the Grady Parts of Speech database.  In order to reuse, 1.) Calculate the md5sum of the object you want to hash, 2.) Take the first 5 or more hex digits and fill them in this expression:  as.integer(as.hexmode("<hex digits>") %% 226857) + 1.  This will return an integer between 1 and 226857 which is the length of the wordlist hashtable.  Then select the word according to the integer/index value using something like:  wordlist %>% filter(index == integer) %>% pull(word).
#' @source https://www.gutenberg.org/ebooks/3201
#' @format A data frame with 226857 rows and 2 variables:
#' \describe{
#'   \item{\code{index}}{integer }
#'   \item{\code{word}}{character }
#'}
#' @details see data-raw/wordhash.R for construction
"wordhash"


#' @title Drerio
#' @description This is a copy of the Drerio object from BSgenome.Drerio.UCSC.danRer11.  It is here for more convenient use with blaseRtools functions and to reduce dependencies.
#' @source UCSC danRer11 genome build
#' @format A BSgenome object:
#' @details see data-raw/grcz11_objects.R
"Drerio"

#' @title Hsapiens
#' @description This is a copy of the Hsapiens object from BSgenome.Hsapiens.UCSC.hg38.  It is here for more convenient use with blaseRtools functions and to reduce dependencies.
#' @source UCSC hg38 genome build
#' @format A BSgenome object:
#' @details see data-raw/hg38_objects.R
"Hsapiens"

#' @title Zebrafish Gene Model
#' @description This is a granges object containing the full genome model from the zfin database.  Based on GRCz11 genome build.
#' @source https://zfin.org/downloads/zfin_genes.gff3 release April 2018
#' @format A GRanges object:
#' @details see data-raw/grcz11_objects.R
"zfin_granges"

#' @title Human Gene Model
#' @description Full Genome Model for humans.  Based on GRCh38 genome build.
#' @source http://ftp.ensembl.org/pub/release-104/gff3/homo_sapiens/
#' @format A GRanges object:
#' @details see data-raw/hg38_objects.R
"hg38_granges"

#' @title Reduced Zebrafish Gene Model
#' @description Similar to the Zebrafish Gene Model but with different metadata columns and only with 5', CDS and 3' UTR ranges.  Also has principle isoform data.
#' @source https://zfin.org/downloads/zfin_genes.gff3 release April 2018
#' @format A GRanges object:
#' @details see data-raw/trace_objects.R
"zfin_granges_reduced"

#' @title Reduced Human Gene Model
#' @description Similar to the Human Gene Model "hg38_granges" but with different metadata columns and only with 5', CDS, and 3' UTR ranges.  Also has principle isoform data.
#' @source http://ftp.ensembl.org/pub/release-104/gff3/homo_sapiens/
#' @format A GRanges object:
#' @details see data-raw/trace_objects.R
"hg38_granges_reduced"

#' @title Zebrafish Gene TSS
#' @description From TxDb.Drerio.UCSC.danRer11.refGene
#' @format A GRanges object:
#' @details see data-raw/tss.R
"dr11_tss"

#' @title Human Gene TSS
#' @description From TxDb.Hsapiens.UCSC.hg38.knownGene
#' @format A GRanges object:
#' @details see data-raw/tss.R
"hg38_tss"


#' @title Jaspar 2020 TF Motifs
#' @description JASPAR 2020 TF Motif database in character string format.  Mostly for internal use.
#' @source JASPAR2020_CORE_vertebrates_non-redundant_pfms_jaspar.txt
#' @format A character vector.
#' @details see data-raw/meme.R
"meme"

#' @title ScRNA-seq Vignette CDS
#' @description A small example CDS for the blaseRtools vignette
#' @source https://www.10xgenomics.com/resources/datasets/500-human-pbm-cs-3-lt-v-3-1-chromium-controller-3-1-low-6-1-0 and https://www.10xgenomics.com/resources/datasets/500-human-pbm-cs-3-lt-v-3-1-chromium-x-3-1-low-6-1-0
#' @format A cellDataSet object
#' @details See blaseRtools scRNAseq Vignette
"vignette_cds"

#' @title Vignette QC Results
#' @description Standard bb_qc function output
#' @source vignette_cds
#' @format a list
#' @details See blaseRtools scRNAseq Vignette
"vig_qc_res"

#' @title Genes to Remove from ScRNA-seq Analysis:  Zebrafish
#' @description A precompiled list of mitochondrial and ribosomal gene names to remove.
#' @source Ensembl
#' @format A character vector
#' @details See data-raw/remove_genes
"dr11_remove_genes"


#' @title Genes to Remove from ScRNA-seq Analysis:  Human
#' @description A precompiled list of mitochondrial and ribosomal gene names to remove.
#' @source Ensembl
#' @format A character vector
#' @details See data-raw/remove_genes
"hg38_remove_genes"

#' @title Genes to Remove from ScRNA-seq Analysis:  Mouse
#' @description A precompiled list of mitochondrial and ribosomal gene names to remove.
#' @source Ensembl
#' @format A character vector
#' @details See data-raw/remove_genes
"mm39_remove_genes"

#' @title BlaseRtools ScRNA-seq Vignette CDS Top Markers
#' @description Top Markers for the vignette CDS
#' @format A data frame with 1100 rows and 11 variables:
#' \describe{
#'   \item{\code{gene_id}}{character Ensembl gene identifier}
#'   \item{\code{gene_short_name}}{character Gene Name}
#'   \item{\code{cluster_method}}{character Clustering Method}
#'   \item{\code{cell_group}}{character Cell Cluster or Partition}
#'   \item{\code{marker_score}}{double Composite score of fraction expressing and level of expression.}
#'   \item{\code{mean_expression}}{double Mean marker expression}
#'   \item{\code{fraction_expressing}}{double Fraction expressing}
#'   \item{\code{specificity}}{double Marker specificity}
#'   \item{\code{pseudo_R2}}{double Regression pseudo R squared}
#'   \item{\code{marker_test_p_value}}{double Wald test P value}
#'   \item{\code{marker_test_q_value}}{double q value}
#'}
#' @details See blaseRtools scRNAseq Vignette
"vignette_top_markers"

#' @title BlaseRtools ScRNA-seq Vignette CDS Pseudobulk Results
#' @description Pseudobulk header, results and qc plots.
#' @format A list of pseudobulk results
#' @details See blaseRtools scRNAseq Vignette
"vignette_pseudobulk_res"

#' @title Broad Institute MSIGDB Gene Set Metadata
#' @description Gene set metadata for the whole MSIGDB.  Most gene sets are known by "STANDARD_NAME".  You can filter the gene set list by supplying a named filter list to the bb_extract_msig function.  The name of each list element should be one of the column names in this metadata table and the list element contents should be the values to filter for.  Filtering works in an additive way, meaning if you supply a filter list with two elements it will extract gene sets passing filters 1 AND 2.
#' @source https://www.gsea-msigdb.org/gsea/msigdb/ accessed January 12 2022.
#' @format A data frame with 32796 rows and 18 variables:
#' \describe{
#'   \item{\code{STANDARD_NAME}}{character }
#'   \item{\code{SYSTEMATIC_NAME}}{character }
#'   \item{\code{HISTORICAL_NAME}}{character }
#'   \item{\code{ORGANISM}}{character }
#'   \item{\code{PMID}}{character }
#'   \item{\code{AUTHORS}}{character }
#'   \item{\code{GEOID}}{character }
#'   \item{\code{EXACT_SOURCE}}{character }
#'   \item{\code{GENESET_LISTING_URL}}{character }
#'   \item{\code{EXTERNAL_DETAILS_URL}}{character }
#'   \item{\code{CHIP}}{character }
#'   \item{\code{CATEGORY_CODE}}{character }
#'   \item{\code{SUB_CATEGORY_CODE}}{character }
#'   \item{\code{CONTRIBUTOR}}{character }
#'   \item{\code{CONTRIBUTOR_ORG}}{character }
#'   \item{\code{DESCRIPTION_BRIEF}}{character }
#'   \item{\code{DESCRIPTION_FULL}}{character }
#'   \item{\code{TAGS}}{character }
#'}
#' @details Use with bb_extract_msig
"msigdb_geneset_metadata"


#' @title Broad Institute MSIGDB Gene Sets
#' @description List of MSIGDB gene sets.  Most gene sets are commonly known by "STANDARD_NAME".  This is a unique value and is provided as the name for each of the elements in this list. If you want to select a single gene set by name you can use the usual R syntax for selecting named elements:  msigdb_genesets$<gene set name>.  If you want to select by other metadata features you should use bb_extract_msig.
#' @source https://www.gsea-msigdb.org/gsea/msigdb/ accessed January 12 2022.
#' @format A list.
#' @details Use with bb_extract_msig
"msigdb_genesets"
