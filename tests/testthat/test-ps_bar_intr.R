z <- cbind(c("Archaea","Methyltropha"),
           c("Bacteria","Bacteriodes"))
colnames(z) <- c("Phylum", "Class")
df <- data.frame(c("A", "B"), c("C", "D"))
colnames(df) <- c("sample.name", "group")
y <- matrix(1:4,nrow=2)
ps <- phyloseq::phyloseq(
  phyloseq::otu_table(y, taxa_are_rows = FALSE),
  phyloseq::tax_table(z),
  phyloseq::sample_data(df))


test_that("ps_bar_intr works", {
  expect_no_error(ps_bar_intr(ps, "Class", 1))
})
