//
//  MagicSpell.h
//  MagicalProject
//
//  Created by _Zach on 3/21/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MagicSpell : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * mana;
@property (nonatomic, retain) NSDate * timestamp;

@end
