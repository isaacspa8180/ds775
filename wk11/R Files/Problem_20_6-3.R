# Simulation for Problem 20.6-3
# To run, click Source (or highlight everything and click Run from the menu above)

# set.seed(8) # optional - specify a seed to reproduce the simulation exactly
SimSize=1000 # set number of trials in the simulation

# Generate rondom observations for the 4 relays for the entire simultion
relay1 <- runif(SimSize,1000,2000)
relay2 <- runif(SimSize,1000,2000)
relay3 <- runif(SimSize,1000,2000)
relay4 <- runif(SimSize,1000,2000)

TTFF <- pmin(relay1,relay2,relay3,relay4) # time to first failure

RepairTime <- 2

TotalTime <- TTFF + RepairTime

TotalCost <- 1000*2+200*4

CostPerHour <- TotalCost/TotalTime

MeanCostPerHour <- mean(CostPerHour)
MeanCostPerHour  # compare to the current cost of $3.19 
sd(CostPerHour)
summary(CostPerHour)

hist(CostPerHour,xlab="Cost per Hour") # see where the current cost pf $3.19 per hr falls
