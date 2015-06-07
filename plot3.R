plot3 <- function()
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
    
    ##convert the energy sub metering columns to numerics
    
    comb[,6]<-as.numeric(comb[,6])
    comb[,7]<-as.numeric(comb[,7])
    comb[,8]<-as.numeric(comb[,8])
    
    ##Open the PNG file
    png(filename="plot3.png",width=480,height=480)
    
    ##make the plot
    plot(comb[,1],comb[,6],type="l",col="black",xlab="",ylab="Energy sub metering")
    lines(comb[,1],comb[,7],type="l",col="red")
    lines(comb[,1],comb[,8],type="l",col="blue")
    legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="o")
    
    ##close the PNG file
    dev.off()
}