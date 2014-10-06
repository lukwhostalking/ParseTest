//
//  ViewController.m
//  ParseTest
//
//  Created by ANUPRIYA AGRAWAL on 9/25/14.
//  Copyright (c) 2014 IshanBhalla. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "fact1ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *homeVC;
@property (weak, nonatomic) IBOutlet UIView *yellowVC;
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
//@property (weak, nonatomic) IBOutlet UIWebView *testView;
@property (weak, nonatomic) IBOutlet UIView *masterVC;
@property (weak, nonatomic) IBOutlet UIImageView *articleImage;
@property (weak, nonatomic) IBOutlet UIImageView *article2Image;
@property (weak, nonatomic) IBOutlet UIImageView *article3Image;
@property (nonatomic,strong) PFObject *factObj1;
@property (nonatomic,strong) PFObject *factObj2;
@property (nonatomic,strong) PFObject *factObj3;

@property (nonatomic,strong) UIImage *image1;

- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;
@property (weak, nonatomic) IBOutlet UILabel *lblHeadline1;
@property (weak, nonatomic) IBOutlet UILabel *lblHeadline2;
@property (weak, nonatomic) IBOutlet UILabel *lblHeadline3;
- (void) loadFactViewController;


- (IBAction)onFact1Tap:(id)sender;
- (IBAction)onFact2Tap:(id)sender;
- (IBAction)onFact3Tap:(id)sender;

@end

@implementation ViewController
- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
//    [query getObjectInBackgroundWithId:@"J49oWuxO1W" block:^(PFObject *testRet, NSError *error) {
//        // Do something with the returned PFObject in the gameScore variable.
//        NSLog(@"%@", testRet);
//    }];
//    
//    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
//    gameScore[@"score"] = @1337;
//    gameScore[@"playerName"] = @"Sean Plott";
//    gameScore[@"cheatMode"] = @NO;
//    [gameScore saveInBackground];
    
    //[self.view bringSubviewToFront:self.homeVC];


    PFQuery *query = [PFQuery queryWithClassName:@"Facts"];
    [query getObjectInBackgroundWithId:@"7nvFt1SoJU" block:^(PFObject *testRet, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        //NSLog(@"%@", testRet);

     PFQuery *query1 = [PFQuery queryWithClassName:@"Facts"];
        [query1 whereKey:@"date" equalTo:@"12-05-14" ];
        [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %d objects.", objects.count);
                    

                
                //NSLog(@"%@",objects);
                for (PFObject *factObj in objects)
                {
                    
                    //NSLog(@"%@",factObj[@"factNumber"]);
                    if ([factObj[@"factNumber"] isEqualToNumber:@1]){
                        self.factObj1 = factObj;
                    }
                    else if ([factObj[@"factNumber"] isEqualToNumber:@2]){
                        self.factObj2 = factObj;
                    }
                    else if ([factObj[@"factNumber"] isEqualToNumber:@3]){
                        self.factObj3 = factObj;
                    }
                };
                
                
                //factObj1 = [objects objectAtIndex:0];

                
                //NSString *fact1 = factObj1[@"Facts"];
                //NSLog(fact1);
                
                PFFile *imageFile = [self.factObj1 objectForKey:@"Image"];
                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:data];
                        //assigning fact 1 image to global variable image1
                        self.image1 = image;
                        
                        UIImage *maskingImage = [UIImage imageNamed:@"maskImage"];
                        //maskingImage
                        
                        self.articleImage.image = [self maskImage:image withMask:maskingImage];
                        self.lblHeadline1.text = self.factObj1[@"Headline"];
                        self.lblHeadline1.transform = CGAffineTransformMakeRotation(-17 * M_PI / 180.0);

                        //self.articleImage.image = image;
                    }
                }];
                
                
                //factObj2 = [objects objectAtIndex:1];
                
                
                //NSString *fact1 = factObj1[@"Facts"];
                //NSLog(fact1);
                
                PFFile *image2File = [self.factObj2 objectForKey:@"Image"];
                [image2File getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:data];
                        
                        UIImage *maskingImage = [UIImage imageNamed:@"maskImage"];
                        self.article2Image.image = [self maskImage:image withMask:maskingImage];

                        self.lblHeadline2.text = self.factObj2[@"Headline"];
                        self.lblHeadline2.transform = CGAffineTransformMakeRotation(-17 * M_PI / 180.0);

                        
                        //self.article2Image.image = image;
                    }
                }];
                
                
                //factObj3 = [objects objectAtIndex:2];
                
                
                //NSString *fact1 = factObj1[@"Facts"];
                //NSLog(fact1);
                
                PFFile *image3File = [self.factObj3 objectForKey:@"Image"];
                [image3File getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:data];
                        //self.article3Image.image = image;
                        UIImage *maskingImage = [UIImage imageNamed:@"maskImage"];
                        self.article3Image.image = [self maskImage:image withMask:maskingImage];

                        self.lblHeadline3.text = self.factObj3[@"Headline"];
                        self.lblHeadline3.transform = CGAffineTransformMakeRotation(-17 * M_PI / 180.0);
                        
                    }
                }];

                
                
                
            }}];
        
        if (!error) {
            PFFile *imageFile = [testRet objectForKey:@"Image"];
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    UIImage *image = [UIImage imageWithData:data];
                    //self.articleImage.image = image;
                }
            }];
            
    
        }
                
            // Do something with the returned PFObject in the gameScore variable.
            //NSLog(@"%@", testRet);

        
        
        //NSString *fact = testRet[@"Facts"];
        //NSLog(fact);
        
        NSString *fact = testRet[@"Facts"];
        
        self.lblTest.text = fact;
        //[self.testView loadHTMLString:fact baseURL:nil];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)onFact1Tap:(id)sender {
    NSLog(@"fact1 tapped");
    
    
    fact1ViewController *fact1VC = [[fact1ViewController alloc]init];
    
    fact1VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    fact1VC.fact = self.factObj1;
    [self.yellowVC addSubview:fact1VC.view];
    
    [UIView animateWithDuration:1.5 animations:^{
        
        [self.article2Image setFrame:CGRectMake(0, 1140, 320, 254)];
        [self.article3Image setFrame:CGRectMake(0, 1140, 320, 254)];
        NSLog(@"in animation block");
        
        
    }];
    
    
    self.articleImage.image = self.image1;
    self.lblHeadline1.hidden = TRUE;
    
    
    
    //[self.masterVC bringSubviewToFront:self.yellowVC];

    
    [self performSelector:@selector (loadFactViewController) withObject:nil afterDelay:0.5];
    
    //[self prese]
    
    

    
    
    
}

- (void) loadFactViewController{
    
    //fact1ViewController *fact1VC = [[fact1ViewController alloc]init];
    
    //fact1VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //fact1VC.fact = self.factObj1;
    
    //self.article2Image.hidden = TRUE;
    //self.article3Image.hidden = TRUE;
    //[self.yellowVC addSubview:fact1VC.view];
    
    [self.masterVC bringSubviewToFront:self.yellowVC];
    

    //[self presentViewController:fact1VC animated:YES completion:Nil];
    
}

- (IBAction)onFact2Tap:(id)sender {
    NSLog(@"fact2 tapped");
    fact1ViewController *fact2VC = [[fact1ViewController alloc]init];
    
    fact2VC.modalTransitionStyle = UIModalPresentationFormSheet;
    
    fact2VC.fact = self.factObj2;
    
    //[self reloadInputViews];
    
    
    
    [self presentViewController:fact2VC animated:YES completion:Nil];
    
}

- (IBAction)onFact3Tap:(id)sender {
    NSLog(@"fact3 tapped");
    fact1ViewController *fact3VC = [[fact1ViewController alloc]init];
    
    fact3VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    fact3VC.fact = self.factObj3;
    
    [self presentViewController:fact3VC animated:YES completion:Nil];

}
@end
