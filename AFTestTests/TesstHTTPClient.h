//
//  TesstHTTPClient.h
//  AFTest
//
//  Created by Anand PR on 06/08/13.
//  Copyright (c) 2013 Vofox. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFNetworking.h"

@interface TesstHTTPClient : AFHTTPClient
+ (TesstHTTPClient *)sharedHTTPClient;
@end
