# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

# Load data
original_data <- read.csv("/UW/INFO201/assingments/a3-spl-checkouts-Paul0hh/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# This is used to find the year with the highest physical checkouts. Important to check when the peak was and why.
highest_physical_year <- original_data %>%
  group_by(UsageClass, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  group_by(UsageClass) %>%
  filter(total_checkouts == max(total_checkouts)) %>%
  arrange(desc(total_checkouts)) %>% 
  filter(str_detect(UsageClass, "Physical")) %>% 
  pull(CheckoutYear)

# This is used to find the year with the highest digital checkouts Important to check when the peak was and why.
highest_digital_year <- original_data %>%
  group_by(UsageClass, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  group_by(UsageClass) %>%
  filter(total_checkouts == max(total_checkouts)) %>%
  arrange(desc(total_checkouts)) %>% 
  filter(str_detect(UsageClass, "Digital")) %>% 
  pull(CheckoutYear)

# This is used to find the total number of physical checkout resources. Important to track how many resources there are.
physical_resources <- original_data %>%
  group_by(UsageClass) %>%
  distinct(MaterialType) %>%
  summarize(num_unique = n()) %>% 
  filter(str_detect(UsageClass, "Physical")) %>% 
  pull(num_unique)

# This is used to find the total number of digital checkout resources. Important to track how many resources there are.
digital_resources <- original_data %>%
  group_by(UsageClass) %>%
  distinct(MaterialType) %>%
  summarize(num_unique = n()) %>% 
  filter(str_detect(UsageClass, "Digital")) %>% 
  pull(num_unique)

# This is used to find the total number of physical checkouts. Important to track the checkout trend.
total_physical_checkouts <- original_data %>%
  group_by(UsageClass) %>%
  summarize(total = sum(Checkouts)) %>% 
  filter(str_detect(UsageClass, "Physical")) %>% 
  pull(total)

# This is used to find the total number of digital checkouts Imporatant to track the checkout trend.
total_digital_checkouts <- original_data %>%
  group_by(UsageClass) %>%
  summarize(total = sum(Checkouts)) %>% 
  filter(str_detect(UsageClass, "Digital")) %>% 
  pull(total)

