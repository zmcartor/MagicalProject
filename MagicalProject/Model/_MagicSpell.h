// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MagicSpell.h instead.

#import <CoreData/CoreData.h>

extern const struct MagicSpellAttributes {
	__unsafe_unretained NSString *damage;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *mana;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *timestamp;
} MagicSpellAttributes;

@interface MagicSpellID : NSManagedObjectID {}
@end

@interface _MagicSpell : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MagicSpellID*)objectID;

@property (nonatomic, strong) NSNumber* damage;

@property (atomic) int16_t damageValue;
- (int16_t)damageValue;
- (void)setDamageValue:(int16_t)value_;

//- (BOOL)validateDamage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int64_t idValue;
- (int64_t)idValue;
- (void)setIdValue:(int64_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* mana;

@property (atomic) int32_t manaValue;
- (int32_t)manaValue;
- (void)setManaValue:(int32_t)value_;

//- (BOOL)validateMana:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timestamp;

//- (BOOL)validateTimestamp:(id*)value_ error:(NSError**)error_;

@end

@interface _MagicSpell (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveDamage;
- (void)setPrimitiveDamage:(NSNumber*)value;

- (int16_t)primitiveDamageValue;
- (void)setPrimitiveDamageValue:(int16_t)value_;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int64_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int64_t)value_;

- (NSNumber*)primitiveMana;
- (void)setPrimitiveMana:(NSNumber*)value;

- (int32_t)primitiveManaValue;
- (void)setPrimitiveManaValue:(int32_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSDate*)primitiveTimestamp;
- (void)setPrimitiveTimestamp:(NSDate*)value;

@end
