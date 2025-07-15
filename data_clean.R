# Code written by Aditya Kakde, owner of account @Onnamission

library(tidyverse)
library(janitor)

print(getwd())

setwd("D:/Projects/Sales-Analytics")
print(getwd())

df = read.csv('Dataset/sales.csv')

# View(df)


# Data cleaning pipeline
data_clean = df %>%
  na_if(-1) %>%  # filling NA is place of -1
  na_if(0) %>%   # filling NA is place of 0
  na_if("") %>%  # filling NA is place of blank ("")
  na_if("USD\r") %>%  # filling NA is place of USD\r
  drop_na() %>%  # dropping NA remove that entire row
  janitor::clean_names() %>%
  subset(select=-c(date, product_code_1, customer_code_1, markets_code))  # removing redundant columns


# Value replacement in table cells
data_clean$sales_amount[data_clean$currency == "USD" & data_clean$order_date == "2017-11-20"] = data_clean[5, "sales_amount"] * 75
data_clean$sales_amount[data_clean$currency == "USD" & data_clean$order_date == "2017-11-22"] = data_clean[6, "sales_amount"] * 75

data_clean$currency[data_clean$currency == "INR"] = "INR"  # just to be on the safe side
data_clean$currency[data_clean$currency == "INR\r"] = "INR"
data_clean$currency[data_clean$currency == "INR\n"] = "INR"
data_clean$currency[data_clean$currency == "USD"] = "INR"
data_clean$currency[data_clean$currency == "USD\r"] = "INR"
data_clean$currency[data_clean$currency == "USD\n"] = "INR"


# View(data_clean)

# write.csv(data_clean, "sales.csv", row.names = FALSE)
