//
//  IMHCard.h
//  objCdrawOneCard
//
//  Created by Ian Hall on 8/20/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMHCard : NSObject

@property (nonatomic, copy, readonly)NSString *suit;

@property (nonatomic, copy, readonly)NSString *image;

-(instancetype) initWithSuit:(NSString *)suit image:(NSString *)image;



@end

@interface IMHCard (JSONSerialization)

-(instancetype) initWithDictionary:(NSDictionary<NSString*,id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
