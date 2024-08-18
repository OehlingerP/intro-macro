library(rsconnect)
rsconnect::deployApp( "/Users/peteroehlinger/Library/CloudStorage/Dropbox/_supplyChain/intro-macro" )


# checks for .rscignore file and excludes the files and directories listed 
if (".rscignore" %in% contents) { 
  ignoreContents <- readLines(".rscignore") 
  contents <- setdiff( 
    x = contents, 
    y = ignoreContents 
  ) 
} 

contents <- list.files(all.files = T, include.dirs = T)
?list.files
