## Put comments here that give an overall description of what your
## functions do

## creates special matrix

makeCacheMatrix <- function(x = matrix()) {
  
        ## store the inverse matrix
        inverse_matrix <- NULL
        
        ## set the matrix
        set <- function(y) {
          x <<- y
          inverse_matrix <<- NULL
        }
        
        ##get the matrix
        get <- function() {
          x
        }
        
        ##set the inverse
        set_inverse <- function(i) {
          inverse_matrix <<- i
        }
        
        ##get the inverse
        get_inverse <- function() {
          inverse_matrix
        }
        
        ##return as a list
        list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)

}



## computes inverse of the makeCacheMatrix
## if inverse already calculated, retrieve inverse matrix

cacheSolve <- function(x, ...) {
  
        ##get the inverse from makeCacheMatrix
        cached_matrix <- x$get_inverse()
        
        ## return the computed inverse if it exists
        if (!is.null(cached_matrix)) {
          message("Getting cached data")
          return(cached_matrix)
        }
        
        ##grab the matrix and solve for the inverse
        matrix_data <- x$get()
        cached_matrix <- inv(matrix_data,...)
        
        ##set the inverse
        x$set_inverse(cached_matrix)
        
        cached_matrix
        
}
