rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(ape)
source('cfml_results.R')

#SIMULATION
system('../SimBac -N 50 -B 50000 -R 0 -T 0.01 -r 0.001 -e 1000 -m 0.05 -M 0.05 -o sim.fasta -c sim.nwk -l sim.local.nwk -b sim.int.csv -f sim.ext.csv')

#RUN CFML
system('ClonalFrameML sim.nwk sim.fasta sim.out -kappa 1')
suppressWarnings(cfml_results('sim.out',showcols=T,scalingbar=1))
system('open sim.out.cfml.pdf;head sim.out.em.txt')

