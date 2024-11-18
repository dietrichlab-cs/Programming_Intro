# 1.Load Data
df_iris <- read.csv("datasets/iris.csv")
#Summarize 
summary(df_iris)

# 2. Data Selection and indexing
#Select a column
print(df_iris$sepal_length)

#Select multiple columns
print(df_iris[, c("sepal_length", "sepal_width")])

#Select multiple columns and only specific rows
print(df_iris[1:10, c("sepal_length", "sepal_width")])

#Find indexes that match a condition
print(df_iris$sepal_length>6.0)

# Conditional selection
print(df_iris[df_iris$sepal_length > 6.0,])

# Multiple Conditions
print(df_iris[df_iris$sepal_length > 6.0 & df_iris$species== "versicolor",])

print(df_iris[df_iris$sepal_length > 6.0 | df_iris$species== "versicolor",])

# 3.Handling Missing Data

df_titanic = read.csv("../datasets/titanic.csv")
missing_data = is.na(df_titanic)
missing_data_counts = colSums(missing_data)
print(missing_data_counts)
##CARE DIFFERENT RESULTS THAN IN PYTHON

is_missing <- function(x) {
  is.na(x) | x == "" 
}

missing_data <- is_missing(df_titanic)
missing_data_counts <- colSums(missing_data)
print(missing_data_counts)
##NOW IT IS THE SAME


# Option 1: Drop missing data
df_titanic_clean <- df_titanic[rowSums(missing_data)==0,]
print(df_titanic_clean)

# Option 2: Fill missing data
df_titanic_copy <- df_titanic
df_titanic_copy[missing_data] <- 0

missing_data_copy = is_missing(df_titanic_copy)
missing_data_copy_counts = colSums(missing_data_copy)
print(missing_data_copy_counts)

# Option 3: Fill missing data with the mean
df_titanic_copy <- df_titanic

missing_age <- is_missing(df_titanic_copy$age)
dim(df_titanic_copy[missing_age,])
mean_age <- mean(df_titanic_copy[!missing_age,]$age)
mean_age 
df_titanic_copy[missing_age,]$age <- mean_age

missing_data_copy = is_missing(df_titanic_copy)
missing_data_copy_counts = colSums(missing_data_copy)
print(missing_data_copy_counts)

# Option 4: Filling missing  values with the most frequent value
#no mode function like in python

mode <- function(x){
  missing_values <- is_missing(x)
  uniq_x <- unique(x[!missing_values])
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

most_freq_val <- mode(df_titanic_copy$embarked)
most_freq_val

missing_embarked <- is_missing(df_titanic_copy$embarked)
df_titanic_copy[missing_embarked,]$embarked <- most_freq_val

missing_data_copy = is_missing(df_titanic_copy)
missing_data_copy_counts = colSums(missing_data_copy)
print(missing_data_copy_counts)

# Renaming columns

names(df_titanic_copy)[names(df_titanic_copy) == "class"] <- "ticked_class"

# Apply functions rowvise

df_diamonds <- read.csv("../datasets/diamonds.csv")

price_per_carat <- function(row) {
  carat_value <- as.numeric(row["carat"])
  price_value <- as.numeric(row["price"])
  
  if (carat_value > 0) {
    return(price_value / carat_value)
  } else {
    return(0)
  }
}

df_diamonds$price_per_carat <- apply(df_diamonds, 1, price_per_carat)


# Data Aggregation and Grouping
df_iris <- read.csv("../datasets/iris.csv")
grouped <- aggregate(. ~ species, data = df_iris, FUN = mean)
print(grouped)

#Merging

df1 <- data.frame(
  A = c('A0', 'A1', 'A2', 'A3'),
  B = c('B0', 'B1', 'B2', 'B3'),
  key = c('K0', 'K1', 'K2', 'K3')
)

df2 <- data.frame(
  C = c('C0', 'C1', 'C2', 'C3'),
  D = c('D0', 'D1', 'D2', 'D3'),
  key = c('K0', 'K1', 'K2', 'K4')
)

# Inner Join
print("\nInner Join:")
inner_join <- merge(df1, df2, by = "key", all = FALSE)
print(inner_join)

# Left Join
print("\nLeft Join:")
left_join <- merge(df1, df2, by = "key", all.x = TRUE)
print(left_join)

# Right Join
print("\nRight Join:")
right_join <- merge(df1, df2, by = "key", all.y = TRUE)
print(right_join)

# Outer Join
print("\nOuter Join:")
outer_join <- merge(df1, df2, by = "key", all = TRUE)
print(outer_join)

#Concatinate 
df1 <- data.frame(
  A = c('A0', 'A1', 'A2', 'A3'),
  B = c('B0', 'B1', 'B2', 'B3'),
  key = c('K0', 'K1', 'K2', 'K3')
)

df2 <- data.frame(
  A = c('A4', 'A5', 'A6', 'A7'),
  B = c('B4', 'B5', 'B6', 'B7'),
  key = c('K4', 'K5', 'K6', 'K7')
)

concatenated <- rbind(df1, df2)
print("Concatenated DataFrame:")
print(concatenated)

