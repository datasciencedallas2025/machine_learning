# Activating the local project environment 
using Pkg
Pkg.activate(".")

# Loading the packages 
using CSV
using ScikitLearn, RDatasets, DataFrames

Pkg.add("PyCall")

# Define the path to the CSV file
file_path = "Data/framingham.csv"

# Read the CSV into a DataFrame
data = CSV.read(file_path, DataFrame)

data_cleaned = dropmissing(data)

println("Data Types of All Columns:")
for col in names(data_cleaned)
    println("$col: $(eltype(data_cleaned[:, col]))")
end


#println("Data Types of All Columns:")
#for col in names(data_cleaned)
#    println("$col: $(eltype(data[:, col]))")
#end

# Convert all columns to Float64
#for col in names(data_cleaned)
#    data_cleaned[!, col] = Float64.(coalesce.(data_cleaned[!, col], 0))
#end

# Choosing the features and target
#features = Array(data_cleaned[!, Not(:TenYearCHD)])

#target = Array(data_cleaned[!, :TenYearCHD])

# Creating a logistic regression model instance 
#@sk_import linear_model: LogisticRegression
#simplelogistic = LogisticRegression()

# Training the model 
#fit!(simplelogistic, features, target)

# Viewing the learned parameters 
#simplelogistic.coef_