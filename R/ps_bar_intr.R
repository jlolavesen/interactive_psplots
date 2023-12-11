#' Title
#'
#' @param ps A phyloseq object populated with an OTU table, an assigned taxa table, and sample data (with a column named "sample.name")
#' @param t_lvl The desired taxonomic level (e.g. Phylum, Class, Order, Genus)
#' @param n The number of most relatively abundant OTUs to plot (recommended start ~20)
#'
#' @return An interactive stacked bar plot
#' @export
#'
#' @examples
#' z <- cbind(c("Archaea","Methyltropha"),c("Bacteria","Bacteriodes"))
#' colnames(z) <- c("Phylum", "Class")
#' df <- data.frame(c("A", "B"), c("C", "D"))
#' colnames(df) <- c("sample.name", "group")
#' y <- matrix(1:4,nrow=2)
#' ps <- phyloseq::phyloseq(phyloseq::otu_table(y, taxa_are_rows = FALSE),
#' phyloseq::tax_table(z),phyloseq::sample_data(df))
#' 
#' t_lvl <- "Class"
#' n <- 20
#' ps_bar_intr(ps, t_lvl, n)
ps_bar_intr <-function(ps, t_lvl, n) {
  topn <- names(sort(phyloseq::taxa_sums(ps), decreasing=TRUE))[1:n]
  ps.topn <- phyloseq::transform_sample_counts(ps, function(OTU) OTU/sum(OTU))
  ps.topn <- phyloseq::prune_taxa(topn, ps.topn)
  
  topn_barplot <- phyloseq::plot_bar(ps.topn, x="sample.name", fill=t_lvl) + 
    ggplot2::labs(x='Sample Name', y='Relative Abundance') +
    ggplot2::theme(legend.position = 'right')
  
  plotly::ggplotly(topn_barplot)
}
