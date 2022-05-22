# 'Mail Merge in 2018': automate report production with R
# Read data and loop through to produce reports


# Read data ---------------------------------------------------------------


# Read in the CSV data as a dataframe object
# Each row is an episode of the first season of Dawson's Creek
library(tidyverse)
library(readr)  # for read_csv()
library(sjmisc)
data <- read_csv(file = "data/missedout.csv")  # path to file
data$lon

# Loop --------------------------------------------------------------------


library(rmarkdown)  # for render

for (i in data$index){  # for each unique episode
  
  # Isolate that episode from the dataset
  
  number <- data[data$index == i, ]  
  
  # The one-row dataframe object 'episode' we just created will be used as the
  # source for filling the details in on the template file
  
  # Now render ('knit') the R Markdown file to Word format, name it and save it
  
  render(
    input = "02_template.rmd",  # path to the template
    output_file = paste0("letter_", i, ".docx"),  # name the output
    output_dir = "output2"  # folder in which to put the output file
  )

}  # end of loop
