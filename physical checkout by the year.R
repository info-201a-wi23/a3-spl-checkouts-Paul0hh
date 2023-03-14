library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")


original_data <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv")

physical_data <- original_data %>% 
  filter(str_detect(UsageClass, "Physical"))

physical_by_year <- physical_data %>% 
  group_by(CheckoutYear)

physical_by_year_totals <- physical_by_year %>% 
  summarize(total_checkouts = sum(Checkouts), 
            total_items = sum(Checkouts))


ggplot(physical_by_year_totals, aes(x = CheckoutYear, y = total_items)) +
  geom_col() +
  labs(x = "Year", y = "Physical Checkout Total", title = "Physical Checkouts by Year")
