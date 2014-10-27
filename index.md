---
title       : Fuel consumption predictor
subtitle    : Project for the Developing Data Products Course
author      : alemorale
job         : Coursera data science specialization
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## The shiny app - a fuel consumption predictor

The shiny app predicts the fuel consumption of a car with the following properties:

1. Weight
2. Cylinders
3. Horsepower

The algorithm, using the most advance statistical modeling techniques, is able to predict the mileage of a car, given that the weight, number of cylinders and horsepower of the car are known.


We are able to deploy our algorithm to the mtcars dataset to make predictions about fuel consumption for a car of given characteristics.


--- .class #id 

## The mtcars dataset

As we can observe, the dataset has several variables which the algoritm does not use in the prediction, we restrict our analysis to the most important variables controlling mileage, namely: weight, cylinders and horsepower.



```r
data(mtcars)
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

--- .class #id
## The prediction algorithm

The prediction algorithm is based on a standard linear regression model of the data in the mtcars dataset using the weight, cylinders and horsepower variables of the dataset.


```r
model <- lm(mpg ~ wt + cyl + hp, data = mtcars)
```

Given new data for a given by the user, for instance:

```r
weight <- 3
cylinders <- 6
horsepower <- 200
```

--- .class #id 

## Predictions

We are able to succesfully predict fuel consumption!


```r
predict(model,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower))
```

```
##        1 
## 19.99355
```




As a reference, we provide the link to the shiny app: https://alemorales.shinyapps.io/project/


