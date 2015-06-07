plot2 <- function()
{
    ##read the data
    a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

    ##limit the rows to the two dates in question
    data<-a[a[,1]=="1/2/2007"|a[,1]=="2/2/2007",]
    
    ##create separate vector that combines date and time
    date_vector<-paste(data[,1],data[,2],sep=" ")
    
    ##turn this vector into an R date type
    
    date_vector<-strptime(date_vector,format="%d/%m/%Y %T")
    
    ##make new data frame with date_vector as the first column
    
    comb<-data.frame(time=date_vector,data[,3:9])
    
    ##convert the Global Active Power column to a numeric
    comb[,2]<-as.numeric(comb[,2])
    
    ##Open the PNG file
    png(filename="plot2.png",width=480,height=480)
    
    ##make the plot
    plot(comb[,1],comb[,2],type="l",ylab="Global Active Power (kilowatts)",xlab="")
    
    ##close the file
    dev.off()

    
}