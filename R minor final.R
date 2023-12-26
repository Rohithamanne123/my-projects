#------------------------------------------------------------------
#Interactive shiny dashboard for storing and visualizing data 

library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(openxlsx)

# Function to get the next month
next_month <- function() {
  function(x) if (x == 12) 1 else x + 1
}

# Function to get the previous month
prev_month <- function() {
  function(x) if (x == 1) 12 else x - 1
}

# Define the user interface of the shiny app.
ui <- dashboardPage(
  dashboardHeader(title = "Expense Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Input Expenses", tabName = "input_expenses")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "input_expenses",
        h2("Enter Expenses"),
        fluidRow(
          column(4, selectInput("category", "Category", choices = unique(c('Car Payment', 'Car insurance', 'Mortgage',
                                                                           'College Payment', 'Cell phones', 'Electric', 'TV', 'Oil',
                                                                           'Water', 'Car Expense', 'EZPASS', 
                                                                           'Gas', 'Healthcare', 
                                                                           'Household Misc', 'Lawn Service', 
                                                                           'Parking', 'Work Expense', 'Groceries',
                                                                           'Dogs' , 'Cash', 'Entertainment', 'Food', 'Gifts', 
                                                                           'Misc', 'Party Expense', 'Peloton', 
                                                                           'Travel'))),
                 numericInput("amount", "Amount",0,  min = 0),
                 selectInput("month", "Month", month.name),
                 actionButton("add_expense", "Add Expense")),
          column(8, dataTableOutput("expenses_table"))
        ),
        fluidRow(
          column(12, plotOutput("bar_plot")),
          column(12, plotOutput("pie_chart")),
          column(12, fluidRow(
            column(4, actionButton("prev_month", "Previous Month")),
            column(4, textOutput("selected_month")),
            column(4, actionButton("next_month", "Next Month"))
          )),
          column(12, downloadButton("download_data", "Download Data"))
        )
      )
    )
  )
)

# Define server logic that responds to user inputs and updates the UI accordingly.
server <- function(input, output, session) {
  # Initialize empty data frame for expenses
  expenses_data <- reactiveVal(data.frame(Category = character(), Amount = numeric(), Month = character())) 
  # Reactive value to store expenses data.
  
  # Track the selected month
  selected_month <- reactiveVal(month.name[1])
  # Reactive value to track the selected month (initialized to January).
  
  # Add expense when button is clicked
  observeEvent(input$add_expense, {
    # Collect input values from the UI.
    category <- input$category
    amount <- input$amount
    month <- input$month
    
    # Add new expense to the reactive dataframe if all fields are filled.
    if (nchar(trimws(category)) > 0 && amount > 0 && nchar(trimws(month)) > 0) {
      new_expense <- data.frame(Category = category, Amount = amount, Month = month)
      expenses_data(rbind(expenses_data(), new_expense)) 
      # Append the new expense to the existing data.
    }
    
    # Clear input fields
    # Reset the input fields in the UI to be ready for the next entry.
    updateTextInput(session, "category", value = "")
    updateNumericInput(session, "amount", value = 0)
  })
  
  # Update selected_month based on the "Next" and "Previous" buttons
  # Update the selected month when the user navigates using the 'Next' and 'Previous' buttons.
  observeEvent(input$next_month, {
    current_month_index <- match(selected_month(), month.name)
    next_month_index <- next_month()(current_month_index)
    selected_month(month.name[next_month_index])
    # Update the selected month to the next month.
  })
  
  observeEvent(input$prev_month, {
    current_month_index <- match(selected_month(), month.name)
    prev_month_index <- prev_month()(current_month_index)
    selected_month(month.name[prev_month_index])
    # Update the selected month to the previous month.
  })
  
  # Render expenses table
  output$expenses_table <- renderDataTable({
    expenses_data()
    # Render the expenses table with the data entered by the user.
  })
  
  # Render bar plot
  output$bar_plot <- renderPlot({
    req(selected_month())  # Ensure a month is selected before plotting.
    
    filtered_data <- subset(expenses_data(), Month == selected_month())
    # Filter expenses data for the selected month.
    
    ggplot(filtered_data, aes(x = Category, y = Amount, fill = Category)) +
      geom_bar(stat = "identity") + 
      # Create a bar plot showing amount by category.
      geom_text(aes(label = sprintf("%.2f", Amount)),
                position = position_stack(vjust = 0.5), color = "black", size = 3) +
      # Add labels showing the amount on top of each bar
      labs(title = paste("Expense Distribution by Category -", selected_month()),
           x = "Category", y = "Amount") +
      theme_minimal()
    # Apply a minimalistic theme to the plot.
  })
  
  # Render pie chart
  output$pie_chart <- renderPlot({
    req(selected_month())  # Ensure selected_month is available  # Ensure a month is selected before plotting.
    
    filtered_data <- subset(expenses_data(), Month == selected_month())
    # Filter expenses data for the selected month.
    
    # Calculate percentages for each category
    percentage_data <- filtered_data %>%
      group_by(Category) %>%
      summarize(Percentage = sum(Amount) / sum(filtered_data$Amount) * 100)
    
    ggplot(percentage_data, aes(x = "", y = Percentage, fill = Category)) +
      geom_bar(stat = "identity", width = 1) +
      # Create a pie chart by using a polar coordinate system.
      coord_polar("y") +
      # Apply polar coordinates to transform the bar plot to a pie chart.
      labs(title = paste("Expense Distribution by Category -", selected_month()),
           x = NULL, y = NULL) +
      # Remove x and y labels as they are not needed for pie charts.
      geom_text(aes(label = sprintf("%.1f%%", Percentage)),
                position = position_stack(vjust = 0.5), color = "black",family = "bold") +
      # Add percentage labels to each slice
      theme_minimal() # Apply a minimalistic theme to the plot.
  })
  
  
  # Display the selected month
  output$selected_month <- renderText({
    selected_month() # Display the selected month in the UI.
  })
  
  # Download button handler
  output$download_data <- downloadHandler(
    filename = function() {
      # Generate a filename for the download based on the current date and time.
      paste("expenses_data_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".xlsx", sep = "")
    },
    content = function(file) {
      write.xlsx(expenses_data(), file) # Write the expenses data to an Excel file.
    }
  )
}

# Initialize and run the shiny app with the defined UI and server.
shinyApp(ui, server)

#--------------------------------------------------------------------------------------
# Linear Regression model for predictions

library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(caret)

# Load data from the specified Excel file
data <- read_excel("C:/Users/Rohitha Manne/Downloads/mydata.xlsx")

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
  myplot<-ggplot(testing_data, aes(x = Predicted, y = Amount)) +
    geom_point(color = "blue",size=1.5) +
    geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed",size=1) +
    labs(title = "Actual vs Predicted Expense Amounts",
         x = "Predicted Amount",
         y = "Actual Amount") +
    theme_minimal()
  print(myplot)
  
  
  #--------------------------------------------------------------------------
  #Predictions using desired category
  
  # Specify the category and month for which to predict the amount
  new_category <- "TV"
  new_month <- "January"  # Ensure this is a level within the training data
  
  # Create a new data frame for the prediction
  new_data <- data.frame(
    Category = factor(new_category, levels = levels(training_data$Category)),
    Month = factor(new_month, levels = levels(training_data$Month), ordered = TRUE)
  )
  
  # Make predictions using the linear regression model
  predicted_amount <- predict(lm_model, newdata = new_data)
  
  # Print the predicted amount
  cat("Predicted amount for", new_category, "in", new_month, "is:", predicted_amount, "\n")
} else {
  cat("Not enough data to build a reliable model and make predictions.\n")
}

