//
//  IMHCardController.h
//  objCdrawOneCard
//
//  Created by Ian Hall on 8/20/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMHCard.h"

#import <UIKit/UIKit.h>


@interface IMHCardController : NSObject

+ (IMHCardController *) shared;

+(void) drawANewCard:(NSInteger)count completion:(void (^)(NSArray<IMHCard *> *cards))completion;

+(void) fetchImage:(IMHCard *)card completed:(void (^) (UIImage *image))completion;

@end
