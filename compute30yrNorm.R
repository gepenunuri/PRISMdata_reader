#Compute 30 year normals 
dl_dir <-setwd("~/Desktop/ALL_CROPPED_DATA/NE_tmax/TmaxCropped/Jul_tmax_cropped")
getwd()
list.files()
calc_start_year= 1980
data_start_year =1951
data_end_year =2020
data_year = 1980

month = 7
b_name = "croppedPRISM_tmax_stable_4kmM3_"
e_name = "_bil"     
t_name <- paste0(b_name, t_year, t_month, e_name)
# Loops through each year from starting year to ending year (1980 to 2020)

for (data_year in  1980:2020 ){
  t_year <- toString(data_year,NULL)
  t_month <- paste0("0",toString(month,NULL))
  #t_month <- toString(month,NULL)
  t_name <- paste0(b_name, t_year, t_month, e_name)
  print(t_name)
  setwd(file.path("~/Desktop/ALL_CROPPED_DATA/NE_tmax/TmaxCropped/Jul_tmax_cropped",t_name))
  getwd()
  # Finds # of years since starting year
  diff_in_years <- data_year - calc_start_year
  print(diff_in_years)
  
  # Create variable to accumulate all the sums over the years
  mean_sum <- 0
  curr_data_start_year <- data_start_year + diff_in_years
  print(curr_data_start_year)
  # Loops through each year from the starting data year to ending data year
  sum <-raster(nrow=238,ncol=397)
  sum=0
  for (norm_year in curr_data_start_year:data_year){
    t_year <- toString(norm_year,NULL)
    t_month <- paste0("0",toString(month,NULL))
    t_name <- paste0(b_name, t_year, t_month, e_name)
    #t_month <- toString(month,NULL)
    
    print(t_name)
    setwd(file.path("~/Desktop/ALL_CROPPED_DATA/NE_tmax/TmaxCropped/Jul_tmax_cropped",t_name))
    getwd()
    fileYear<-paste0(t_name,".bil")
    print(fileYear)
    fileRaster<-raster(fileYear)
    print(fileRaster)
    # Add mean of that year to previously accumulated yearly means
    sum <- sum+fileRaster
    label<- paste0("current norm year")
    label2<- paste0("current sum")
    print(label)
    print(norm_year)
    print(label2)
    
    print(sum)
  }
  print(norm_year)
  print(sum)
  bilName <- paste0("normal",data_year,".bil")
  
  thirty_yr_norm <- sum/30
  print(thirty_yr_norm)
  
  writeRaster(thirty_yr_norm, bilName, overwrite = TRUE)
  
  
  t_year <- toString(data_year,NULL)
  t_name <- paste0(b_name, t_year, t_month, e_name)
  print(t_name)
  setwd(file.path("~/Desktop/ALL_CROPPED_DATA/NE_tmax/TmaxCropped/Jul_tmax_cropped",t_name))
  
  all_files <- list.files(".",pattern = "normal")
  #print(all_files)
  
  fileName<-paste0("30yearNorm",data_year,".zip")
  # print(fileName)
  # print(t_name)
  zip(fileName,all_files)
  # After adding all the means together,  find their average
  
  #zip up files 
  
  
  file.move( file.path("~/Desktop/ALL_CROPPED_DATA/NE_tmax/TmaxCropped/Jul_tmax_cropped",t_name,fileName),
             file.path("~/Desktop/TmaxNorms_Jul"))
  print(thirty_yr_norm)
}


