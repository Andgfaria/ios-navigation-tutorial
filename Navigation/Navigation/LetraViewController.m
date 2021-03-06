//
//  LetraViewController.m
//  Navigation
//
//  Created by André Gimenez Faria on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"
#import "LetraFactory.h"
@import AVFoundation;

@interface LetraViewController ()

@end

@implementation LetraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(LetraViewController *) initWithLetra:(Letra *)l {
    self = [super initWithNibName:@"LetraViewController" bundle:nil];
    if (self) {
        letra = l;
        factory = [LetraFactory sharedInstance];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (letra.letra != 'A') {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(viewAnterior)];
    }
    if (letra.letra != 'Z') {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(proximaView)];
    }
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%c",letra.letra]];
    [_btnPalavra setTitle:letra.palavra forState:UIControlStateNormal];
    [_imgPalavra setImage:letra.imagem];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewAnterior {
    if (self.navigationController.viewControllers.count <= 1) {
        LetraViewController *viewAnteriorDaAnterior = [[LetraViewController alloc] initWithLetra:[factory getLetra:letra.letra - 1]];
    
        NSMutableArray *novoArray = [[NSMutableArray alloc] initWithObjects:viewAnteriorDaAnterior, self, nil];
        self.navigationController.viewControllers = novoArray;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) proximaView {
    Letra *l = [factory getLetra:letra.letra + 1];
    LetraViewController *proxima = [[LetraViewController alloc] initWithLetra:l];
    if (self.navigationController.viewControllers.count > 1) {
        UIViewController *viewAnterior = self.navigationController.viewControllers.lastObject;
        NSMutableArray *novoArray = [[NSMutableArray alloc] initWithObjects:viewAnterior, nil];
        self.navigationController.viewControllers = novoArray;
    }
    [self.navigationController pushViewController:proxima animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ouvirPalavra:(id)sender {
    AVSpeechUtterance *speechUtterance = [[AVSpeechUtterance alloc] initWithString:letra.palavra];
    speechUtterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    speechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-br"];
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
    [synth speakUtterance:speechUtterance];
}
@end
