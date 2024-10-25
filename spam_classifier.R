# Install necessary packages
install.packages("DAAG")

# Load the required libraries
library(DAAG)
library(rpart)
library(caret)

# Load the dataset
data(spam7)

# Check the structure of the dataset
str(spam7)

# Set seed for reproducibility
set.seed(12334)

# Split the dataset into training and testing sets
trainIndex <- sample(4601, 2300)  # Sample 2300 indices for training
traindata <- spam7[trainIndex, ]   # Training data
testdata <- spam7[-trainIndex, ]   # Testing data (using remaining indices)

# Build a decision tree model
stree <- rpart(yesno ~ ., data = traindata, method = "class")

# Plot the decision tree
plot(stree)
text(stree, use.n = TRUE)

# Predict the class for the test dataset
pred <- predict(stree, testdata, type = "class")

# Display the predictions
print(pred)

# Evaluate the model with a confusion matrix
confusionmat <- confusionMatrix(pred, testdata$yesno)

# Print the confusion matrix and performance metrics
print(confusionmat)
