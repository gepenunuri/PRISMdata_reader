#Crop data to specified region(original is the NE region of the United states)
#reads in PRISM data, crops to smaller region, adds newly cropped data to new directory 
#The code right now is set for the purpose of dealing with the monthly data over a time series 
#but can be easily manipulated to read in the other time series data

#necessary libraries--------------------------
library(raster)
library(prism)
library(filesstrings)

#Set directory where downloaded files are-----------------------------------
dl_dir <-setwd("~/Desktop/createPPT/PPTpre")
getwd()
prism_set_dl_dir(dl_dir) #if downloading data to said directory must set the prism_set_dl_dir()
getwd()
list.files()# checks to make sure it is in the correct directory 


# Use if need to download monthly data
#download monthly data for(1980-2020)
#get_prism_monthlys(type="ppt", years = 1951:1980, mon=1:12, keepZip= FALSE, keep_pre81_months = TRUE)


#=========================================


year = 1951 #set start year

month = 2 #specify month 

b_name = "PRISM_ppt_stable_4kmM2_"# make sure this matches the name of your files
e_name = "_bil"      

#coordinates of region wanted, subject  to change 
ss <- extent(-83, -66, 40, 50)
ss <- raster::extent(ss)

#loops through the files for specified month over the years
for (year in 1951:1980 ){
  t_year <- toString(year,NULL)
  
  # change for month needed
  t_month <- paste0("0",toString(month,NULL))
  #t_month <- toString(month,NULL)
  
  t_name <- paste0(b_name, t_year, t_month, e_name)
  print(t_name) 
  
  #GET FILE
  dl_dir <-setwd("~/Desktop/createPPT/PPTpre")
  getwd()
  #CROP the files
  for (ff in t_name) {
    print(ff)
    bilName <- paste0("cropped",ff,".bil")
    print(bilName)
    setwd(file.path("~/Desktop/createPPT/PPTpre",ff))
    getwd()
    #access the .bil file
    bil_file <-  paste0(ff,".bil")
    print(bil_file)
    #needs to be in raster format
    f1 <- raster(bil_file)
    
    # crop
    f1 <- crop(f1, ss)
    
    # save file --------------------
    
    writeRaster(f1, bilName, overwrite = TRUE)
  }
  #zip up new cropped files
  orig_wd <- getwd()
  on.exit(setwd(orig_wd))
  
  for (ff in t_name) {
    print(ff)
    #resents file path 
    setwd(file.path("~/Desktop/createPPT/PPTpre", ff))
    
    #gets all newly cropped files in previous folder 
    all_files <- list.files(".",pattern = "cropped")
    print(all_files)
    tmp_zip <- paste0("cropped",ff, ".zip")
    print(tmp_zip)
    print(dl_dir)
    print(ff)
    zip(tmp_zip, all_files)
    # test1<-paste0(file.path("~/Desktop/createPPT/PPTpre")
    # test2<- paste0(file.path(dl_dir, ff, tmp_zip))
    # print(test1)
    # print(test2)
    setwd(orig_wd)
    getwd()
    #moves new files into new directory/ folder 
    file.move( file.path("~/Desktop/createPPT/PPTpre", ff, tmp_zip),
               file.path("~/Desktop/createPPT/PPTCropped/Dec_ppt_cropped"))
  }
  month = 2 #month <- month+ 1
}


