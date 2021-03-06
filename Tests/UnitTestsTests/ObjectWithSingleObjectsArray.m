//
//  ObjectWithArray.m
//  UnitTests
//
//  Created by Ben Gordon on 11/13/13.
//  Copyright (c) 2013 Center for Advanced Public Safety. All rights reserved.
//

#import "ObjectWithSingleObjectsArray.h"

@implementation ObjectWithSingleObjectsArray

- (instancetype)init{
    if (self = [super init]) {
        // Set Property Type
        [self setValue:@"SingleObject" forKeyPath:@"propertyArrayMap.arrayOfObjects"];
    }
    
    return self;
}

+ (ObjectWithSingleObjectsArray *)newObjectWithArrayOfSingleObjects {
    ObjectWithSingleObjectsArray *newObject = [[ObjectWithSingleObjectsArray alloc] init];
    newObject.arrayOfObjects = @[[SingleObject newSingleObject],[SingleObject newSingleObject],[SingleObject newSingleObject],[SingleObject newSingleObject],[SingleObject newSingleObject]];
    return newObject;
}

@end
