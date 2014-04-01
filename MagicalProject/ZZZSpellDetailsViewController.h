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
@property (weak, nonatomic) IBOutlet UILabel *castLabel;

@property(nonatomic, strong) MagicSpell *spellModel;

- (IBAction)castButtonTouched:(id)sender;

/**
 *  Super awesome method to initialize the method with a model. Now THAT is some software engineering haha
 *
 *  @param spell the spell y'all want to cast yoyoyo do you get me ? This is really cool then.
 *
 *  @return a new instance of this stuff
 */
- (instancetype)initWithSpell:(MagicSpell *)spell;

@end
