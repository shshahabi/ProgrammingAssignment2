### Introduction

in this programming assignment the goal is to take advantage of lexical scoping 

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. 
below you can see how code is written 
in the first level we get matrix a and compute the inverse and cache it in memory


          ` makeCacheMatrix <- function(x = matrix()) {
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
             }`

     
     

The following function calculates the inverse of matrix but first it check if we have the same value in `makeCacheMatrix`if so then it doesnot run the execution again
and just return that matrix and if it wasnot in the memory it going to compute the inverse and then save it as a chache so it will be available for later.


        `cacheSolve <- function(x , ...) {
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
        }`

### Assignment: Caching the Inverse of a Matrix

