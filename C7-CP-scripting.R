# Load packages
suppressMessages(require("ggplot2"))
suppressMessages(require("xtable"))

# Plotting scatterplots of mpg on other variables as part of exploratory data analysis
pairs(mtcars)

# Calculate correlation coefficients between mpg and other variable as part of exploration
cormatrix <- cor(mtcars)[ , 1]
print(xtable(dosetable), comment = F, include.rownames = F)

# Pick out variables with absolute correlation > 0.5
fm <- NULL
for (i in 1:length(cormatrix)) {
    if (abs(cormatrix[i]) > 0.5 & names(cormatrix)[i] != "mpg") {
        if (is.null(fm)) {
            fm <- names(cormatrix)[i]
        } else {
            fm <- paste(fm, names(cormatrix)[i], sep = " + ")
        }
    }
}
fm <- paste("mpg ~ ", fm, sep = "")