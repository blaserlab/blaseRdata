# load and attach packages ------------------------------------------------
library("conflicted")
library("blaseRtemplates")
library("blaseRtools")
library("blaseRdata")
library("tidyverse")
library("gert")
# library("DropletUtils")
library("Matrix")
library("cowplot")
library("BSgenome.Hsapiens.UCSC.hg38")
library("Signac")
library("Seurat")
# library("SeuratWrappers")
# library("monocle3")
# library("cicero")
# library("SingleCellExperiment")
library("RColorBrewer")
library("ggtext")
library("EnsDb.Hsapiens.v86")
# library("GenomicRanges")
library("TxDb.Hsapiens.UCSC.hg38.knownGene")
library("JASPAR2020")
library("TFBSTools")
library("ComplexHeatmap")
# library("circlize")
# library("topGO")
# library("cicero")
# library("AUCell")
library("org.Hs.eg.db")
library("clusterProfiler")
# library("cisTopic")
# library("GENIE3")
library("ggforce")

conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")
conflict_prefer("select", "dplyr")
conflict_prefer("rename", "dplyr")
conflict_prefer("count", "dplyr")
conflict_prefer("unname", "base")
conflict_prefer("interect", "base")
# conflict_prefer("select", "clusterProfiler")

# highlight all of the todos and notes --------------------------
# todor::todor(c("NOTE", "TODO"))

# analysis configurations -------------------------------------------------
# use this section to set graphical themes, color palettes, etc.

theme_set(theme_cowplot(font_size = 12))

# rowData(cds_main)$id <- rownames(rowData(cds_main))
# rowData(cds_main)



# load, install, and/or update the project data -----------------------------

blaseRtemplates::project_data(c("~/network/X/Labs/Blaser/staff/datapkg/niche_epigenetics/huvec_multiome/",
                                "/home/OSUMC.EDU/blas02/network/X/Labs/Blaser/Brad/projects/pkc_cxcl8_data/datapkg"), deconflict_string = c("", ".pkc_cxcl8"))


new_frag_path <- system.file("extdata", "fragments.tsv.gz", package = "pkc.cxcl8.datapkg")
new_frag <- Signac::CreateFragmentObject(
   path = new_frag_path,
   cells = colnames(zf.pkc_cxcl8),
   validate.fragments = TRUE
 )
Fragments(zf.pkc_cxcl8) <- NULL
Fragments(zf.pkc_cxcl8) <- new_frag
DefaultAssay(zf.pkc_cxcl8) <- "peaks"
Idents(zf.pkc_cxcl8) <- "leiden_assignment"

zf_prkcda_trace <- bb_makeTrace(obj = zf.pkc_cxcl8,
                             genome = "danRer11",
                             peaks = zf.pkc_cxcl8@assays$peaks@ranges,
                             gene_to_plot = "prkcda",
                             extend_left = 5000,
                             extend_right = 5000)

e4_PRKCD_trace <- bb_makeTrace(obj = plyranges::filter(e4_huvec_GRange_full.pkc_cxcl8, seqnames == "chr3"),
                              gene_to_plot = "PRKCD",
                              peaks = e4_huvec_peaks.pkc_cxcl8,
                              genome = "hg38",
                              extend_left = 5000,
                              extend_right = 5000)
dir.create("data")
save(zf_prkcda_trace, file = "data/zf_prkcda_trace.rda", compress = "bzip2")
save(e4_PRKCD_trace, file = "data/e4_PRKCD_trace.rda", compress = "bzip2")


bb_plot_trace_data(zf_prkcda_trace)/
bb_plot_trace_peaks(zf_prkcda_trace)/
bb_plot_trace_links(zf_prkcda_trace)/
bb_plot_trace_model(zf_prkcda_trace)/
bb_plot_trace_axis(zf_prkcda_trace)


bb_plot_trace_data(e4_PRKCD_trace, facet_var = "group", color_var = NULL) /
bb_plot_trace_peaks(e4_PRKCD_trace)/
# bb_plot_trace_links(e4_PRKCD_trace)/
bb_plot_trace_model(e4_PRKCD_trace)/
bb_plot_trace_axis(e4_PRKCD_trace) + patchwork::plot_layout(heights = c(2, 0.25, 1, 0.1))


