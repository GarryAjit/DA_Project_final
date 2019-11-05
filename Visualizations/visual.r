data = read.table(file="rating_dist.txt",sep = ',',header = FALSE)
rdata = read.csv(file="high_rated.txt",sep = ',',header = FALSE)
wdata = read.csv(file="high_watched.txt",sep = ',',header = FALSE)

#rating dist
barplot(data$V2,names.arg = data$V1,xlab = "rating",ylab = "Number of movies",col="green",axes = TRUE)

x = data$V2
labels = data$V1

piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent,col = rainbow(length(x)))
legend("topright", c("1","2","3","4","5"), cex = 0.8,
       fill = rainbow(length(x)))





#highest rated
barplot(rdata$V2,names.arg = rdata$V1,xlab = "movie",ylab = "rating",col="green",axes = TRUE)


#highest watched
barplot(wdata$V2,names.arg = wdata$V1,xlab = "movie",ylab = "no. of times watched",col="green",axes = TRUE)