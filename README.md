
<!-- README.md is generated from README.Rmd. Please edit that file -->

# interactive.psplots

<!-- badges: start -->
<!-- badges: end -->

The goal of interactive.psplots is to generate an interactive stacked
bar plot from a phyloseq object. The plot will show the relative
abundances of the most common taxa and allows the user to specify the
number of most abundant taxa as well as the taxonomic level
(e.g. Phylum, Class, Order, etc.). This package may be useful if you’ve
recently processed sequence data (e.g. 16S) through a pipeline like
mothur or dada2 and would like to quickly create a visualization to
probe the results and guide further inquiry or visualization direction.

Phyloseq class objects have several components, some of which are
optional. This package requires your phyloseq to include an OTU table,
an assigned taxa table, and a data frame with sample data. *IMPORTANT*
this package expects a column in your sample data to be titled
“sample.name”.

The included ps_bar_intr() function requires three inputs (see example
below): a phyloseq object, the taxonomic level desired for visualization
(as a string which *must* match the title of one of the columns in your
phyloseq’s taxa table), and the number of most abundant taxa you would
like displayed on the plot. Once the plot generates, hovering the cursor
over the bars will display the corresponing relative abundance, taxa
name, and sample name.

## Installation

You can install the development version of interactive.psplots from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jlolavesen/interactive.psplots")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(interactive.psplots)

## buildng a simple, nonsensical phyloseq object for example purposes
z <- cbind(c("Archaea","Bacteria"),c("Methyltropha","Bacteriodes"))
colnames(z) <- c("Phylum", "Class")
df <- data.frame(c("A", "B"), c("C", "D"))
colnames(df) <- c("sample.name", "group")
y <- matrix(1:4,nrow=2)
ps <- phyloseq::phyloseq(
  phyloseq::otu_table(y, taxa_are_rows = FALSE),
  phyloseq::tax_table(z),
  phyloseq::sample_data(df))

##generating the interactive plot
ps_bar_intr(ps, "Phylum", 2)
```

<div class="plotly html-widget html-fill-item" id="htmlwidget-ab5c2b54d06a69d27bd7" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-ab5c2b54d06a69d27bd7">{"x":{"data":[{"orientation":"v","width":[0.90000000000000013,0.89999999999999991],"base":[0.66666666666666663,0.75],"x":[2,1],"y":[0.33333333333333337,0.25],"text":["Phylum: Archaea<br />sample.name: B<br />Abundance: 0.3333333","Phylum: Archaea<br />sample.name: A<br />Abundance: 0.2500000"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"name":"Archaea","legendgroup":"Archaea","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.89999999999999991,0.90000000000000013],"base":[0,0],"x":[1,2],"y":[0.75,0.66666666666666663],"text":["Phylum: Bacteria<br />sample.name: A<br />Abundance: 0.7500000","Phylum: Bacteria<br />sample.name: B<br />Abundance: 0.6666667"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(0,191,196,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"name":"Bacteria","legendgroup":"Bacteria","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.228310502283108,"r":7.3059360730593621,"b":34.33789954337901,"l":48.949771689497723},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,2.6000000000000001],"tickmode":"array","ticktext":["A","B"],"tickvals":[1,2],"categoryorder":"array","categoryarray":["A","B"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y","title":{"text":"Sample Name","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.050000000000000003,1.05],"tickmode":"array","ticktext":["0.00","0.25","0.50","0.75","1.00"],"tickvals":[0,0.25,0.5,0.75,1],"categoryorder":"array","categoryarray":["0.00","0.25","0.50","0.75","1.00"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.6529680365296811,"tickwidth":0.66417600664176002,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":{"text":"Relative Abundance","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"Phylum","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"c89310db1fa5":{"fill":{},"x":{},"y":{},"type":"bar"}},"cur_data":"c89310db1fa5","visdat":{"c89310db1fa5":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
