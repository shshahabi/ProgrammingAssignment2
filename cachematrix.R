## this function is created for preventing large computing over and over
#due to the lexical scoping feature in r we can store inversion of a matrix
#in memory and prevent to compute it repeatedly 
# Lexical scopes, allow to create functions within a function and new 
# "user defined" objects (data types) to store data within several environments

#makeCacheMatrix input is a matrix and it evalute the inverse of that matrix and cache it in memory
makeCacheMatrix <- function(x = matrix()) {
  t<-NULL   
  
  set<-function(y){  
    x<<-y  
    t<<-NULL 
  }
  
  get<-function() x  
  setinverse<-function(solve) t<<- solve  
  getinverse<-function() t 
  
  list (set=set, get = get,  
        setinverse = setinverse,
        getinverse = getinverse)
}

## The function "cacheSolve" returns the inverse of matrix that is returned by makeCacheMatrix function


cacheSolve <- function(x , ...) {
  t <- x$getinverse() 
  if(!is.null(t)){
      message("getting cached data")
      return(t) 
    }

    y <- x$get() 
    x$set(y) 
    t <- solve(y, ...) 
    x$setinverse(t) 
    t 
}
