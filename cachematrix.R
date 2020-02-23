## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##Creates a matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        
        ##Initialize the inverse property
        i <- NULL
        
        ##Set the matrix
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        
        ##Get the matrix
        get <- function() {
                x
        }
        
        ##Set the inverse of the matrix
        setInverse <- function(inverse) {
                i <<- inverse
        }
        
        ##Get the inverse of the matrix
        getInverse <- function() {
                i
        }
        
        ##Return a list of the methods
        list(set = set, get = get, setInverse = setInverse, 
             getInverse = getInverse)

}


## Write a short comment describing this function

##Calculates the inverse of the matrix created with the above makeCacheMatrix
##function.  However, if the inverse has already been calculated, it gets the
##inverse from the cache and skips the computation.
cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        
        ##Return inverse if it is already set
        if (!is.null(i)) {
                message("Getting cached Data")
                return(i)
        }
        
        ##Get the matrix from our object
        data <-x$get()
        
        ##Calculates the inverse of the matrix
        i <- solve(data)
        
        ##Set the inverse to the object
        x$setInverse(i)
        
        ##Return the inverse matrix
        i
}
