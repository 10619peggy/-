people = read.csv("d:/jyCharacters.csv")

dim(people)
names(people)
head(people,3)	# tail(people,5) 看最後五列

mean(people$age)		# median, sd, var, sum, .....
summary(people$luck)
table(people$gender)
table(people$rank)
table(people$ending)
stem(people$luck)		# 枝葉圖 (stem and leaf)
# histogram 直方圖
hist(people$age,col=rainbow(15),xlab="年齡",ylab="人數")
# 長條圖
barplot(table(people$rank),col=rainbow(7))
pie(table(people$rank),col=rainbow(12),main="角色比例")
boxplot(property ~ gender,data=people,col=rainbow(12))

# 哪些因素決定一個角色的重要性(rank) ?
people2 = subset(people,select=-c(name,note)) # 去除姓名跟備註
people2$rank = ordered(people2$rank)		# 轉為順序型分類變數
library(rpart)			# 載入(load) rpart 套件, 只需做一次
result = rpart(rank~.,data=people2,control=rpart.control(minsplit = 5))
plot(result);text(result)
result

