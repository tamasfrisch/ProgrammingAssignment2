## Coursera Programming Assignment 2
## Scoping exercise

## makeCacheMatrix generates a list, taking a matrix as an input
## The list contains 4 functions, basically methods that set and get the matrix and its cached inverse (invMatrix)
## Note that there is no checking of the values in the setinverse function.

makeCacheMatrix <- function(x = matrix()) {
      invMatrix <-NULL
      set <- function (y){
            x <<-y
            invMatrix <<- NULL
      }
      get <- function () x
      setinverse <- function (inverse) invMatrix <<- inverse
      getinverse <-function () invMatrix
      list (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve expects an input generated by the makeCacheMatrix function; that is a list with 4 functions
## Then it checks whether the getinverse method has a value in the closure; if it does, it returns the cached value
## If the value does not exist (setinverse has not been called yet), it calls the setinverse function and sets it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      invMatrix <- x$getinverse()
      if (!is.null(invMatrix)) {
            message ("Getting cached data")
            return(invMatrix)
      }
      data <- x$get()
      invMatrix <- solve(data, ...)
      x$setinverse(invMatrix)
      invMatrix
}
