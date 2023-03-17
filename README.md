[![author](https://img.shields.io/badge/author-Luiz_Carlos-blue.svg)](https://www.linkedin.com/in/luiz-carlos-vieira-4582797b/) [![](https://img.shields.io/badge/python-3.8+-yellow.svg)](https://www.python.org/downloads/release/python) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/ziul-bio/transcriptome_analysis/issues) [![Other Projects](https://img.shields.io/badge/Others-Projects-red.svg?style=flat)](https://github.com/ziul-bio?tab=repositories)


<p align="center">
  <img src="banner.png" >
</p>


## Transcript-level differential expression

If we are interested in looking at splice isoform expression changes between groups, methods like DESeq2 are not recommended. Since it is more appropriate for gene differential expression. 
Therefore other methods can be used to quantify and identify transcript-level differential expression.  

So, Here I will describe the pipeline we used for transcript quantification and transcript-level differential analysis.  

* [kallisto](https://github.com/ziul-bio/lncov1_Transcriptome_Analysis/blob/main/1.0_transcriptomeAnalysis_kallisto_pipeline.md)-[sleuth](https://github.com/ziul-bio/lncov1_Transcriptome_Analysis/blob/main/2.2_sleuth.md)  

Kallisto is a method for quantification on the transcript (isoform) level, rather than the gene level. Kallisto quantifies a set of FASTA sequences, like a transcript representative genome. Thus it does not perform transcript assembly and it cannot quantify the expression of novel transcripts.  

Kallisto can be run in “bootstrap” mode to get uncertainty estimates for the expression levels - a kind of error bar for the quantification process. 
These bootstrap results are used downstream by sleuth to perform differential expression analysis of isoforms.  


## Objectives

* Quantification of transcripts-level expression.  

* Differencial expression analysis for all transcripts among the different experimental conditions.  


---