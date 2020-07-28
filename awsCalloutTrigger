trigger awsCalloutTrigger on SubscribetoAWSLambda__e (after insert) {
  
    if(trigger.isAfter && trigger.isInsert){
        for(SubscribetoAWSLambda__e eve : Trigger.New){
            AWSCallout.callAWSapiGateway(eve.AccountId__c, eve.Name__c);
        }        
    }
}
