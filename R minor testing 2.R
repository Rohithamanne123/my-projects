library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(caret)

# Load data from the specified Excel file
data <- read_excel("C:/Users/Rohitha Manne/Downloads/Book3.xlsx")

# Convert 'Category' and 'Month' into ordered factors if they are not already
data$Category <- factor(data$Category, levels = unique(data$Category))
data$Month <- factor(data$Month, levels = month.name, ordered = TRUE)

# Remove rows with missing values
data <- na.omit(data)

# Split the data into training and testing sets only if there are sufficient observations
if (nrow(data) >= 10) {  # Using 10 as a threshold for minimum data size
  set.seed(123)  # Set seed for reproducibility
  # Split the data into training (80%) and testing (20%) sets
  training_indices <- createDataPartition(data$Amount, p = 0.8, list = FALSE)
  training_data <- data[training_indices, ]
  testing_data <- data[-training_indices, ]
  
  # Create a linear regression model using the training data
  lm_model <- lm(Amount ~ Category + Month, data = training_data)
  
  # Make predictions on the testing data
  testing_data$Predicted <- predict(lm_model, newdata = testing_data)
  
  # Visualize actual vs predicted values
  ggplot(testing_data, aes(x = Predicted, y = Amount)) +
    geom_point(color = "blue") +
    geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
    labs(title = "Actual vs Predicted Expense Amounts",
         x = "Predicted Amount",
         y = "Actual Amount") +
    theme_minimal()
  
  # Specify the category and month for which to predict the amount
  new_category <- "TV"
  new_month <- "January"  # Ensure this is a level within the training data
  
  # Create a new data frame for the prediction
  new_data <- data.frame(Category = factor(new_category, levels = levels(training_data$Category)),
                         Month = factor(new_month, levels = levels(training_data$Month), ordered = TRUE))
  
  # Make predictions using the linear regression model
  predicted_amount <- predict(lm_model, newdata = new_data)
  
  # Print the predicted amount
  cat("Predicted amount for", new_category, "in", new_month, "is:", predicted_amount, "\n")
} else {
  cat("Not enough data to build a reliable model and make predictions.\n")
}