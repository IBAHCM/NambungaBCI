#' Running demo for biodiversity calculation 
library(NambungaBCI)

# Make a copy of the taxonomy as a data frame
taxonomy <- as.data.frame(bci_taxa)

# Make sure the species are ordered correctly
rownames(taxonomy) <- taxonomy$GenusSpecies
taxonomy <- taxonomy[rownames(bci_2010),]

library(rdiversity)
meta <- metacommunity(bci_2010)
results <- meta_gamma(meta, qs = seq(from = 0, to = 5)) 
plot(diversity ~ q, type = "l", data = results)

# Creating a metacommunity to assess the similarity between species
library(magrittr)
taxSim <- taxonomy %>%
  tax2dist(c(GenusSpecies=0, Genus=1, Family=2, Other=3)) %>%
  dist2sim("linear") 
metatax <- metacommunity(bci_2010, taxSim)
results4tax <- meta_gamma(metatax, qs = seq(from = 0, to = 5)) 
lines(diversity ~ q, col=2, data = results4tax)

# Creating a metacommunity to be analysed in {vegan} and transpose
# the axes of the abundance data matrix

library(vegan)

# Swap rows and columns 
abundances <- t(bci_2010)

# Calculate species richness (gamma diversity)
specnumber(abundances, groups = 1) 
