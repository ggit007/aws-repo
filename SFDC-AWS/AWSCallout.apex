public class AWSCallout{

    public static string endpoint = 'https://1qdbf0noyk.execute-api.us-east-1.amazonaws.com/SFDCStage/dynamodboperation';
    public static final string POST = 'POST';    

    @future(callout=true)
    public static void callAWSapiGateway(string recordId, string name){
    
        Account acc;
    
        try{
            HttpRequest request = New HttpRequest();
            HttpResponse response = New HttpResponse();
            Http http = new Http();
            
                request.setEndpoint(endpoint);
                request.setMethod(POST);
                request.setHeader('Content-Type', 'application/json');
                request.setBody('{"id": "'+recordId+'","Name": "'+name+'"}');
                
                response = http.send(request);
                
                    acc = new Account();
                    acc.Id = recordId;
                    acc.Description = String.valueOf('PASS:' + '\n' + response.getStatus() + '\n' + 
                    response.getStatusCode() + '\n' + response.getBody());
                    
                    update acc;
                    
        }catch(Exception ex){
        
            acc = new Account();
            acc.Id = recordId;
            acc.Description = ex.getMessage();
            update acc;            
        }
    }
}
