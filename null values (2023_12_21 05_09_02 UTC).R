library(ggplot2)
library(cowplot)
library(recipes)
library(stats)
library(themis)
library(caret)
library(plyr)
library(ggcorrplot)
library(pROC)
library(readr)

telco_df <- read_csv("C:/Users/Rohitha Manne/Downloads/IBM_Telco_Customer_Churn.csv")
head(telco_df)

telco_df<- as.data.frame(unclass(telco_df),stringsAsFactors=TRUE)
telco_df['SeniorCitizen']=as.factor(telco_df$SeniorCitizen)
str(telco_df)

nrow(telco_df)

ncol(telco_df)

#for the sum of null values
sum(is.na(telco_df))

#for omitting/dropping the missing values
telco_df=na.omit(telco_df)
print(nrow(telco_df))

#no of customers left within the last month
ggplot(data=telco_df,aes(x=Churn,fill=Churn))+geom_bar() +
  geom_text(stat='count',aes(label=paste("n= ",formatC(..count..))),vjust=-0.5)+
  theme_minimal()+ggtitle("number of customer churn")+theme(plot.title=element_text(hjust=0.5))

#What distribution of monthly charges?
g1 <- ggplot(data=telco_df, aes(x=MonthlyCharges))+
  geom_histogram(aes(y=..density..),color='darkblue',fill='lightblue',binwidth=5)+
  theme_classic()+ggtitle("histogram of monthly charges")+theme(plot.title=element_text(hjust = 0.5))
g1

g2<-ggplot(data=telco_df, aes(x=MonthlyCharges))+
  geom_boxplot(fill='lavender',color='green')+
  theme_classic()+ggtitle("boxplot of monthly charges")+
  theme(plot.title=element_text(hjust = 0.5))
g2

print(plot_grid(g1,g2,ncol=1,nrow=2))

g1 <- ggplot(data=telco_df, aes(x=tenure))+
  geom_histogram(aes(y=..density..),color='darkblue',fill='lightblue',binwidth=5)+
  theme_classic()+ggtitle("histogram of monthly charges")+theme(plot.title=element_text(hjust = 0.5))
g1

g2<-ggplot(data=telco_df, aes(x=tenure))+
  geom_boxplot(fill='lavender',color='green')+
  theme_classic()+ggtitle("boxplot of monthly charges")+
  theme(plot.title=element_text(hjust = 0.5))
g2

print(plot_grid(g1,g2,ncol=1,nrow=2))

#what is the median monthly charges of churn customers?
ggplot(data = telco_df, aes(x=Churn, y=MonthlyCharges, fill=Churn))+
  geom_bar(stat = "summary", fun="median")+
  stat_summary(aes(label=paste(..y..)), fun = median, geom="text", vjust= -0.5)+
  labs(y="Median of MothlyCharges")+
  ggtitle("Median MonthlyCharges of Customers")+
  theme_minimal()+theme(plot.title = element_text(hjust=0.5))

x_categorical<-subset(telco_df,select)











