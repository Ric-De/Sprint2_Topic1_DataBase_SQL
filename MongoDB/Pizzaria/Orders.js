
db.createCollection( 'Orders', {validator: {$jsonSchema: {bsonType: 'object',title:'Orders',required: [         'Stores',          'Customers',          'Products'],properties: {order_date: {bsonType: 'date'},deliver_type: {enum: },total_price: {bsonType: 'decimal'},products: {bsonType: 'array',items: {
title:'object',properties: {quantity: {bsonType: 'int'},product_id: {bsonType: 'string'}}}},Stores: {bsonType: 'objectId'},Customers: {bsonType: 'objectId'},Products: {bsonType: 'objectId'},home_delivery: {bsonType: 'object',
title:'object',properties: {delivery_time: {bsonType: 'date'},employee: {bsonType: 'object',
title:'object',}}}}         }      }});  