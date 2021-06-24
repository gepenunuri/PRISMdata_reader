# PRISMdata_reader
Contains a series of scripts that are easily manipulated to access the data user requires. The code can access preform computations, and vizualize data from the PRISM CLimatw Group.The data is in the form of gridded rasters over the entire US continent. There are multiple temporal scales but this code is intended for the monthly data available

This data reader was made to use with data from the [PRISM Climate Group](https://prism.nacse.org) downloaded using the PRISM data pakage [prism](https://github.com/ropensci/prism).

# Data 
For the purposes of this research the monthly data from 1951-2020 was used. This data is ziped up with multiple different documents. The easiest way to use and read the data is to turn the .bil file into a Raster file.  A Raster file is an array of data known as pixels. This is a greta form for the gridded PRISM data becasue each rectangualr array is fit for each grid in the .bil file. 
# .R files
There are four .R documents each created for the use of manipulated previously downloaded raster files. They are specified to access data from particular directories so this aspect has to be changed personally for the user. Be sure to set the correct directory before using the programs. data_crop, crops the monthly data to a specified region in the United sates, this region can be changed by the user. compute30yr_norm, computes the 50 year average over the monthly data of previously cropped data. 

Before using the code, be sure to set the current directory to the exact file.path that you have your existing PRISM files. Do the same to the end directory to set it to where you wan the data downloaded. The next important step is to make sure the file names match up with those yiu have downloaded. The majority of the time if you obtain an error it has to do with the file directory, file name, or file type. The code accesses the folder that PRISM downloads and then the .bil data inside. 
# Analysis 
There were multiple different analyis done. The first used the R code provided above to compute the 30 year normals for the monthly PRISM data for 1980-2020. The 30 year normal is the average of 30 years prior to the year in qestion, so for 1980 the average over 1951-1980 and so on for all 40 years. The data from 1951-2020 was used to compure the 30 year averages. This computation was repeated for each of the 12 months under each QOI(quantity of Interest). The four QOI's that were considered, were tempurature max(tmax), temperature min(tmin), tempuratre mean(tmean), and total anual precipitation (ppt). After this computation was complete there were a total of 1920 gridded raster files. The next task was to specify the particular months that provided the most information and preform statistical analysis on theose months.

[![leaflet example figure](vignettes/leaflet_example.png)

To recognize the most drastic climate trends with in the months over the 40 years avg30yrnorm.R was used. This took the data of a singke raster data file which covered the NE region and averaged all of its values. It produces a vectore with the average NE region QOI for each of the 40 years. These new vectors were then plottef as scatterplots and Mann-Kendall as well as lowess fit tests were preformed to rule out the months that showed no trend and to indeify the ones with the most recognizable climate trends. 

After the months were picked the second form of analysis was computed. This was taking the four QOI's for the specified months and comparing the quantities of their 30 yearnormals from 1980 to 2020. This showed directly how much of a difference there was between the entirety of th eregion The minimum, maximum, and mean values of this raster data were obtained and ploted over the 40 years. The same statistical analysis can be preformed on these newly create vectors.

To really visualize the NE climate change the comparison of 2020 to 1980 was graphed out, and a few of the consecutive years in an attempt to locate local regions that were not acting in accordance to the rest of the region 
