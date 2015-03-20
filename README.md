## Introduction

The basis for this set of functions and markdown file can be found in the following repository which
was forked to complete this assignment.

https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2

The original markdown file for the assignment was copied to Original.md located in this repository.

This set of functions take an input matrix, invert it and store the results
in a cached environment (an environment that is different from the current
one). The cache is then checked for the results of the inverted matrix before
recalculating. If the result exists in the global environment (cache) the
matrix inverse is passed from the cache and computation is skipped. 
Otherwise, it solves for the inverted matrix and sets the value of the
inverse in the cache.

## Example: Caching the Inverse of a Matrix

###Cache the Results for the Inverse of a Matrix

The makeCacheMatrix function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the matrix inverse
4.  get the value of the matrix inverse

````
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      set_inv <- function(solve) m <<- solve
      get_inv <- function() m
      list(set = set, get = get,
           set_inv = set_inv,
           get_inv = get_inv)
}
````

The following function solves for the inverse of the special "matrix"
created with the above function. However, it first checks to see if the
inverse has already been calculated. If so, it gets the inverse from the
cache and skips the computation. Otherwise, it solves for the inverse of
the input matrix and sets the value in the cache via the `set_inv`
function.

````
cacheSolve<- function(x, ...) {
      m <- x$get_inv()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$set_inv(m)
      
      ## Return a matrix that is the inverse of 'x'
      return(m)

}
````

##Example 

###Create an Input Matrix

Create a vector called my_matrix:
````
my_matrix <- c(1, 1, 1, 3, 4, 3, 3, 3, 4)
````

Dimension my_matrix as a 3x3 matrix

````
dim(my_matrix) <- c(3,3)
````

check the matrix:

````
>my_matrix
     [,1] [,2] [,3]
[1,]    1    3    3
[2,]    1    4    3
[3,]    1    3    4
````


get inverse of my_matrix (to check results of function):

````
>solve(my_matrix)
     [,1] [,2] [,3]
[1,]    7   -3   -3
[2,]   -1    1    0
[3,]   -1    0    1
````

###Source the Code Conatining the Two Functions.

````
> source('C:/Users/Robin/ProgrammingAssignment2/cachematrix.R')
````

###Call Cache Function.

````
> mat <- makeCacheMatrix(my_matrix)
````

###Call Return Solve Function.

````
cacheSolve(mat)
     [,1] [,2] [,3]
[1,]    7   -3   -3
[2,]   -1    1    0
[3,]   -1    0    1
````
