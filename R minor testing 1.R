library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(caret)

# Load data from Excel file
data <- read_excel("C:/Users/Rohitha Manne/Downloads/Book3.xlsx")

# Ensure the correct column name
data$Category <- factor(data$Category, levels = levels(data$Category))

# Convert 'Month' to a factor with ordered levels
data$Month <- factor(data$Month, levels = month.name, ordered = TRUE)

# Handle missing values
data <- na.omit(data)

# Create a linear regression model
lm_model <- lm(Amount ~ Category + Month, data = data)

# Check if there are enough observations for splitting
if (nrow(data) >= 2) {
  # Split the data into training and testing sets
  set.seed(123)
  train_index <- createDataPartition(data$Amount, p = 0.8, list = FALSE)
  train_data <- data[train_index, ]
  test_data <- data[-train_index, ]
  
  
  # Make predictions on the test set
  predictions <- predict(lm_model, newdata = test_data)
  
  # Plot actual vs predicted values
  ggplot() +
    geom_point(data = data.frame(Actual = test_data$Amount, Predicted = predictions), aes(x = Predicted, y = Actual), color = "blue",size = 4) +
    geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
    labs(title = "Actual vs Predicted Values",
         x = "Predicted Values",
         y = "Actual Values") +
    theme_minimal()
} else {
  print("Not enough observations for splitting.")
}


# Specify the category and month for prediction
new_category <- "Cell phones"
new_month <- "January"  # Replace with the actual month you want to predict for

# Check if the specified category and month are present in the levels of the training data
if (new_category %in% levels(data$Category) && new_month %in% levels(data$Month)) {
  # Create a new data frame with the specified category and month
  new_data <- data.frame(Category = new_category, Month = new_month)
  
  # Ensure 'Category' and 'Month' are factors with the same levels as the training data
  new_data$Category <- factor(new_data$Category, levels = levels(data$Category))
  new_data$Month <- factor(new_data$Month, levels = levels(data$Month))
  
  # Make predictions using the linear regression model
  predicted_amount <- predict(lm_model, newdata = new_data)
  
  # Print the predicted amount
  cat("Predicted amount for", new_category, "in", new_month, ":", predicted_amount, "\n")
} else {
  cat("Specified category or month not found in the training data.\n")
}