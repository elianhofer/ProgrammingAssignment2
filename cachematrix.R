## The two below functions create a special “matrix” object that can cache its inverse
## (Function1); and the other function retrieves the inverse from a cache or
## otherwise calculates the inverse and stores it in cache (Function2).


## This Function returns a list with functions to set the matrix (1),
## get the matrix (2), set the inverse (3), get the inverse (4):

makeCacheMatrix <- function(x = matrix()) {
			inv <- NULL
			set <- function (y) {
					x <<- y
					inv <<- NULL
			}
			get <- function() x
			setinv <- function(inverse) inv <<- inverse
			getinv <- function() inv
			list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Function checks whether the inverse is already calculated and
## stored in the cache, if yes, retrieves it from there, if not,
## calculates the inverse, stores it and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        	inv = x$getinv()
        	if(!is.null(inv)){
        	message("get inverse from cache")
        	return(inv)
  	    	}
  	    	mat=x$get()
  	    	inv=solve(mat)
  	    	x$setinv(inv)
  	    	inv
}
