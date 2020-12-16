public without sharing class Response {
    public integer status_code;
    public string body;

    public Response() {}
    public Response(String body, Integer status_code) {
        this.body = body;
        this.status_code = status_code;
    }
}
