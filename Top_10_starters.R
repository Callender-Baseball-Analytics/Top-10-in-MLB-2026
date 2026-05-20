# Top 10 SP in 2026

library(tidyverse)

alphabetical_data <- data %>%
  arrange(Player)

projected_era <- data %>%
  subset(Level == "PROJ") %>%
  arrange(ERA)

projected_war <- data %>%
  subset(Level == "PROJ") %>%
  arrange(desc(WAR))

actual_era <- data %>%
  subset(Level != "PROJ") %>%
  arrange(ERA)

# Graphs of era and war leaders (actual and projected)
# Top 10 WAR in 2025, Top 10 projected era in 2026, etc.
era_graph_25 <- actual_era %>%
  subset(Season == 2025) %>%
  arrange(ERA) %>%
  head(10) # 10 lowest ERAs in 2025

era_graph_24 <- actual_era %>%
  subset(Season == 2024) %>%
  arrange(ERA) %>%
  head(10) # 10 lowest ERAs in 2024

fip_graph_25 <- actual_era %>%
  subset(Season == 2025) %>%
  arrange(FIP) %>%
  head(10) # 10 lowest FIPs in 2025

fip_graph_24 <- actual_era %>%
  subset(Season == 2024) %>%
  arrange(FIP) %>%
  head(10) # 10 lowest FIPs in 2024

war_graph_25 <- actual_era %>%
  subset(Season == 2025) %>%
  arrange(desc(WAR)) %>%
  head(10) # 10 Highest WAR in 2025

war_graph_24 <- actual_era %>%
  subset(Season == 2024) %>%
  arrange(desc(WAR)) %>%
  head(10) # 10 Highest WAR in 2024
  
ggplot(era_graph_25, aes(x = reorder(Player, ERA), y = ERA)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Top 10 Lowest ERA in 2025",
       x = "Player",
       y = "ERA")

ggplot(era_graph_24, aes(x = reorder(Player, ERA), y = ERA)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Top 10 Lowest ERA in 2024",
       x = "Player",
       y = "ERA")

ggplot(fip_graph_25, aes(x = reorder(Player, FIP), y = FIP)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Top 10 Lowest FIP in 2025",
       x = "Player",
       y = "FIP")

ggplot(fip_graph_24, aes(x = reorder(Player, FIP), y = FIP)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Top 10 Lowest FIP in 2024",
       x = "Player",
       y = "FIP")

ggplot(war_graph_25, aes(x = reorder(Player, -WAR), y = WAR)) +
  geom_bar(stat = "identity", fill = "yellow") +
  labs(title = "Top 10 Highest WAR in 2025",
       x = "Player",
       y = "WAR")

ggplot(war_graph_24, aes(x = reorder(Player, -WAR), y = WAR)) +
  geom_bar(stat = "identity", fill = "yellow") +
  labs(title = "Top 10 Highest WAR in 2024",
       x = "Player",
       y = "WAR")

write_csv(data, file = "pitching_data.csv")



