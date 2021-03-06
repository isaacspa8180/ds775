require('XLConnect')  # install if necessary
# also install XLConnectJars if not installed as dependency

# read dataframes from Excel spreadsheet
# you'll have to change the sheets and regions
dfFactories <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='A2:A5')
dfWarehouse <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='B2:B4')
dfStores <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='C2:C6')
dfProducts <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='D2:D3')
#dfMaxUnitsFW <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='A10')
#dfMaxUnitsWS <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='A13')
#dfMaxUnitsStored <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='A16')
dfTableRoutesFW <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='F3:H26')
dfTableRoutesWS <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='K3:N20')
dfSupply <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='P3:R10')
dfDemand <- readWorksheetFromFile('transpStoreSheet.xlsx',sheet=1,region='T3:V12')


# set to your directory or use Session -> Set Working directory from the menu in RStudio to set directory
setwd('C:/myscripts/school/ds775/wk4') # set to your project directory

filename <- 'transpStoreSheet.dat' # give your file a name
cat('//--------------------------------------------------\n',file=filename)
con <- file(filename) # get connection to file to close later
cat('// transportation file produced by reading \n',file=filename,append=T)
cat('// excel file into R using XLConnect \n',file=filename,append=T)
cat('// and using R commands to output textfile \n',file=filename,append=T)
cat('//--------------------------------------------------\n\n',file=filename,append=T)

# some helper functions for writing in the right formats for .dat file
writeSet <- function( varName, df, filename ){
  cat( varName, file = filename, append = T )
  cat( ' = { ', file = filename, append = T )
  numRows <- dim(df)[1]
  for (j in 1:numRows){
    cat( df[j,1], file = filename, append = T )
    cat( ' ', file = filename, append = T )
  }
  cat('};\n', file = filename, append = T )
}

writeNumber <- function( varName, x, filename ){
  cat( varName, file = filename, append = T)
  cat( ' = ', file = filename, append = T)
  cat( x, file = filename, append = T)
  cat( ';\n', file = filename, append = T)
}

writeTuplesTable <- function( varName, df, filename){
  cat( varName, file = filename, append = T)
  cat( ' = {\n', file = filename, append = T)
  numRows <- dim( df )[1]
  for (j in 1:numRows){
    cat(' < ', file = filename, append = T)
    write.table( df[j,], file = filename, append = T, quote = F, sep = ', ', 
                 row.names = F, col.names = F, eol = ' >\n' )
  }
  cat('};\n\n', file = filename, append = T)
}

writeTuplesArray <- function( varName, df, filename){
  cat( varName, file = filename, append = T)
  cat( ' = #[\n', file = filename, append = T)
  numRows <- dim( df )[1]
  numCols <- dim( df )[2]
  tupleLen <- numCols - 1
  for (j in 1:numRows){
    cat(' < ', file = filename, append = T)
    write.table( df[j,1:tupleLen], file = filename, append = T, quote = F, sep = ', ', 
                 row.names = F, col.names = F, eol = ' >: ' )
    cat( df[j,numCols] , file = filename, append = T )
    cat( '\n', file = filename, append = T )
  }
  cat(']#;\n\n', file = filename, append = T)
}

# write file
writeSet('Factories', dfFactories, filename)
writeSet('Warehouse', dfWarehouse, filename)
writeSet('Stores', dfStores, filename)
writeSet('Products',dfProducts,filename)
writeNumber('MaxUnitsFW', 700, filename)
writeNumber('MaxUnitsWS', 700, filename)
writeNumber('MaxUnitsStored', 700, filename)
writeTuplesTable('TableRoutesFW', dfTableRoutesFW, filename)
writeTuplesTable('TableRoutesWS', dfTableRoutesWS, filename)
writeTuplesArray('Supply', dfSupply, filename)
writeTuplesArray('Demand', dfDemand, filename)
close(con) # close connection to file

