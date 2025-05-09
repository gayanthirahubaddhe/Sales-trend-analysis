# 📈 Sales Trend Analysis - Superstore Dataset

This project analyzes sales data from the Superstore dataset using **R** to uncover key business insights. The focus is on identifying **monthly sales trends**, **seasonal patterns**, and **anomalies** in sales behavior.

## 📊 Objectives

- 📅 Visualize monthly sales trends over multiple years
- 🔄 Identify recurring seasonal sales patterns
- ⚠️ Detect sales anomalies using exploratory data analysis and animation

## 🔍 Dataset

- **Source**: [Kaggle - Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **File**: `SampleSuperstore.csv`
- **Columns Used**: `Order Date`, `Sales`


## 🧪 Tools & Libraries Used

- `R`, `RStudio`
- Libraries: `tidyverse`, `lubridate`, `ggplot2`, `gganimate`, `gifski`, `scales`
- GitHub (version control)
- LinkedIn (project showcase)

## 📈 Key Insights

- **Trend**: Monthly sales show a gradual upward trend from 2014 to 2017, with notable peaks in the holiday season (November and December).
- **Seasonality**: Strong and consistent sales peaks during **November and December**, suggesting holiday season influence.
- **Anomalies**: Mid-year dips in July–August observed across multiple years, indicating potential seasonal slumps or changes in consumer behavior.

## 🛠️ How to Run

1. Clone this repository or download the files.
2. Place `SampleSuperstore.csv` in your R working directory.
3. Open and run `sales_trend_analysis.R` in **RStudio**.
4. View static plots in the Plots pane and animated plots in the Viewer pane.
5. To save the animation as a `.gif`, ensure the `gifski` package is installed.

## 📂 Project Structure

- **`sales_trend_analysis.R`**: Main R script for data analysis, plotting, and animation.
- **`SampleSuperstore.csv`**: The Superstore dataset used for analysis.

## 🖼️ Visualizations

### Trend Analysis
A line plot showing the upward trend in monthly sales over the observed period, with noticeable peaks during the holiday season.

### Seasonality
A radial plot with an animated year-by-year breakdown of **seasonal sales patterns**, displayed with a **dark theme** for better contrast.

### Anomalies
Identified anomalies in the sales data via **STL decomposition**, highlighting months with significant sales deviations from the trend.
