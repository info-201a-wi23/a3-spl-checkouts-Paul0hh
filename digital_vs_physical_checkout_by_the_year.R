# Load Libraries
library("tidyverse")
library("ggplot2")
library("dplyr")
library("scales")
library("knitr")

# Load data
original_data <- read.csv("/UW/INFO201/assingments/a3-spl-checkouts-Paul0hh/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Group the data by year and checkout type
checkout_counts <- original_data %>%
  group_by(CheckoutYear, UsageClass) %>%
  summarize(checkout_count = sum(Checkouts), .groups = 'drop')

# Add color for physical and digital checkout
checkout_color <- c("Physical" = "blue", "Digital" = "red")

# Create a  chart using ggplot comparing the two forms of checkout
ggplot(checkout_counts, aes(x = CheckoutYear, y = checkout_count, fill = UsageClass)) +
  geom_bar(stat="identity", position="dodge") +
  scale_fill_manual(values = checkout_color) +
  labs(title = "Comparison of Physical and Digital Checkouts by Year" , x = "Year", y = "Number of Checkouts") +
  theme(legend.position = "right") + 
  scale_y_continuous(breaks = seq(0, 3000000, 200000))


