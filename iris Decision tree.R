# Load the required libraries
library(rpart)
library(rpart.plot)

# Load the Iris dataset (you can replace it with your own dataset)
data(iris)

# Split the data into training and testing sets
set.seed(123)
sample_indices <- sample(1:nrow(iris), nrow(iris) * 0.7)  # 70% training, 30% testing
train_data <- iris[sample_indices, ]
test_data <- iris[-sample_indices, ]

# Create the decision tree model
decision_tree <- rpart(Species ~ ., data = train_data, method = "class")

# Plot the decision tree (requires rpart.plot package)
prp(decision_tree)

# Make predictions on the test data
predicted_species <- predict(decision_tree, test_data, type = "class")

# Calculate accuracy on the test data
accuracy <- sum(predicted_species == test_data$Species) / nrow(test_data)
cat("Accuracy:", accuracy, "\n")
