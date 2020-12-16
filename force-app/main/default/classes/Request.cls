public without sharing class Request {
    public Request() {}

    public static Response post(String url){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('POST');
        Http h = new Http();
        HttpResponse res = h.send(req);
        return new Response(res.getBody(), res.getStatusCode());
    }
    public static Response get(String url){
        return new Response();
    }
    public static Response put(String url){
        return new Response();
    }
    public static Response patch(String url){
        return new Response();
    }
}
