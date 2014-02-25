//
//  Letra.m
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra

@synthesize letra;
@synthesize palavra;
@synthesize imagem;

-(Letra *) initWithLetra:(char)l ePalavra:(NSString *)p eImagem:(UIImage *)i {
    self = [super init];
    if (self) {
        letra = l;
        palavra = p;
        imagem = i;
    }
    return self;
}

@end
