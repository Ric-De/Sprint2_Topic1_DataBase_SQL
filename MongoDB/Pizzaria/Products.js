
db.createCollection( 'Products', {validator: {$jsonSchema: {bsonType: 'object',title:'Products',required: [         'Orders'],properties: {name: {bsonType: 'string'},description: {bsonType: 'string'},image: {bsonType: 'string'},price: {bsonType: 'decimal'},product_type: {enum: },Orders: {bsonType: 'objectId'},category: {bsonType: 'array',items: {
title:'object',}}}         }      }});  