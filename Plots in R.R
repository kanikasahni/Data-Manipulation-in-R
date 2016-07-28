#### GRAPHICS ####

LungCapData <- read.csv(file.choose(), header = T)
attach(LungCapData)

## BAR CHART ##
count <- table(Gender)
count
barplot(count)
barplot(count, main = "Title")
barplot(count, main = "Title", xlab = "Gender", ylab = "Frequency")
barplot(count, main = "Title", xlab = "Gender", ylab = "Frequency", names.arg = c("Female", "Male"))
barplot(count, main = "Title", xlab = "Gender", ylab = "Frequency", names.arg = c("Female", "Male"),
        ylim = c(0,400))
barplot(count, main = "Title", xlab = "Frequency", ylab = "Gender", names.arg = c("Female", "Male"),
        horiz = T)


## PIE CHART ##
pie(count)
pie(count, labels = c("Female", "Male"))
pie(count, labels = c("Female", "Male"), radius = 1.5)
box()


## BOX PLOT ##
boxplot(LungCapData)
quantile(LungCap, probs = c(0, 0.25, 0.5, 0.75, 1))
quantile(LungCap, probs = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))
boxplot(LungCap)
boxplot(Age)
boxplot(Height)
boxplot(LungCap~Gender)
boxplot(LungCap~Gender, las = 1)
boxplot(LungCap[Gender == "female"],LungCap[Gender == "male"], names = c("Female", "Male"))


## HISTOGRAM ##
hist(LungCap)
hist(LungCap, breaks = 7)
hist(LungCap, breaks = c(0,2,4,6,8,10,12,14,16))
hist(LungCap, breaks = seq(from = 0, to = 16, by = 2))
lines(density(LungCap), col = 2, lwd = 3)
hist(LungCap, breaks = seq(from = 0, to = 16, by = 2), probability = T)
lines(density(LungCap), col = 2, lwd = 3)


## STEM & LEAF PLOTS ##
femaleLungCap <- LungCap[Gender == "female"]
stem(femaleLungCap)
stem(femaleLungCap, scale = 2)


## STACKED BAR CHARTS, CLUSTERED BAR CHARTS and MOSAIC PLOTS ##
table1 <- table(Smoke, Gender)
table1
barplot(table1)
barplot(table1, beside = T)
barplot(table1, beside = T, legend.text = T)
barplot(table1, beside = T, legend.text = c("Non-Smoker", "Smoker"))
mosaicplot(table1)
mosaicplot(table1, main = "MOSAIC PLOT", las = 1, color = c(2,4))


## SCATTERPLOTS ##
plot(Age, Height)
plot(Age, Height, cex = 0.6)
plot(Age, Height, cex = 0.6, pch = 8)
plot(Age, Height, cex = 0.6, pch = 8, col = 3)
abline(lm(Height~Age))
abline(lm(Height~Age), col = "blue")
lines(smooth.spline(Age, Height))
lines(smooth.spline(Age, Height), col = 2)
lines(smooth.spline(Age, Height), col = 2, lty = 4, lwd = 3)


## NUMERIC SUMMARIES FOR NUMERIC and CATEGORICAL VARIABLES ##
names(LungCapData)
table(Smoke)              # Frequency Table
table(Smoke, Gender)      # Contingency Table
sum(LungCap)
mean(LungCap)
median(LungCap)
var(LungCap)
sd(LungCap)
min(LungCap)
max(LungCap)
range(LungCap)
quantile(LungCap)
cor(LungCap, Age)
cor(LungCap, Age, method ="pearson")
cor(LungCap, Age, method ="kendall")
cor(LungCap, Age, method ="spearman")
cov(LungCap, Age)


## MODIFYING PLOTS ##
plot(Age, Height, main = "ScatterPlot")
plot(Age, Height, main = "ScatterPlot", cex = 0.5)
plot(Age, Height, main = "ScatterPlot", cex = 0.5, cex.main = 1.5, cex.lab = 1, cex.axis = 0.7)
plot(Age, Height, main = "ScatterPlot", font.main = 4, font.lab = 2, font.axis = 3)

plot(Age, Height, main = "ScatterPlot", pch = 2)
plot(Age, Height, main = "ScatterPlot", pch = "w")
abline(lm(Height~Age), col = 2, lty = 3, lwd = 3)

plot(Age[Gender == "male"], Height[Gender == "male"], col = 4, pch = "m")
plot(Age[Gender == "female"], Height[Gender == "female"], col = 6, pch = "f")

par(mfrow= c(1, 2))
plot(Age[Gender == "male"], Height[Gender == "male"], xlab = "Age", ylab = "Height",
     main = "Height vs Age for Males", cex = 0.7)
plot(Age[Gender == "female"], Height[Gender == "female"], xlab = "Age", ylab = "Height",
     main = "Height vs Age for Females", cex = 0.7)

par(mfrow= c(1, 1))
plot(Age[Gender == "male"], Height[Gender == "male"], xlab = "Age", ylab = "Height",
     main = "Height vs Age for Males", cex = 0.7)
axis(side = 1, at = c(7, mean(Age[Gender=="male"]), 15, 18), labels = c("7", "Mean", "15", "18"))
text(x = mean(Age[Gender == "male"]), y = mean(Height[Gender == "male"]), label = " Mean ")

plot(Age[Gender == "male"], Height[Gender == "male"], xlab = "Age", ylab = "Height",
     main = "Height vs Age for Males", cex = 0.7)
axis(side = 1, at = c(7, mean(Age[Gender=="male"]), 15, 18), labels = c("7", "Mean", "15", "18"))
text(x = mean(Age[Gender == "male"]), y = mean(Height[Gender == "male"]), label = " Mean ")
text(x = mean(Age[Gender == "male"]), y = mean(Height[Gender == "male"]), label = " Mean using text", adj = 0)
text(x = mean(Age[Gender == "male"]), y = mean(Height[Gender == "male"]), label = " Mean using text", adj = 1)

abline(h = mean(Height), col = 2, lwd = 2)    # horizontal line at mean of Heights
mtext(text = "Mean using mtext", side = 3)
mtext(text = "Mean using mtext", side = 3, adj = 0)
mtext(text = "Mean using mtext", side = 3, adj = 1)
