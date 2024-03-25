library("COINr")
library("coin")

install.packages("Compind")
library("Compind")

#Fuzzy Indicator
data <- read.csv("C:\\Users\\Njula Chakaya\\OneDrive\\Documents\\KENET\\CFI.csv")
data$HFPI <- round(data$HFPI, 2)
data$Rank <- as.numeric(data$Rank)
data$uName <- trimws(data$uName)


#Load datasets for the coin 
iData <- "C:\\Users\\Njula Chakaya\\Downloads\\HFAIndData.rdata"
load(iData)

mData <- "C:\\Users\\Njula Chakaya\\Downloads\\HFAIndMeta.rdata"
load(mData)

dim(HFAIndData)
dim(HFAIndMeta)

#Create/Assemble coin

coin <- new_coin(iData = HFAIndData, iMeta = HFAIndMeta)

coin

#Check for null values
sum(is.na(coin$Data$Raw))

#Normalise the data, default is min-max
coin <- Normalise(coin, dset = "Raw",  global_specs = list(f_n = "n_minmax",f_n_para = list(c(0,1))))
print(head(coin$Data$Normalised))

#Aggregate the data, default is weighted arithmetic mean
coin <- Aggregate(coin, dset = "Normalised", f_ag = "a_amean")

#Examining aggregated data
dset_aggregated <- get_dset(coin, dset = "Aggregated")
nc <- ncol(dset_aggregated)
dset_aggregated[(nc - 5) : nc] |>
  head(5) 

#Results tables with equal weighting ie 1
df <- get_results(coin, dset = "Aggregated", also_get = "uName") 

df

# Weighting using PCA
coin <- get_PCA(coin, dset = "Aggregated", weights_to = "PCAWeights", out2 = "coin")

coin <- Aggregate(coin, dset = "Normalised", w = "PCAWeights")

pca_df <- get_results(coin, dset = "Aggregated", also_get = "uName")

pca_df

#Weighting using factor analysis and compind package
help("ci_factor")
result <- ci_factor(dset_aggregated, indic_col = 2:ncol(dset_aggregated),method = "ONE")

result$ci_factor_est

compare_df(df, pca_df, matchcol = "uName")
compare_df(df, data, matchcol = "uName")
compare_df(pca_df, data, matchcol = "uName")
str(df)
str(data)
str(pca_df)



#Sensitivity Analysis
#1. Tweak normalisation method
norm_alts <- list(
  list(f_n = "n_minmax", f_n_para = list(c(1,100))),
  list(f_n = "n_zscore", f_n_para = list(c(10,2)))
)

l_norm <- list(Address = "$Log$Normalise$global_specs",
               Distribution = norm_alts,
               Type = "discrete")

#2, Tweak the Weights
w_nom <- coin$Meta$Weights$Original

noise_specs <- data.frame(Level = c(2,3) , NoiseFactor = c(0.25,0.25))

noisy_wts <- get_noisy_weights(w = w_nom, noise_specs = noise_specs, Nrep = 100)

l_weights <- list(Address = "$Log$Aggregate$w",
                  Distribution = noisy_wts,
                  Type = "discrete")

#3. Tweak the aggregation
l_agg <- list(Address = "$Log$Aggregate$f_ag",
              Distribution = c("a_amean", "a_gmean"),
              Type = "discrete")

#Specification list
SA_specs <- list(
  Normalisation = l_norm,
  Weights = l_weights,
  Aggregation = l_agg
)

SA_res <- get_sensitivity(coin, SA_specs = SA_specs, N = 100, SA_type = "SA",
                          dset = "Aggregated", iCode = "HFPI", Nboot = 100)
y
y


SA_res$RankStats

