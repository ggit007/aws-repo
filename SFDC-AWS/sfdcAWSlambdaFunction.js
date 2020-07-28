// to be written in AWS Lambda function
// node.JS

const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB({apiVersion: '2012-08-10'});
var tableName = 'sfdcdynamodbtable';
 
exports.handler = (event, context, callback) => {
    dynamodb.putItem({
       // TableName: process.env.tableName,
       TableName: tableName,
        Item: {
            "id": {
                S: event.id
            },
            "Name": {
                S: event.Name
            }
        }
    }, function(err, data) {
        if (err) {
            console.log(err, err.stack);
            callback(null, {
                statusCode: '500',
                body: err
            });
        } else {
            callback(null, {
                statusCode: '200',
                body: 'Hello ' + event.id + event.Name + '!'
            });
        }
    })
};
