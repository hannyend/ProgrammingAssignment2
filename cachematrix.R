## functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  # holds the cached value or NULL if nothing is cached
  
  inverse <- NULL
  
  setMatrix <- function(new) {
    x <<- new
 
    inverse <<- NULL
  }
  
  # returns the stored matrix
  getMatrix <- function() {
    x
  }
  # cache the given argument 
  cacheInverse <- function(solve) {
    inverse <<- solve
  }
  # get the cached value
  getInverse <- function() {
    inverse
  }
  
  # return a list
  list(setMatrix = setMatrix, getMatrix = getMatrix, 
       cacheInverse = cacheInverse, getInverse = getInverse)
  
}

# This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
  
  inverse <- x$getInverse()
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  data <- x$getMatrix()
  
  inverse <- solve(data)
  
  x$cacheInverse(inverse)
  
  inverse
}
# call makeCacheMatrix without arguments
y <- makeCacheMatrix();

# create a square matrix 
y$setMatrix( matrix(c(1,2,3,4), nrow = 2, ncol = 2) );

y$getMatrix();

cacheSolve(a)

# the 2nd time we run the function, we get the cached value
cacheSolve(a)
