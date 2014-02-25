//
//  LetraFactory.h
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Letra.h"

@interface LetraFactory : NSObject

+(LetraFactory *) sharedInstance;
-(Letra *) getLetra:(char)c;

@end
