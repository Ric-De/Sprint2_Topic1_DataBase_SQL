
db.createCollection( 'Stores', {validator: {$jsonSchema: {bsonType: 'object',title:'Stores',properties: {province: {bsonType: 'string'},city: {bsonType: 'string'},postal_code: {bsonType: 'int'},address: {bsonType: 'string'}}         }      }});  