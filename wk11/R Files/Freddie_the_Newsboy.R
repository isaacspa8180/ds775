# Freddie the Newsboy Simulation
# To run, click Source (or highlight everything and click Run from the menu above)

# set.seed(5) # optional - specify a seed to reprodue the simulation exactly
SimSize <- 1000 # set number of trials in the simulation

UnitSalePrice <- 2.50
UnitPurchaseCost <- 1.50
UnitSalvageValue <- 0.50

OrderQuantity <- 60

# Rather than looping throug, this simulation can be done in one step with a vector
Demand <- sample(40:70, SimSize, replace = TRUE) # this draws a random sample from a discrete uniform distribution 

SalesRevenue <- UnitSalePrice*pmin(OrderQuantity,Demand)
PurchasingCost <- UnitPurchaseCost*OrderQuantity
SalvageValue <- UnitSalvageValue*pmax(OrderQuantity-Demand,0)

Profit <- SalesRevenue-PurchasingCost+SalvageValue

MeanProfit <- mean(Profit)
MeanProfit
sd(Profit)
summary(Profit)

hist(Profit,breaks=15,xlab="Profit")

