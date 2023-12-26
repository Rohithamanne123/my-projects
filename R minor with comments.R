# Load required libraries for building the shiny app and visualizing data.
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(openxlsx)

# Functions to navigate between months, useful for time-series data.
next_month <- function() {
  function(x) if (x == 12) 1 else x + 1  # If December, return January; otherwise, increment month.
}

prev_month <- function() {
  function(x) if (x == 1) 12 else x - 1  # If January, return December; otherwise, decrement month.
}

# Define the user interface of the shiny app.
ui <- dashboardPage(
  dashboardHeader(title = "Expense Dashboard"),  # App header with title.
  dashboardSidebar(
    sidebarMenu(
      menuItem("Input Expenses", tabName = "input_expenses")  # Sidebar menu item for expense input.
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "input_expenses",
        h2("Enter Expenses"),  # Section title for expense entry.
        fluidRow(
          column(4, selectInput("category", "Category", choices = unique(c('Car Payment', 'Car insurance', 'Mortgage',
                                                                           'College Payment', 'Cell phones', 'Electric', 'TV', 'Oil',
                                                                           'Water', 'Car Expense', 'EZPASS', 
                                                                           'Gas', 'Healthcare', 
                                                                           'Household Misc', 'Lawn Service', 
                                                                           'Parking', 'Work Expense', 'Groceries',
                                                                           'Dogs' , 'Cash', 'Entertainment', 'Food', 'Gifts', 
                                                                           'Misc', 'Party Expense', 'Peloton', 
                                                                           'Travel'))),  # Dropdown for selecting expense categories.
          column(4, numericInput("amount", "Amount", 0, min = 0)),  # Input for the expense amount.
          column(4, selectInput("month", "Month", month.name)),  # Dropdown for selecting the month of expense.
          column(4, actionButton("add_expense", "Add Expense"))  # Button to submit the expense.
        ),
        fluidRow(
          column(8, dataTableOutput("expenses_table"))  # Table to display entered expenses.
        ),
        fluidRow(
          column(12, plotOutput("bar_plot")),  # Placeholder for bar plot visualization.
          column(12, plotOutput("pie_chart")),  # Placeholder for pie chart visualization.
          fluidRow(
            column(4, actionButton("prev_month", "Previous Month")),  # Button to go to the previous month.
            column(4, textOutput("selected_month")),  # Text output for displaying the selected month.
            column(4, actionButton("next_month", "Next Month"))  # Button to go to the next month.
          ),
          column(12, plotOutput("regression_plot")),  # Placeholder for regression plot visualization (currently commented out).
          column(12, downloadButton("download_data", "Download Data"))  # Button to download expense data.
        )
      )
    )
  )
)


# Define server
server <- function(input, output, session) {
  # Initialize empty data frame for expenses
  expenses_data <- reactiveVal(data.frame(Category = character(), Amount = numeric(), Month = character()))
  
  
  selected_month <- reactiveVal(month.name[1])  # Reactive value to track the selected month (initialized to January).
  
  observeEvent(input$add_expense, {
    # Collect input values from the UI.
    category <- input$category
    amount <- input$amount
    month <- input$month
    
    # Add new expense to the reactive dataframe if all fields are filled.
    if (nchar(trimws(category)) > 0 && amount > 0 && nchar(trimws(month)) > 0) {
      new_expense <- data.frame(Category = category, Amount = amount, Month = month)
      expenses_data(rbind(expenses_data(), new_expense))  # Append the new expense to the existing data.
    }
    
    # Reset the input fields in the UI to be ready for the next entry.
    updateTextInput(session, "category", value = "")
    updateNumericInput(session, "amount", value = 0)
  })
  
  # Update the selected month when the user navigates using the 'Next' and 'Previous' buttons.
  observeEvent(input$next_month, {
    current_month_index <- match(selected_month(), month.name)
    next_month_index <- next_month()(current_month_index)
    selected_month(month.name[next_month_index])  # Update the selected month to the next month.
  })
  
  observeEvent(input$prev_month, {
    current_month_index <- match(selected_month(), month.name)
    prev_month_index <- prev_month()(current_month_index)
    selected_month(month.name[prev_month_index])  # Update the selected month to the previous month.
  })
  
  output$expenses_table <- renderDataTable({
    expenses_data()  # Render the expenses table with the data entered by the user.
  })
  
  output$bar_plot <- renderPlot({
    req(selected_month())  # Ensure a month is selected before plotting.
    
    filtered_data <- subset(expenses_data(), Month == selected_month())  # Filter expenses data for the selected month.
    ggplot(filtered_data, aes(x = Category, y = Amount, fill = Category)) +
      geom_bar(stat = "identity") +  # Create a bar plot showing amount by category.
      labs(title = paste("Expense Distribution by Category -", selected_month()),
           x = "Category", y = "Amount") +
      theme_minimal()  # Apply a minimalistic theme to the plot.
  })
  
  output$pie_chart <- renderPlot({
    req(selected_month())  # Ensure a month is selected before plotting.
    
    filtered_data <- subset(expenses_data(), Month == selected_month())  # Filter expenses data for the selected month.
    ggplot(filtered_data, aes(x = "", y = Amount, fill = Category)) +
      geom_bar(stat = "identity", width = 1) +  # Create a pie chart by using a polar coordinate system.
      coord_polar("y") +  # Apply polar coordinates to transform the bar plot to a pie chart.
      labs(title = paste("Expense Distribution by Category -", selected_month()),
           x = NULL, y = NULL) +  # Remove x and y labels as they are not needed for pie charts.
      theme_minimal()  # Apply a minimalistic theme to the plot.
  })
  
  # The regression plot code is commented out and can be implemented following a similar pattern to the plots above.
  
  output$selected_month <- renderText({
    selected_month()  # Display the selected month in the UI.
  })
  
  output$download_data <- downloadHandler(
    filename = function() {
      # Generate a filename for the download based on the current date and time.
      paste("expenses_data_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".xlsx", sep = "")
    },
    content = function(file) {
      write.xlsx(expenses_data(), file)  # Write the expenses data to an Excel file.
    }
  )
}

# Initialize and run the shiny app with the defined UI and server.
shinyApp(ui, server)