//
//  TesstHTTPClient.m
//  AFTest
//
//  Created by Anand PR on 06/08/13.
//  Copyright (c) 2013 Vofox. All rights reserved.
//

#import "TesstHTTPClient.h"

#define LOCAL_IP @"http://Service.svc"
#define PUBLIC_IP @"http://service.svc/"

@implementation TesstHTTPClient

+ (TesstHTTPClient *)sharedHTTPClient
{
    NSString *urlStr = LOCAL_IP;
    
    static dispatch_once_t pred;
    static TesstHTTPClient *sharedHTTPClient = nil;
    
    dispatch_once(&pred, ^{ sharedHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return sharedHTTPClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
