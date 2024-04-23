# Poster


# Loading data, selecting variables, and summary stats ----

library(tidyverse)
library(dplyr)
library(ggplot2)
library(patchwork)

perpetrators = read_csv("names_of_perpetrators.csv")

perpetrators2 = perpetrators |>
  select(gender, age, marital_status, citizenship_status, 
         char_contact_with_foreign_militant, char_online_radicalization)

summary(perpetrators2$age)
table(perpetrators2$gender)
table(perpetrators2$marital_status)
table(perpetrators2$citizenship_status)
table(perpetrators2$char_contact_with_foreign_militant)
table(perpetrators2$char_online_radicalization)


# Age plot ----

age_intervals = c("15-25", "26-30", "31-35", "36-40", "41-50", "51-60", 
                   "61-70", "71-80")

# Filter perpetrators2 to include only ages up to 71-80
age_filtered <- perpetrators2[perpetrators2$age <= 80, ]

age_filtered |>
  ggplot(aes(x = factor(age_intervals))) +
  geom_bar(fill = "forestgreen", width = 0.5) +
  coord_flip() +
  labs(x = "Age Intervals", y = "Count") +
  ggtitle("Age of Perpetrators") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

perpetrators2 |>
  ggplot(aes(x = age)) +
  geom_bar(fill = "forestgreen", width = 0.5) + 
  coord_flip()
  labs(x = "Age", y = "Count") +
  ggtitle("Age of Perpetrators") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  
theme(panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank())


ggplot(perpetrators2, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "cornflowerblue", color = "white") +
  labs(x = "Age", y = "Frequency", title = "Ages of Perpetrators") +
  theme_minimal()


# Gender plot ----

perpetrators2 |>
  ggplot(aes(x = gender)) +
  geom_bar(fill = "cornflowerblue", width = 0.5) +  
  labs(x = "Gender", y = "Count") +
  ggtitle("Terrorist Attacks by Gender") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
  







