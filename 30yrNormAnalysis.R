library(ggplot2)

#compute the Tmin over the raster layer for a month over the 40 years individually 
myvector<-vector(mode = "numeric")
print(myvector)


year =1981
for(year in 1981:2020){
  b_name = "30yearNorm"
  e_name = "_bil"
  t_year <- toString(year,NULL)
  #t_month <- paste0("0",toString(month,NULL))
  t_month <- toString(month,NULL)
  t_name <- paste0(b_name, t_year)
  print(t_name)
  #set file path --------------------------------------------------------
  setwd(file.path("~/Desktop/30YRNORMALS/Tmin_30yrNorms/TminNorms_Oct",t_name))
  getwd()
  list.files()
  
  #compute Tmin----------------------------------------------------------
  for (ff in t_name) {
    ff<-paste0("normal",year)
    print(ff)
    bil_file <-  paste0(ff,".bil")
    print(bil_file)
    f1 <- raster(bil_file)
    
    # crop
    f1 <- cellStats(f1, stat="mean")
    print(f1)
    
    myvector<-append(myvector,f1)
    
    # save Tmin to array --------------------
    
  }
  
  
}

t<-paste0(myvector)
print(t)
#y<- paste0(myvector)
print(y)
x<-(1981:2020)
print(x)
print(myvector)

p<-plot(x,r)
test<-c(14:16)
print(test)

plot(x,y,
     xlab="Year",
     ylab="Temp C",
     main="Avg of 30yearNorms Oct",
     col="blue")
plot.new()
dev.new(width=5, height=4)
frame()
plot.window(xlim= c(1981,2020), ylim = c(0,18))
plot(x, y,
     main="Avg of 30yearNorms Oct",
     xlab="Year",
     ylab="Temp C",
     ylim=c(0,16),
     type="p",
     col="blue") 
par(new=TRUE)
points(x,r, col="red")
legend("topright",
       c("tmax","Tmin"),
       fill=c("blue","red")
)
plot(x, r,
     col="red") 

ggplot(x)

p + 
  stat_smooth(method="lm", se = FALSE) + 
  theme_bw() 
#+ ggtitle("Year average over 30yearNormals Oct")






image1<- raster(paste0("normal1982.bil"))
print(image1)
stackImg<- stack(image1)
print(stackImg)

cellStats(image1,stat="Tmin")