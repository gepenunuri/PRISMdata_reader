plot.new()
#dev.new(width=10, height=15)
#frame()
#plot.window(xlim= c(1981,2020), ylim = c(0,18))
plot(x, y,
     main="Avg of 30yearNorms Tmax Oct",
     xlab="Year",
     ylab="Temp C",
     type="p",
     col="purple") 
#par(new=TRUE)
plot.new()
#dev.new(width=10, height=15)
plot(x, t,
     main="Avg of 30yearNorms Tmin Oct",
     xlab="Year",
     ylab="Temp C",
     type="p",
     col="orange") 
points(x,r, col="yellow")


plot.new()
#dev.new(width=10, height=15)
plot(x, w,
     main="Avg of 30yearNorms Tmean Oct",
     xlab="Year",
     ylab="Temp C",
     type="p",
     col="green") 
plot.new()
#dev.new(width=10, height=15)
plot(x, r,
     main="Avg of 30yearNorms PPT Oct",
     xlab="Year",
     ylab="Rainfall (in)",
     type="p",
     col="blue") 
lines(lowess(x,t),col="black")
#abline(lm(y~x), col="red")


legend("topleft",
       c("lowess"),
       fill=c("black")
)

#----------- Kendall test
install.packages("Kendall")
library(Kendall)
print(y)
MannKendall(y)
ts<-ts(y,start=1981,end=2020)
is.ts(ts)
tau<-SeasonalMannKendall(ts)
print(tau)
