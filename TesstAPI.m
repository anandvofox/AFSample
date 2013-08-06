//
//  TesstAPI.m
//  AFTest
//
//  Created by Anand PR on 06/08/13.
//  Copyright (c) 2013 Vofox. All rights reserved.
//

#import "TesstAPI.h"
#import "TesstHTTPClient.h"

#define URL_STRING @"GetList/"
static TesstAPI *instance = nil;

@implementation TesstAPI
+ (TesstAPI *)sharedAPI
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        instance = [[self alloc]init];
        
    });
    return instance;
}
- (void)getFavoriteList:(void(^)(BOOL status,id responseObject,NSError *error))completionBlock
{
//    NSUserDefaults *userDetails=[NSUserDefaults standardUserDefaults];
    TesstHTTPClient *httpClient = [TesstHTTPClient sharedHTTPClient];
    NSString *userid=[NSString stringWithFormat:@"123"];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:userid
                            ,@"userid",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:URL_STRING parameters:params];
    
    [httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation   JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        completionBlock(YES, JSON, Nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        completionBlock(NO, JSON,error);
    }];
    
    [operation start];
}
@end
