//
//  LetraFactory.m
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraFactory.h"

@implementation LetraFactory

static NSDictionary *relacaoLetras;

+(id)allocWithZone:(struct _NSZone *)zone {
        return [LetraFactory sharedInstance];
}

+(LetraFactory *) sharedInstance {
    static LetraFactory *instancia = nil;
    
    if (!instancia) {
        instancia = [[super allocWithZone:nil] init];
        if (!relacaoLetras) {
            relacaoLetras = [[NSDictionary alloc] initWithObjects:
                             @[@"Avião",@"Barco",@"Casa",@"Dado",@"Escola",@"Faca",@"Gato",@"Hamster",@"Igreja",@"Joaninha",@"Kiwi",@"Lápis",@"Mesa",@"Navio",@"Olho",@"Pato",@"Queijo",@"Rato",@"Sapo",@"Tesoura",@"Uva",@"Vento",@"Waffle",@"Xícara",@"Youtube",@"Zebra" ]
                                                          forKeys:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z" ]];
        }

    }
    return instancia;
}

-(Letra *)getLetra:(char)c {
    UIImage *imagem = [UIImage imageNamed:[NSString stringWithFormat:@"img%c.png",c]];
    Letra *l = [[Letra alloc] initWithLetra:c ePalavra:[relacaoLetras objectForKey:[NSString stringWithFormat:@"%c",c]] eImagem:imagem];
    return l;
}

@end

