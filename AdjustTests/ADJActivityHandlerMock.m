//
//  ADJActivityHandlerMock.m
//  Adjust
//
//  Created by Pedro Filipe on 11/02/14.
//  Copyright (c) 2014 adjust GmbH. All rights reserved.
//

#import "ADJActivityHandlerMock.h"
#import "ADJLoggerMock.h"
#import "ADJAdjustFactory.h"

static NSString * const prefix = @"ActivityHandler ";

@interface ADJActivityHandlerMock()

@property (nonatomic, strong) ADJLoggerMock *loggerMock;
@property (nonatomic, retain) ADJResponseData * lastResponseData;

@end

@implementation ADJActivityHandlerMock

- (id)initWithConfig:(ADJConfig *)adjustConfig {
    self = [super init];
    if (self == nil) return nil;

    self.loggerMock = (ADJLoggerMock *) [ADJAdjustFactory logger];

    [self.loggerMock test:[prefix stringByAppendingFormat:@"initWithConfig"]];

    return self;
}

- (void)applicationDidBecomeActive {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"applicationDidBecomeActive"]];
}
- (void)applicationWillResignActive {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"applicationWillResignActive"]];
}

- (void)trackEvent:(ADJEvent *)event {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"trackEvent"]];

}

- (void)finishedTracking:(ADJResponseData *)responseData {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"finishedTracking, %@", responseData]];
    self.lastResponseData = responseData;
}

- (void)launchEventResponseTasks:(ADJEventResponseData *)eventResponseData {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"launchEventResponseTasks, %@", eventResponseData]];
    self.lastResponseData = eventResponseData;
}

- (void)launchSessionResponseTasks:(ADJSessionResponseData *)sessionResponseData {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"launchSessionResponseTasks, %@", sessionResponseData]];
    self.lastResponseData = sessionResponseData;
}

- (void)launchAttributionResponseTasks:(ADJAttributionResponseData *)attributionResponseData {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"launchAttributionResponseTasks, %@", attributionResponseData]];
    self.lastResponseData = attributionResponseData;
}

- (void)setEnabled:(BOOL)enabled {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setEnabled enabled:%d", enabled]];
}

- (BOOL)isEnabled {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"isEnabled"]];
    return YES;
}

- (void)appWillOpenUrl:(NSURL *)url {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"readOpenUrl"]];
}

- (void)setDeviceToken:(NSData *)pushToken {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"savePushToken"]];
}

- (ADJAttribution*) attribution {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"attribution"]];
    return (ADJAttribution *)[NSNull null];
}

- (void) setAttribution:(ADJAttribution*)attribution {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setAttribution"]];
}

- (void) setAskingAttribution:(BOOL)askingAttribution {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setAskingAttribution, %d", askingAttribution]];
}

- (BOOL) updateAttribution:(ADJAttribution*) attribution {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"updateAttribution, %@", attribution]];
    self.attributionUpdated = attribution;
    return NO;
}

- (void) setIadDate:(NSDate*)iAdImpressionDate withPurchaseDate:(NSDate*)appPurchaseDate {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setIadDate, iAdImpressionDate %@ appPurchaseDate, %@", iAdImpressionDate, appPurchaseDate]];
}

- (void)setIadDetails:(NSDictionary *)attributionDetails
                error:(NSError *)error
          retriesLeft:(int)retriesLeft {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setIadDetails, %@ error, %@", attributionDetails, error]];
}

- (void) setOfflineMode:(BOOL)enabled {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setOfflineMode"]];
}

- (ADJInternalState*) internalState {
    return nil;
}

@end
