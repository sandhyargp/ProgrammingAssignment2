## The below two functions are part of the cachematrix assignment 2 in Coursera R programming
## These functions calculate the inverse of a square matrix and save it in cache memory
## so as to not compute the matrix inverse each time

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
            x <<- y
            m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set=set, 
         get=get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)) {
        message("getting cached data")
        return(m)
      }
     data <- x$get()
     m <- solve(data, ...)
     x$setinverse(m)
     m
}
