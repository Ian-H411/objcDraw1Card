//
//  IMHCardController.m
//  objCdrawOneCard
//
//  Created by Ian Hall on 8/20/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHCardController.h"
#import "IMHCard.h"

@implementation IMHCardController

+ (IMHCardController *)shared
{
    static IMHCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [IMHCardController new];
    });
    return shared;
    
}

+ (void)drawANewCard:(NSInteger)count completion:(void (^)(NSArray<IMHCard *> * _Nullable))completion
{
    NSString *cardCount = [@(count) stringValue];
    
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://deckofcardsapi.com/api/deck/14l2dqg9qwj8/draw/"];
    
    NSURLComponents *urlcomponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    
    urlcomponents.queryItems = @[query];
    
    NSURL *finalURL = urlcomponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return ;
        }
        if (!data)
        {
            NSLog(@"ya done goofed");
            completion(nil);
            return;
        }
        NSDictionary *jsondictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray *cardObjectArray = [[NSMutableArray alloc] init];
        NSArray *cardsArray = jsondictionary[@"cards"];
        for (NSDictionary *cardDictionary in cardsArray)
        {
            IMHCard *card = [[IMHCard alloc] initWithDictionary:cardDictionary];
            [cardObjectArray addObject:card];
        }
        completion(cardObjectArray);
        return;
        
    }]resume];
}


+ (void)fetchImage:(IMHCard *)card completed:(void (^)(UIImage * _Nonnull))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"whoopsies %@", error);
            completion(nil);
            return;
        }
        if (!data)
        {
            completion(nil);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        return;
    }]resume];
}
@end
