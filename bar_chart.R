library(ggplot2)
library(scales)

yaxis <- dataset$'Value'
xaxis <- dataset$'Student Name'

inversed_val <- 5 - yaxis
xaxis <- factor(xaxis, levels = xaxis[order(yaxis)])
p <- ggplot(dataset, aes(x= xaxis, y= inversed_val))+
      expand_limits(y=c(1, 4))+
      geom_bar(stat="identity",fill="dodgerblue4")+
      geom_text(aes(label=sprintf("%0.1f", round(yaxis, digits = 1))),
                position = position_stack(vjust = 0.5), 
                color="white", size=5)+
      theme(panel.background = element_blank(), 
      axis.title.y=element_blank(), 
      axis.text=element_text(size=12, angle = 45), 
      axis.title.x=element_blank(),
      axis.text.y=element_text(colour="black"))
      
      
p + scale_y_discrete(breaks=c(0,1,2),
        labels=c("D0.5", "D1", "D2"))
