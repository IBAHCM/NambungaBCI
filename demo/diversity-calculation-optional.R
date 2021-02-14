#' Running the calculation of BIC

library(NambungaBCI)

# Make a copy of the taxonomy as a data frame
taxonomy <- as.data.frame(bci_taxa)

# Make sure the species are ordered correctly
rownames(taxonomy) <- taxonomy$GenusSpecies
taxonomy <- taxonomy[rownames(bci_2010),]

# Gamma and alpha diversity calculation and plotting for 2010_bci census, for a 
# range of values of q, qs = 0:5.

library(rdiversity)
meta <- metacommunity(bci_2010)
results <- meta_gamma(meta, qs = seq(from = 0, to = 5))
plot(diversity ~ q, type = "l", data = results)

# Recalculation using taxonomic similarity, showing that there
# are fewer taxonomically distinct species than there are species.
# And counting again the effective number of genera and families.

library(magrittr)
taxSim1 <- taxonomy %>%
  tax2dist(c(GenusSpecies=0, Genus=0, Family=1, Other=1)) %>%
  dist2sim("linear")

taxSim2 <- taxonomy %>%
  tax2dist(c(GenusSpecies=0, Genus=0, Family=0, Other=1)) %>%
  dist2sim("linear")

# The distance between these two species are zero indicating that they are of 
# the same species.
# The diversity measures will simply count in effective numbers of genera or 
# families, respectively, rather than species.

metatax <- metacommunity(bci_2010, taxSim1)
results4tax <- meta_gamma(metatax, qs = seq(from = 0, to = 5))
lines(diversity ~ q, col=2, data = results4tax)

metatax <- metacommunity(bci_2010, taxSim2)
results4tax <- meta_gamma(metatax, qs = seq(from = 0, to = 5))
lines(diversity ~ q, col=3, data = results4tax)

# Here the diversity measures were dropped with fewer taxonomically distinct 
# species than there are species.

#' Calculation of beta diversity

library(vegan)

# Swap rows and columns
abundances <- t(bci_2010)

# Calculate species richness
specnumber(abundances, groups = 1)
