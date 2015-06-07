plot1 <- function()
{
    ##read the data
    a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
    
    ## limit the rows to the two dates in question
    data<-a[a[,1]=="1/2/2007"|a[,1]=="2/2/2007",]
    
    ##convert the Global Active Power column to a numeric
    data[,3]<-as.numeric(data[,3])
    
    ##Open the PNG file
    png(filename="plot1.png",width=480,height=480)
    
    ##make the plot
    hist(data[,3],xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
    
    ##close the file
    dev.off()
}