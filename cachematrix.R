## The basis for this set of functions and markdown file can be found in the following repository which
## was forked to complete this assignment.

## https://github.com/rdpeng/ProgrammingAssignment2

## For a detailed description on how to use these functions read the README.md file. 
## The original assignment is copied into the Original.md file.

## This set of functions take a square invertable input matrix, inverts it and
## stores the results in a cached environment (an environment that is different 
## from the current one). The cache is then checked for the results of the  
## inverted matrix before recalculating. If the result exists in the global 
## environment (cache) the matrix inverse is passed from the cache and  
## computation is skipped. Otherwise, it solves for the inverted matrix and 
## sets the value of the inverse in the cache.

##---------------------------------------------------------------------------

## The first function, `makeCacheMatrix` creates a special "matrix", which is
## really a list containing a function to:

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the matrix inverse
## 4.  get the value of the matrix inverse

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

##---------------------------------------------------------------------------

## The function 'cacheSolve' solves for the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it gets the inverse from the
## cache and skips the computation. Otherwise, it solves for the inverse of
## the input matrix and sets the value in the cache via the `set_inv`
## function.

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
