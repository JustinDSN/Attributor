//
//  AttributorViewController.m
//  Attributor
//
//  Created by Justin Steffen on 11/21/13.
//  Copyright (c) 2013 Justin Steffen. All rights reserved.
//

#import "AttributorViewController.h"

@interface AttributorViewController ()
@property (strong, nonatomic) IBOutlet UILabel *header;
@property (strong, nonatomic) IBOutlet UITextView *body;
@property (strong, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation AttributorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title =
        [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName : self.outlineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}
- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName : [UIColor blackColor]}
                                   range:self.body.selectedRange];
}
- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
    [self.body.textStorage removeAttribute:NSStrokeColorAttributeName
                                     range:self.body.selectedRange];
}

@end
