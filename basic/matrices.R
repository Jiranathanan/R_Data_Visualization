goog <- c(123,456,789,1112, 1314)
msft <- c(20, 21, 23, 25, 25)

stocks <- c(goog, msft)

stock.matrix <- matrix(stocks, byrow=T, nrow=2)

days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('GOOG', 'MSFT')

colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

print(stock.matrix)
