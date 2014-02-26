//
//  LetraViewController.h
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Letra.h"
#import "LetraFactory.h"

@interface LetraViewController : UIViewController {
    Letra *letra;
    LetraFactory *factory;
}
@property (weak, nonatomic) IBOutlet UILabel *txtLetra;
@property (weak, nonatomic) IBOutlet UIImageView *imgPalavra;
@property (weak, nonatomic) IBOutlet UIButton *btnPalavra;

-(LetraViewController *) initWithLetra:(Letra *)l;

- (IBAction)ouvirPalavra:(id)sender;


@end
