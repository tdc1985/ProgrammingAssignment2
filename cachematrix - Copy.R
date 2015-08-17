## These functions together form a method for caching the inverse of an
## invertible matrix. 

## This function takes a matrix object and gives it form to store its inverse
## alongside itself in a list object.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Takes a list object of the form returned by makeCacheMatrix() and either
## returns its inverse or, if not already cached, calculates its inverse

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()        
  if(!is.null(inv)) {       
    message("getting cached data")
    print("hi 1")
    return(inv)
  }
  data <- x$get()            
  inv <- solve(data, ...)        
  x$setinverse(inv)
  inv
}