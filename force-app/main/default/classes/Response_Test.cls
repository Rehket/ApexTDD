@IsTest
public without sharing class Response_Test {

    @IsTest
    public static void test_Response_constructor(){

        String body = 'my_text_body';
        Integer status_code = 200;
        Response my_res = new Response(body, status_code);
        System.assert(my_res.body == body);
        System.assert(my_res.status_code == status_code);
    }
}
