# Load Libraries
library("tidyverse")
library("ggplot2")
library("dplyr")
library("scales")
library("knitr")

# Load data
original_data <- read.csv("/UW/INFO201/assingments/a3-spl-checkouts-Paul0hh/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)


# Group by year
by_year_total <- original_data %>% 
    group_by(CheckoutYear) %>% 
    summarize(total_checkouts = sum(Checkouts), 
    total_items = sum(Checkouts))

# Crete ggplot that shows checkout rates over the years 
ggplot(by_year_total) +
    geom_line(aes(x = CheckoutYear, y = total_items, color = "checkouts"), size = 1.5, alpha = 0.8) +
    labs(x = "Year", y = "Number of Checkouts", title = "Checkouts by Year") +
    scale_color_manual(values = c("red")) +
    theme_minimal(base_size = 16) +
    theme(legend.position = "right",
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()) +
   scale_y_continuous(limits = c(0, 4000000), breaks = seq(0, 4000000, 500000))
