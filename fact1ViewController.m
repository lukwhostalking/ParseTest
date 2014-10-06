//
//  fact1ViewController.m
//  ParseTest
//
//  Created by ANUPRIYA AGRAWAL on 9/29/14.
//  Copyright (c) 2014 IshanBhalla. All rights reserved.
//

#import "fact1ViewController.h"

@interface fact1ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *factImage;
@property (weak, nonatomic) IBOutlet UILabel *lblHeadline;
@property (weak, nonatomic) IBOutlet UILabel *lblStory;
@property (weak, nonatomic) IBOutlet UIButton *navButton;
- (IBAction)onHomeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollView;

@end

@implementation fact1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.factImage = self.fact
    NSLog(@"%@",self.fact);
    
    PFFile *imageFile = [self.fact objectForKey:@"Image"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
            self.factImage.image = image;
            //NSLog(@"%@",image);
        }
    }];

    
    
    self.lblHeadline.text = self.fact[@"Headline"];
    //self.lblStory.text = self.fact[@"Facts"];
    
    //self.lblStory.attributedText
    
    NSString *htmlString = self.fact[@"Facts"];
    //NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    //UIFont *font = [UIFont fontWithName:@"Helvetica" size:18];
    //[attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(35, 4)];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    [attString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica" size:18] range:NSMakeRange(0, attString.length)];
    [attString addAttribute: NSForegroundColorAttributeName value:[UIColor colorWithWhite:0 alpha:0.8] range:NSMakeRange(0,attString.length)];
    
    //UIFont * labelFont = [UIFont fontWithName:@"Helvetica" size:18];
    //UIColor * labelColor = [UIColor colorWithWhite:1 alpha:1];
    //NSShadow *shadow = [[NSShadow alloc] init];
    //[shadow setShadowColor : BLACK_SHADOW];
    //[shadow setShadowOffset : CGSizeMake (1.0, 1.0)];
    //[shadow setShadowBlurRadius : 1];
//    NSAttributedString *labelText = [[NSAttributedString alloc] initWithString : attributedString
//                                                                    attributes : @{
//
//                                                                                   NSKernAttributeName : @2.0,
//                                                                                   NSFontAttributeName : labelFont,
//                                                                                   }];
//
    
    
    self.lblStory.attributedText = attString;
    //[attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,5)];
    
    
    //[self.pageScrollView sizeToFit];
    
    [self.lblStory sizeToFit];
    self.pageScrollView.contentSize = CGSizeMake(320, self.lblStory.frame.size.height+self.lblHeadline.frame.size.height+self.factImage.frame.size.height + 50);
    //[self.lblStory layoutIfNeeded];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onHomeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
