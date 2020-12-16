@IsTest
public without sharing class Request_Test {
    public Request_Test() {}

    @IsTest
    public static void test_Request_post(){
        Test.setMock(HttpCalloutMock.class, new ResponseMock());
        Request.post();
    }
}
