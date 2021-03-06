// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PNAppPostClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const playnationBaseURLString = @"http://playnation.eu/beta/hacks/";

@implementation AFClient

+ (AFClient *)sharedClient
{
    static AFClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFClient alloc] initWithBaseURL:[NSURL URLWithString:playnationBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	//[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    
    
    return self;
}

// Returns a custom NSMutableURLRequest for the public stream
- (NSMutableURLRequest *)POSTRequestForClass:(NSString *)className parameters:(NSDictionary *)params
{
   
    params = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"tableName=companies",@"Companies"
                  ,@"tableName=groups",@"Groups"
                  ,@"tableName=news",@"News"
                  ,@"tableName=player",@"Players"
                  ,@"tableName=games",@"Games",nil];
    
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST"
                                                      path:@"getItemiOStest.php" parameters:[params objectForKey:className]];
    
    [request setHTTPBody:[[params objectForKey:className] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSLog(@"REQUEST, %@", request);
    
    return request;
}

- (NSMutableURLRequest *)POSTRequestForAllRecordsOfClass:(NSString *)className
{
    NSMutableURLRequest *request = nil;
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"tableName=companies",@"Companies"
                            ,@"tableName=groups",@"Groups"
                            ,@"tableName=news",@"News"
                            ,@"tableName=player",@"Players"
                            ,@"tableName=games",@"Games",nil];
    
    request = [self POSTRequestForClass:className parameters:[params objectForKey:className]];
    
    [request setHTTPBody:[[params objectForKey:className] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSLog(@"REQUEST, %@", request);
    
    return request;
    
    
}

@end
