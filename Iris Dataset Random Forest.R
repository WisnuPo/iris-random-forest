# install machine learning package
install.packages("caret")
library(caret)

# import dataset iris
data("iris")
iris

# eda
class(iris) # melihat kelas dari dataset iris
str(iris) # melihat struktur dataset iris
colSums(is.na(iris)) # melihat missing value dari setiap kolom
sum(is.na(iris)) # melihat total missing value

# mempartisi data
set.seed(42)
trainIndex <- createDataPartition(iris$Species, times = 1, p = 0.8, list = FALSE)

irisTrain <- iris[trainIndex,]
irisTest <- iris[-trainIndex,]

# membuat model machine learning random forest
irisTrain
model <- train(Species ~ ., data = irisTrain, method = "rf")

# memprediksi data baru
predict <- predict(model, newdata = irisTest)

# melakukan evaluasi
confusionMatrix(predict, irisTest$Species)