//
//  IMHCard.m
//  objCdrawOneCard
//
//  Created by Ian Hall on 8/20/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHCard.h"

static NSString * const carKey = @"cards";

static NSString * const suitKey = @"suit";

static NSString * const imageKey = @"image";

static NSString * const imageTypeKey = @"png";

@implementation IMHCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self != nil)
    {
        _suit = suit;
        _image = image;
    }
    return self;
}




@end

@implementation IMHCard (JSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{

    NSString *suit = dictionary[suitKey];
    
    NSString *image = dictionary[imageKey];

    return [self initWithSuit:suit image:image];
}

@end
