# R Data Frame Indexing and Selection

## The Difference Between `df[["column"]]` and `df["column"]`

When working with data frames in R, there are multiple ways to access columns. Two common methods are:

```r
# Sample data frame
days <- c('Mon', 'Tue', 'Wed', 'Thur', 'Fri')
temp <- c(22.2, 43.0, 35.1, 51.8, 19.5)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
df <- data.frame(days, temp, rain)
```

### 1. Using Double Brackets: `df[["column"]]`

Double brackets extract the actual vector of values from the specified column:

```r
df[["days"]]
# Output: "Mon" "Tue" "Wed" "Thur" "Fri"
```

This returns a character vector (or the appropriate vector type for that column), not a data frame. The double brackets `[[]]` extract the contents of the column directly.

```r
class(df[["days"]])  # Returns: "character"
length(df[["days"]]) # Returns: 5 (number of elements in vector)
```

### 2. Using Single Brackets: `df["column"]`

Single brackets return a data frame with just the specified column:

```r
df["days"]
# Output:
#   days
# 1  Mon
# 2  Tue
# 3  Wed
# 4 Thur
# 5  Fri
```

This preserves the data frame structure and column name.

```r
class(df["days"])    # Returns: "data.frame"
dim(df["days"])      # Returns: 5 1 (5 rows, 1 column)
```

## When to Use Each Method

- Use `df[["column"]]` when you need the actual vector for calculations or operations that work on vectors
- Use `df["column"]` when you need to maintain the data frame structure (e.g., for plotting or further subsetting)

## Additional Notes

The `$` operator is a third way to access columns and behaves like double brackets:

```r
df$days
# Equivalent to df[["days"]]
```

When selecting multiple columns, you must use single brackets:

```r
df[c("days", "temp")]  # Returns a data frame with two columns
```
