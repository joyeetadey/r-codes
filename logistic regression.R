df <- read.table("C:/Users/Joyeeta/Desktop/sem6/da_lab/Social_Network_Ads.csv",header=TRUE,sep=",")
head(df,3)

df$Gender <- as.factor(df$Gender)
df$Purchased <- as.factor(df$Purchased)
mymodel <- glm(Purchased~Age+Gender+EstimatedSalary, data=df, family='binomial')

plot(mymodel)


summary(mymodel)

res <- predict(mymodel, df, type='response')
res

head(res,5)
library(dplyr)
df <- res%>%
  mutate(result=ifelse(res$x>0.5,1.0,0.0))

write.csv(res,'C:/Users/Joyeeta/Desktop/sem6/da_lab/result.csv', row.names = FALSE)
cfmatrix <- table(Act=df$Purchased, pred=res>0.5)
cfmatrix

Accuracy=(cfmatrix[[1,1]]+cfmatrix[[2,2]])/sum(cfmatrix)
Accuracy

#whther to accept model or not and accuracy of more than 75% accuracy
#summary of the model in 