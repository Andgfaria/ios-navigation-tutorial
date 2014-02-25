//
//  Letra.h
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letra : NSObject

@property char letra;
@property NSString *palavra;
@property UIImage *imagem;

-(Letra *) initWithLetra:(char)l ePalavra:(NSString *)p eImagem:(UIImage *)i;

@end
