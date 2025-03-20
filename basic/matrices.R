goog <- c(123,456,789,1112, 1314)
msft <- c(20, 21, 23, 25, 25)

stocks <- c(goog, msft)

stock.matrix <- matrix(stocks, byrow=T, nrow=2)

days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('GOOG', 'MSFT')

colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

print(stock.matrix)

colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)
colMeans(stock.matrix)

stock.matrix
FB <- c(111,222,333,444,555)
tech.stocks <- rbind(stock.matrix, FB)

tech.stocks

avg <- rowMeans(tech.stocks)
avg

tech.stocks <- cbind(tech.stocks, avg)
tech.stocks
