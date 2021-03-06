//
//  XMLTestCase.m
//  UnitTests
//
//  Created by Matthew York on 11/13/13.
//  Copyright (c) 2013 Center for Advanced Public Safety. All rights reserved.
//

#import "XCTestCase+ObjectMapTestCategory.h"
#import "SingleObject.h"
#import "NestedObject.h"
#import "ObjectWithSingleObjectsArray.h"
#import "ObjectWithNestedObjectsArray.h"

@interface XMLTestCase : XCTestCase

@end

@implementation XMLTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testSingleObject{
    //Create object to be serialized
    SingleObject *testSingleObject = [SingleObject newSingleObject];
    
    //Serialize object, then deserialize it back to an object
    SingleObject *deserializedObject = [NSObject objectOfClass:@"SingleObject" fromXML:[testSingleObject XMLString]];
    
    //Test all properties
    [self testObject:testSingleObject withDeserializedVersion:deserializedObject forMethodNamed:@"testSingleObject" dataType:DataTypeXML];
}

-(void)testNestedObject{
    //Create test object
    NestedObject *testObject = [NestedObject newNestedObject];
    
    //Serialize object, then deserialize it back to an object
    NestedObject *deserializedObject = [NSObject objectOfClass:@"NestedObject" fromXML:[testObject XMLString]];
    
    //Test all properties recursively
    [self testObject:testObject withDeserializedVersion:deserializedObject forMethodNamed:@"testNestedObject" dataType:DataTypeXML];
}

-(void)testObjectWithArrayOfObjects{
    // Create Single Object Array
    ObjectWithSingleObjectsArray *testSingleObjectArray = [ObjectWithSingleObjectsArray newObjectWithArrayOfSingleObjects];
    SingleObject *deserializedSingleObjectArray = [NSObject objectOfClass:@"ObjectWithSingleObjectsArray" fromXML:[testSingleObjectArray XMLString]];
    
    // Create Nested Object Array
    ObjectWithNestedObjectsArray *testNestedObjectArray = [ObjectWithNestedObjectsArray newObjectWithArrayOfNestedObjects];
    NestedObject *deserializedNestedObjectArray = [NSObject objectOfClass:@"ObjectWithNestedObjectsArray" fromXML:[testNestedObjectArray XMLString]];
    
    // Test Arrays
    [self testObject:testSingleObjectArray withDeserializedVersion:deserializedSingleObjectArray forMethodNamed:@"testObjectWithArrayOfObjects-Single" dataType:DataTypeXML];
    [self testObject:testNestedObjectArray withDeserializedVersion:deserializedNestedObjectArray forMethodNamed:@"testObjectWithArrayOfObjects-Nested" dataType:DataTypeXML];
}

/*
-(void)testMissingProperties{
    // Create Single Object with no Properties filled in
    SingleObject *testSingleObject = [[SingleObject alloc] init];
    SingleObject *deserializedObject = [NSObject objectOfClass:@"SingleObject" fromJSONData:[testSingleObject JSONData]];
    
    // Test
    [self testObject:testSingleObject withDeserializedVersion:deserializedObject forMethodNamed:@"testNilProperties" dataType:DataTypeXML];
}
 */

-(void)testExtraProperties{
    
}


@end
