# Load Libraries
library("tidyverse")
library("ggplot2")
library("dplyr")
library("scales")
library("knitr")

# Load data
original_data <- read.csv("/UW/INFO201/assingments/a3-spl-checkouts-Paul0hh/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Group the data by year and material type
Checkout_type_count <- original_data %>%
  group_by(CheckoutYear, CheckoutType) %>%
  summarize(checkout_count = sum(Checkouts), .groups = 'drop')

# Find all unique checkout types
unique_checkout_types <- unique(original_data$CheckoutType)

# Define a color palette for the material types
type_color <- c("OverDrive" = "blue", "Horizon" = "red", "Hoopla" = "darkgreen", "Zinio" = "purple", "Freegal" = "black" )

# Freegal is used for songs
# Hoopla is used to check out for television
# Horizion is used when checking out physical books
# OverDrive is used when checking out eBooks
# Zino is used for magazines 

# Create a chart using ggplot2 to show trends of all 5 checkout services
ggplot(Checkout_type_count) +
  geom_line(aes(x = CheckoutYear, y = checkout_count, color = CheckoutType)) +
  scale_color_manual(values = type_color) +
  labs(title = "Types of Checkout Counts per Year", x = "Year", y = "Number of Checkouts") +
  theme(legend.position = "right") +
  scale_y_continuous(breaks = seq(0, 3000000, 500000)) +
  facet_wrap(~CheckoutType)

