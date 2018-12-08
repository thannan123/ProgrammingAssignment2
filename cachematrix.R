## To Utilize: Create a Matrix that is invertable
## A <- matrix( c(5, 1, 0, 3,-1, 2, 4, 0,-1), nrow=3, byrow=TRUE)
## Create your Cache Matrix
## A1 <- makeCacheMatrix(A)
## Solve
## cacheSolve(A1)
## Solve again to show it's utilizing cached version
## cacheSolve(A1)

## makeCacheVector creates a special "matrix", which is really a list containing a function to
##set the value of the matrix
##get the value of the matrix
##set the value of solve
##get the value of solve

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)

}


## Adapted example function given to us.  Found Solve() was the function
##  that inverts a matrix.

cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()      
  m<-solve(data,...)
  x$setmatrix(m)
  m
}