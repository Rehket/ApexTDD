@IsTest
public without sharing class Request_Test {
    public Request_Test() {}

    @IsTest
    public static void test_Request_post(){
        Test.setMock(HttpCalloutMock.class, new ResponseMock());
        Response my_response = Request.post('http://test.com/');
        System.assertEquals(my_response.body, '{"message": "ok"}');
        System.assertEquals(my_response.status_code, 201);
    }
}
