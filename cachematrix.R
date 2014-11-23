## This is a function that creates a special matrix object that can cache its inverse.

## This function creates matrix M and sets the inverse I to null.

makeCacheMatrix <- function(M = matrix()) {
        I <- NULL
        set_M <- function(matrix) {
                M <<- matrix
                I <<- NULL
        }
        get_M <- function() {
                M
        }
        set_inverse <- function(inverse) {
                I <<- inverse
        }
        get_inverse <- function() {
                I
        }
        list(set_M = set_M, get_M = get_M,
             set_inverse = set_inverse,
             get_inverse = get_inverse)
}
## This funciton solves the matrix, calculates the inverse, then retrieves the inverse.

cacheSolve <- function(x, ...) {
        M <- x$get_inverse()
        data <- x$get()
        M <- solve(data) %*% data
        x$set_inverse(M)
        M
}
