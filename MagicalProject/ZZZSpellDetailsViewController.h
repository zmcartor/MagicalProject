//
//  ZZZSpellDetailsViewController.h
//  MagicalProject
//
//  Created by _Zach on 3/25/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MagicSpell;

@interface ZZZSpellDetailsViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *manaLabel;
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
- (IBAction)castButtonTouched:(id)sender;

- (instancetype)initWithSpell:(MagicSpell *)spell;

@end
