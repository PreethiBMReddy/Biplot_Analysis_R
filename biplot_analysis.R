# Load necessary libraries
library(readxl)
library(ggplot2)
library(factoextra)

# Step 1: Load the data
file_path <- "Downloads/Line trial data.xlsx"
df <- read_excel(file_path, sheet = "Line trial", skip = 1)

df[ , 1:10]
# Step 2: Select relevant columns
data_selected <- df[, c("Total Count at INMF", "Total Weight at INMF",
                        "Total Count at INKL", "Total Weight at INKL")]

# Remove rows with NA
data_clean <- na.omit(data_selected)

# Step 3: Perform PCA
pca_result <- prcomp(data_clean, scale. = TRUE)

# Step 4: Biplot visualization
fviz_pca_biplot(pca_result, repel = TRUE,
                col.var = "red", # variable vectors in red
                col.ind = "gray", # individuals in gray
                title = "Biplot: Fruit Count and Weight at INMF vs INKL")

# Step 5 (Optional): Compute average counts and weights
cat("Average Counts and Weights by Location:\n")
cat("INMF - Count:", mean(data_clean$`Total Count at INMF`), "\n")
cat("INMF - Weight:", mean(data_clean$`Total Weight at INMF`), "\n")
cat("INKL - Count:", mean(data_clean$`Total Count at INKL`), "\n")
cat("INKL - Weight:", mean(data_clean$`Total Weight at INKL`), "\n")

