# Lord the data set
library(tidyverse)
library(lubridate)

# Change working directory
setwd("D:/12-MY PER/Internships")

# Read the CSV file
superstore <- read_csv("SampleSuperstore.csv")

# View the first few rows
head(superstore)

# Explore data
# View the structure
str(superstore)

# Summary statistics
summary(superstore)

# Convert 'Order Date' to Date format
superstore <- superstore %>%
  mutate(`Order Date` = mdy(`Order Date`))

## Visualization
# Aggregate sales by month
monthly_sales <- superstore %>%
  mutate(Month = floor_date(`Order Date`, "month")) %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Sales, na.rm = TRUE))

# Plot the sales trend
ggplot(monthly_sales, aes(x = Month, y = Total_Sales)) +
  geom_line(color = "blue") +
  labs(title = "Monthly Sales Trend", x = "Month", y = "Total Sales") +
  theme_minimal()

# Improve Visualization
library(ggplot2)
library(scales)

ggplot(monthly_sales, aes(x = Month, y = Total_Sales)) +
  geom_line(color = "#2E86C1", size = 1.5) +           # Blue line
  geom_point(color = "#1B4F72", size = 3) +            # Add data points
  scale_y_continuous(labels = dollar_format(prefix = "$")) +  # Format y-axis as dollars
  labs(
    title = "???? Monthly Sales Trend - Superstore",
    subtitle = "Sales data visualized across time (2014-2017)",
    x = "Order Month",
    y = "Total Sales",
    caption = "Data Source: Sample - Superstore (Kaggle)"
  ) +
  theme_minimal(base_size = 14) +  # Base theme
  theme(
    plot.background = element_rect(fill = "#f7f9f9", color = NA),  # Background color
    panel.grid.major = element_line(color = "gray90"),             # Gridlines
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", size = 18, color = "#2C3E50"),
    plot.subtitle = element_text(size = 14, color = "#566573"),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12),
    plot.caption = element_text(size = 10, face = "italic", color = "gray40")
  )
library(ggplot2)
library(scales)

ggplot(monthly_sales, aes(x = Month, y = Total_Sales)) +
  
  # Shadow effect by layering
  geom_line(color = "gray30", size = 3.5, lineend = "round") +  # shadow line
  geom_line(color = "#00BFFF", size = 1.5, lineend = "round") + # main glowing line
  geom_point(color = "#00BFFF", size = 3) +                     # points
  
  # Labels
  labs(
    title = "???? Monthly Sales Trend",
    x = "Month",
    y = "Total Sales",
    caption = "Source: Sample Superstore Dataset"
  ) +
  
  # Modern theme with dark background and glowing style
  theme_minimal(base_size = 14) +
  theme(
    plot.background = element_rect(fill = "#1c1c1c", color = NA),
    panel.background = element_rect(fill = "#1c1c1c", color = NA),
    panel.grid.major = element_line(color = "#444444"),
    panel.grid.minor = element_blank(),
    axis.text = element_text(color = "white"),
    axis.title = element_text(color = "white", face = "bold"),
    plot.title = element_text(color = "#00BFFF", size = 20, face = "bold"),
    plot.subtitle = element_text(color = "#CCCCCC", size = 14),
    plot.caption = element_text(color = "gray70", size = 10)
  )

install.packages("gganimate")
install.packages("gifski", type = "binary")

# For saving as GIF
install.packages("av")         # For saving as MP4 (optional)
library(ggplot2)
library(gganimate)
library(gifski)
library(scales)

# Add a cumulative frame for animation
library(dplyr)
monthly_sales <- monthly_sales %>%
  arrange(Month) %>%
  mutate(Frame = row_number())  # animation frame order

# Create animated plot
p <- ggplot(monthly_sales, aes(x = Month, y = Total_Sales)) +
  geom_line(color = "#00BFFF", size = 1.5) +
  geom_point(color = "white", size = 3) +
  
  labs(
    title = "???? Monthly Sales Trend",
        x = "Month",
    y = "Total Sales",
    caption = "Source: Sample Superstore"
  ) +
  
  scale_y_continuous(labels = dollar_format()) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.background = element_rect(fill = "#1c1c1c", color = NA),
    panel.background = element_rect(fill = "#1c1c1c", color = NA),
    axis.text = element_text(color = "white"),
    axis.title = element_text(color = "white"),
    plot.title = element_text(color = "#00BFFF", size = 20, face = "bold"),
    plot.subtitle = element_text(color = "#CCCCCC", size = 14),
    plot.caption = element_text(color = "gray70")
  ) +
  
  transition_reveal(Month)

animate(p, renderer = gifski_renderer(), width = 800, height = 500, duration = 8, fps = 20)
anim_save("Monthly_Sales_Trend.gif", animation = p)


