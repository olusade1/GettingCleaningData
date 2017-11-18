# ---------------------------------------------------------------------------------------------------------------
# 0: Loading packages 
# ---------------------------------------------------------------------------------------------------------------


require(readr)
require(purrr)
require(stringr)
require(dplyr)


# ---------------------------------------------------------------------------------------------------------------
# 1: Getting the Data
# ---------------------------------------------------------------------------------------------------------------


dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataFile <- "UCI HAR Dataset.zip"

if (!file.exists(dataFile)) {
        download.file(dataUrl, dataFile, mode = "wb")
        dateDownloaded <- Sys.time()
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
        unzip(dataFile)
}

setwd(dataPath)

# ---------------------------------------------------------------------------------------------------------------
# 2: Reading the Data
# ---------------------------------------------------------------------------------------------------------------


#created function to simplify merging process

mergetxt <- function(x){ #x is directory
        y <- x[str_detect(x, ".txt$")]          #subset that matches ".txt"
        complist <- map(y, col_names=F, read_table)     #reads data from each txt file and stores in a list
        return(bind_cols(complist[[1]], complist[[3]], complist[[2]]))  #merges data into tbl in this order
}

# ---------------------------
#merge files in "test" folder
setwd("test")
directory <- dir()
test <- mergetxt(directory)


#merge files in "train" folder
setwd("..")
setwd("train")
directory1 <- dir()
train <- mergetxt(directory1)

#combine test and train
full <- bind_rows(test, train, .id="source")    #adds column to specify the source of the merged rows
colnms <- c("Source", "Subject", "Activity")    #names for the first 3 columns

#use features.txt to name full dataset
setwd("..")
features <- read_table("features.txt", col_names = F)
names(full)<- c(colnms, features[[1]])


# ---------------------------------------------------------------------------------------------------------------
# 3: Extract only columns containing mean and sd info
# ---------------------------------------------------------------------------------------------------------------


sdmean<- full %>% 
        select(1:3, matches("(.+mean\\(.*|.+std.*)"))


# ---------------------------------------------------------------------------------------------------------------
# 4: Identifying activities by their label
# ---------------------------------------------------------------------------------------------------------------


activity_labels <- read_table("activity_labels.txt", col_names = F)[[2]]
sdmean$Activity <- factor(sdmean$Activity, labels = activity_labels)
#convert back to character
sdmean$Activity <- as.character(sdmean$Activity)

## bonus: fix source:
sdmean$Source <- as.character(factor(sdmean$Source, labels = c("test","train")))


# ---------------------------------------------------------------------------------------------------------------
# 5: Give columns descriptive variable names
# ---------------------------------------------------------------------------------------------------------------


names(sdmean) <- sdmean %>%
                        names()%>%
                        str_replace("^[0-9]{1,3}\\s", "")%>%
                        str_replace("^t(\\w*)", "\\1TimeSignal")%>%
                        str_replace("^f(\\w*)", "\\1FrequencySignal")%>%
                        str_replace("(.+)Acc(.*)", "\\1Accelerometer\\2")%>%
                        str_replace("(.+)Gyro(.*)", "\\1Gyroscope\\2")%>%
                        str_replace("(.+)Mag(.*)", "\\1Magnitude\\2")%>%
                        str_replace("^BodyBody(.*)", "Body\\1") %>%
                        str_replace("(.*)-mean\\(\\)(-(.*))?", "\\1Mean\\2") %>%
                        str_replace("(.*)-std\\(\\)(-(.*))?", "\\1StdDev\\2")


# ---------------------------------------------------------------------------------------------------------------
# 6: Get average per variable for each subject and activity
# ---------------------------------------------------------------------------------------------------------------


averagedata <- sdmean %>%
                group_by(Subject, Activity) %>%
                select(-(1:3)) %>%
                summarise_all(funs(mean))


# 6b: Export into txt file
# ---------------------------------------------------------------------------------------------------------------

write.table(averagedata, "tidyData.txt", row.names = F)
