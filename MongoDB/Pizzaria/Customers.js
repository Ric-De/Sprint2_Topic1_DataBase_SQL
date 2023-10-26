
db.createCollection( 'Customers', {validator: {$jsonSchema: {bsonType: 'object',title:'Customers',properties: {name: {bsonType: 'string'},last_name: {bsonType: 'string'},address_info: {bsonType: 'array',items: {
title:'object',properties: {province: {bsonType: 'string'},city: {bsonType: 'string'},postal_code: {bsonType: 'int'},telephone: {bsonType: 'int'}}}}}         }      }});  