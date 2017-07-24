# This is a matrix that has the value in column 1, 
# the lower bound in column 2, and the upper bound in column 3
m = matrix(c(2, 3, 4, 5, 6, 0, 0.16, 0.44, 0.76, 0.96, 0.16, 0.44, 0.76, 0.96, 1.0000000000000000001), ncol=3)
n = 0
totalValue = 0
while (n < 300) {
    r = runif(1)
    # I take the r value and find which row in the matrix it is greater 
    # than column 2 (lower bound) and less than column 3 (upper bound). 
    # I then return the 1 column which is the value 
    currentValue <- m[r >= m[,2] & r < m[,3]][1]
    totalValue <- totalValue + currentValue
    n = n + 1
}
meanValue = totalValue / n
print(meanValue)

n = 0
totalBalance = 0
cumulativeBalanceList = c()
while(n < 1000){

    newStock = 5000
    newBond = 5000
    reinvestedStock = 0
    reinvestedBond = 0
    stockReturn = 0
    stockReturnRate = 0
    bondReturn = 0
    bondReturnRate = 0
    balanceYear = 0
    cumulativeBalance = 0

    for(year in seq(0,4)){
        stockReturnRate = rnorm(1, 0.08, 0.06)
        bondReturnRate = rnorm(1, 0.04, 0.03)
        stockReturn = (newStock + reinvestedStock) * stockReturnRate
        bondReturn = (newBond + reinvestedBond) * bondReturnRate
        balanceYear = newStock  + reinvestedStock + stockReturn + newBond + reinvestedBond + bondReturn
        cumulativeBalance = cumulativeBalance + balanceYear
        newStock = 2000
        newBond = 2000
        reinvestedStock = stockReturn
        reinvestedBond = bondReturn
    }
    cumulativeBalance = cumulativeBalance + 4000
    cumulativeBalanceList = c(cumulativeBalanceList, cumulativeBalance)
    n = n + 1
}
meanBalance = mean(cumulativeBalanceList)
sdBalance = sd(cumulativeBalanceList)
1 - pnorm(35000, meanBalance, sdBalance)
1 - pnorm(40000, meanBalance, sdBalance)


