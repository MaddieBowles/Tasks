# This is a message from Maddie's computer
#install.packages("swirl")

library(swirl)

swirl()
Maddie

library (swirl)
swirl()
Maddie
0
1
x <- 5+7
1
x
y <- x-3 
y
1
z <- c(1.1, 9, 3.14)
?c
z
c(z, 555, z)
z * 2 + 1000
1
1
1
my_sqrt <- sqrt(z - 1)
2
my_sqrt
1
my_div <- z/my_sqrt
1
my_div
1
c(1, 2, 3, 4) + c(0, 10)
c(1, 2, 3, 4) + c(0, 10, 100)
1
my_div
2
0


library(swirl)
swirl()
Maddie
2
swirl()
Maddie
1
2
1
getwd()
ls()
1
x <- 9
ls()
list.files()
?list.files
1
args(list.files())
args(list.files)
old.dir <- list.files
old.dir <- getwd()
1
dir.create ("testdir")
1
setwd("testdir")
1
file.create("mytest.R")
list.files
list.files()
file.exists("mytest.R")
1
file.info("mytest.R")
file.info("mytest.R")$mode
file.rename("mytest.R", "mytest2.R")
1
file.copy("mytest2.R", "mytest3.R")
1
file.path("mytest3.R")
args(file.path)
file.path("folder1", "folder2")
?dir.create
dir.create(file.path("testdir2", "testdir3")
setwd(old.dir)
1



1
3
1:20
pi:10
15:1
1
?`:`
seq(1,20)
seq(0,10, by=0.5)
my_seq <- seq(5, 10, length=30)
length(my_seq)
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)
1
rep(0, times = 40)
rep(c(0,1,2), each = 10)
1


1
5
1
x <- c(44, NA, 5, NA)
x * 3
1
y <- rnorm(1000)
z <- rep(NA,1000)
my_data <- sample(c(y,Z), 100)
my_na <- is.na(my_data)
my_na
1
my_data == NA
sum(my_na)
my_data
0/0
Inf - Inf
1



1
6
1
x
x[1:10]
1
is.na(x)
4
x[is.na(x)]
y <- x[!is.na(x)]
y
1
5
2
y[y>0]
x[x>0]
1
x[!is.na(x) & x > 0]
1
x[c(3, 5, 7)]
x[0]
x[3000]
1
x[-c(2, 10)]
1
vect <- c(foo = 11, bar = 2, norf = NA)
names(vect)
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar, "norf")
identical(vect, vect2)
1
3
vect["bar"]
vect[c("foo", "bar")]
2




1
7
1
my_vector <- 1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4, 5)
1
dim(my_vector)
attributes(my_vector)
1
my_vector
class(my_vector)
my_matrix <- my_vector
1
?matrix()
?matrix
my_matrix2 <- matrix(1:20, c(4,5))
identical(my_matrix, my_matrix2)
1
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
1
my_data <- data.frame(patients, my_matrix)
my_data
1
class(my_data)
1
cnames <- c("patients", "age", "weight", "bp", "rating", "test")
colnames (cnames)
colnames(my_data) <- cnames
my_data
2



1
8
1
TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
1
6<7
10<=10
1
1
5 != 7
!5 == 7
2
1
FALSE & FALSE
TRUE && c(TRUE, FALSE, FALSE)
1
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)
1
5 > 8 || 6 != 8 && 4 > 3.9
1
4
2
isTRUE(6>4)
4
identical('twins', 'twins')
2
xor(5==6, !FALSE)
1
3
ints <- sample (10)
ints > 5
which (ints > 7)
1
any(ints <0)
all (ints > 0)
3
1


1
9
1
Sys.Date()
mean(c(2, 4, 5)
1
boring_function('My first function!')
boring_function
info
library(swirl)
swirl()
Maddie
1
my_mean(c(4, 5, 10)
remainder(5)
remainder (11, 5)
remainder (divisor = 11, num = 5)
remainder (4, div = 2)
args (remainder)
evaluate (sd, c(1.4, 3.6, 7.9, 8.8)
evaluate(function(x) {x+1}, 6)
evaluate(function(x), c(8, 4, 0))
evaluate(function (x) {x[length(x)]}, c(8, 4, 0))
?paste
paste("Programming", "is", "fun!")
telegram()
mad_libs(adjective = "", place = "", noun = "")
'I' %p% 'love' %p% 'R!'
1
2



1
15
1
data(cars)
1
?cars
1
head(cars)
plot(cars)
1
?plot
plot(x = cars$speed, y = cars$dist)
1
plot(x = cars$dist, y = cars$speed)
1
plot(x = cars$speed)
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
1
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")
1
plot(cars, col = 2)
plot(cars, xlim = c(10, 15))
?points
plot(cars, pch = 2)
1
data.frame(mtcars)
data(mtcars)
1
?boxplot
1
boxplot(formula = mpg ~ cyl, data = mtcars)
1
hist(mtcars$mpg)
1
0