@IsTest
global without sharing class ResponseMock implements HttpCalloutMock {

    static Map<String, String> response_data_map = new Map<String, String>{
        'http://test.com/'=>'{"message": "ok"}'
    };
    
    public ResponseMock(){}
    
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        
        HttpResponse res = new HttpResponse();
        switch on req.getEndpoint() {
            when 'http://test.com/' {
                res.setHeader('Content-Type', 'application/json');
                res.setBody(response_data_map.get('http://test.com/'));
                res.setStatusCode(201);
                return res;
            }
            when else {
                res.setHeader('Content-Type', 'application/json');
                res.setBody('{"message": "not found"}');
                res.setStatusCode(404);
                return res;
            }
        }
    }
}
