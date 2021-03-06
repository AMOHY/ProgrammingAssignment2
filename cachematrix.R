

#The first function, makeVector creates a special "vector",
#which is really a list containing a function to
#1-set the value of the matrix
#2-get the value of the matrix
#3-set the value of the inverse
#4-get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse =  setinverse,
       setinverse =  setinverse)

}


#The following function calculates the mean of the special "vector" created with the above function.
#However, it first checks to see if the mean has already been calculated. 
#If so, it gets the mean from the cache and skips the computation.
#Otherwise, it calculates the mean of the data 
#and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- getElement(x, "ed")
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
