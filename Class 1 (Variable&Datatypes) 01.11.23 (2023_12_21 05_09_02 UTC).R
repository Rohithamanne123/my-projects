print('Woxsen University')

#Character Vector--------------------------------------------------------------- 
str1 <-c("R","Python","Java","Scala","Julia")
str1
#Numeric Vector 
num2 <- c(1, 2, 3.4, 5, 5.9)
num2
#Integer Vector 
int3 <- (1:10)
int3
#Logical Vector 
log4 <- c(TRUE, FALSE, FALSE, T, F)
log4
# 5. Complex 
com5 <- c(2+3i, 3+5i, 4+5i)
com5

#Checking Class of Vector-------------------------------------------------------
class(str1)

class(num2)

class(int3)

class(log4)

class(com5)

#Examining Vectors--------------------------------------------------------------
typeof(str1)
#it's same as class

#Create empty vector using components-------------------------------------------

#an empty 'logical' (the default) vector
vec_1 <- vector()
vec_1

#Empty character vector 
str <- character(5)
str

#Empty integer vector
int_1 <- integer(5)
int_1

#Empty number vector
num_1 <- numeric(5)
num_1

#Empty logical Vector 
log_1 <- logical(5)
log_1

#Examining Vectors #by 2 variables----------------------------------------------
x1 <- c(2L, 4L, 5L, 7L)
y1 <- c("R", "Python", "Java", "Scala", "Julia")

typeof(x1)
typeof(y1)

length(x1)
length(y1)

class(x1)
class(y1)

str(x1)
str(y1)



