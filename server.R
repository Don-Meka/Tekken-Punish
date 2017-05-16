shinyServer(function(input, output){
  ##Pics
  output$chpic <- renderImage({
    picfile <- tempfile(fileext = '.png')
    picname <- normalizePath(file.path('./images', paste(input$character, '.png', sep='')))
    
    list(src = picname,
         alt = paste(input$character), 
         width = 144,
         height = 252)
  }, deleteFile = F)
  
  output$oppic <- renderImage({
    picfile <- tempfile(fileext = '.png')
    picname <- normalizePath(file.path('./images', paste(input$opponent, '.png', sep='')))
    
    list(src = picname,
         alt = paste(input$opponent), 
         width = 144,
         height = 252)
  }, deleteFile = F)
  
  
  ##Frame Data
  output$chdata <- renderDataTable({
    fdata <- read.csv(file.path('./data', paste(input$character, '.csv', sep='')))
    fdata <- fdata[fdata$WS1R == c(input$WS) | grepl("u", fdata$Command) == TRUE, ] 
    ##Subsetting by the WS or "u" variable has to be done separately 
    ##and first to get the whole thing to work for some complicated reason
    fdata <- fdata[fdata$StartR <= -input$opblock[1], ] 
    fdata <- fdata[fdata$PunishR == c(input$punish), ]
    fdata <- fdata[ ,c("Command", "Hit_Level", "Startup_Frames", "Hit_Frames")]
    fdata
  }, options = list(searching = FALSE, paging = FALSE))
  
  output$opdata <- renderDataTable({
    fdata <- read.csv(file.path('./data', paste(input$opponent, '.csv', sep='')))
    fdata <- fdata[fdata$BlockR >= input$opblock[1] & fdata$BlockR <= input$opblock[2] & fdata$WS2R == c(input$WS) | fdata$SP_Punish == "[A-z]", c("Command", "Hit_Level", "Block_Frames", "SP_Punish")]
    fdata
  }, options = list(searching = FALSE, paging = FALSE))
  
})
