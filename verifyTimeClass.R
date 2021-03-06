
#testToken <- "12_31_99"

#is/as.Date, is/as.POSIXct: only works with 
#"%Y-%m-%d" then "%Y/%m/%d" format
#even if sub in _ or . or -,
#if date is at end, won't work...
#so just looped through various time/date options.

#times: this will return true:
#verifyTimeClass("1:00:00 pm")
#this won't:
#verifyTimeClass("1:00 pm")
verifyTimeClass <- function(token){
  
  library("lubridate")
  #initial/rough list of time and date formats.
  timeOrder <-  c("mdy", "bdY", "bdy","dmy", "dbY", "dby", "dbY",
                  "dBY HMS", "dbY HMS", "dmyHMS", "BdY H","ymd HMS","T",
                  "mdy T","dmy T","T dmy","T mdy")
  
  for(t in 1:length(timeOrder)){
    
    isTime <- guess_formats(token,timeOrder[t])
    if(!is.null(isTime)){
      
      return(TRUE)
      
    }
    
  }
  
  #not on of the various time formats we fed in.
  #so return NULL
  return(FALSE)

}