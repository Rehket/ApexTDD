# Test Driven Software Development

Build tests and scenarios first, write code once. 

## How to get started with TDD in Apex

1. Write out expected classes to describe the feature or change you are making.
   1. Ex: If the feature is to create a Http Request Framework, the classes might be `Request.cls`, `Request_Test.cls` , `Response.cls`, and  `Response_Test.cls` 
2. Based on your scenarios, stub out the methods that will be used to actually implement the features you are making. 
   1.  `Request.buildRequest() -> Request` or `Request.post() -> Response` and `Request_Test.test_buildRequest()` or `Request_Test.test_post()`
3. Inside your test functions, build out the checks and assertions for validating that the function is working correctly. Running your tests at this point should result in failures.
   - It is likely you will need to stub out some mocks to get the tests to the point that they will compile. 
4. Add code to your non-test classes to fix the failures. 

## Scenario

When a call to a http method on the `Request` class is called, a request will be constructed, then a http request will be sent to the provided endpoint. 
1. A call to `Request.post()` request will result in the result in a http post request being made.
   - The request should inlcude the request payload if any.
   - The request method should be `POST`.
   - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST
  
2. A call to `Request.patch()` request will result in the result in a http patch request being made.
   - The request should inlcude the request payload if any.
   - The request method should be `PATCH`. 
   - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH

3. A call to `Request.put()` request will result in the result in a http put request being made.
   - The request should inlcude the request payload if any.
   - The request method should be `PUT`. 
   - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT

4. A call to `Request.get()` request will result in the result in a http get request being made.
   - The request should not inlcude any request payload.
   - The request method should be `GET`. 
   - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET
  
5. A call to `Request.delete()` request will result in the result in a http get request being made.
   - The request should inlcude the request payload if any.
   - The request method should be `DELETE`.
   - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE


## Staring Point

If we were startring this feature from scratch, creating our initial classes would look something like the clases below.

Request Class
```java
public without sharing class Request {
   public Request() {}
}
```


Request_Test Class
```java
@IsTest
public without sharing class Request_Test {
   public Request_Test() {}
}
```

-------------------

At this point, if we were going to start creating our test methods, we will start getting compile errors. 

```java
@IsTest
public with sharing class Request_Test {
    public Request_Test() {}

    @IsTest
    public static void test_Request_post(){
        Request.post();
    }
}
```

```shell
=== Deploy Errors
PROJECT PATH                                     ERRORS                                                                                
──────────────────────────────────────────────────────────────────────────────────────
force-app\main\default\classes\Request_Test.cls  Method does not exist or incorrect signature: void post() from the type Request (7:17)
```

So we will need to start stubbing out the Response classes construct our other functions. If we weere going to always return some primitive such as a string, we wouldn't need a whole class to describe our responses. 

Response Class
```java
public without sharing class Response {
   public Response() {
   }
}
```


Request_Test Class
```java
@IsTest
public without sharing class Response_Test {
   public Response_Test() {
   }
}
```

Now we have all the individual pieces to get our code to compile.

From this point until the scenario is satisfied, Stub, Test, and code to satisfy the tests until the scenarios are satisfied. 
![](docs\src\testing_loop.png)