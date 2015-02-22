# Load packages
suppressMessages(require("ggplot2"))
suppressMessages(require("reshape2"))
suppressMessages(require("dplyr"))
suppressMessages(require("xtable"))

# Exploratory plots
## Pairs plot
pairs(mtcars)

## Plotting correlation matrix of variables in dataset for exploration
cormatrix <- cor(mtcars)
cormatrix.m <- melt(cormatrix)
ggplot(cormatrix.m, aes(Var1, Var2, fill=value)) +
    geom_tile() +
    scale_fill_gradient(low = "blue", high = "yellow") +
    labs(title = "Correlation Matrix of the mtcars Dataset",
         x = "", y = "")

# Stepwise selection of variables using the step() function in the base stats
# package. Method used is BIC.
model.full <- lm(mpg ~ ., data = mtcars)
n <- nrow(mtcars)
model.result <- step(model.full, direction = "both", k = log(n))
summary(model.result)

# Residual plots
par(mfrow = c(2, 2))
plot(model.result)

# Additional residual diagnostics
dfbeta.t <- dfbetas(model.result)
print(xtable(dfbeta.t), comment = F, include.rownames = T)

# Given that most points fall within an acceptable range, no modifications to
# the model or points is required.
