//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Justin Steffen on 11/30/13.
//  Copyright (c) 2013 Justin Steffen. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (strong, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

//Good pattern to use to utilze outlets to refresh view while onscreen
//but if not on screen wait for viewWillAppear to refresh view.
- (void) setTextToAnalyze:(NSAttributedString *)textToAnalyze {
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void) updateUI {
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%d colorful characters",
                                         [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%d colorful characters",
                                         [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *) charactersWithAttribute:(NSString *) attributeName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }
        else {
            index ++;
        }
    }
    
    return characters;
}



@end
