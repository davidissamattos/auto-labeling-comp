source("utils.R")
# 
library(knitr)
library(rmdformats)
library(kableExtra)
# #data processing
library(tidyverse)
library(glue)
# #modeling
library(rstan)
options(mc.cores = parallel::detectCores()) #use multiple cores
rstan_options(auto_write = TRUE) # we dont need to recompile
library(coda)
# # library(bayesplot)
# #plotting
library(patchwork)
library(viridis)
library(ggthemr)#devtools::install_github('cttobin/ggthemr')
ggthemr('flat')
# ggplot2::theme_replace(axis.title.y=element_blank())
# ggplot2::theme_replace(axis.text.y=element_text(size=8))
# ggplot2::theme(plot.title=element_text(face="plain", size=20))
# #others
library(progress)
library(gtools)
#sourcing local files
source("utils.R")

knitr::opts_chunk$set(
  echo=T, 
  warning=FALSE, 
  include=T,
  cache=T,
  prompt=FALSE,
  tidy=FALSE,
  comment=NA,
  message=FALSE,
  fig.align='center')
knitr::opts_knit$set(width=75)