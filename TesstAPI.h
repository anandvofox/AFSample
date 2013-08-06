//
//  TesstAPI.h
//  AFTest
//
//  Created by Anand PR on 06/08/13.
//  Copyright (c) 2013 Vofox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TesstAPI : NSObject
+ (TesstAPI *)sharedAPI;
- (void)getFavoriteList:(void(^)(BOOL status,id responseObject,NSError *error))completionBlock;
@end
