// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MagicSpell.h instead.

#import <CoreData/CoreData.h>

extern const struct MagicSpellAttributes {
	__unsafe_unretained NSString *castCount;
	__unsafe_unretained NSString *damage;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *magicSpellID;
	__unsafe_unretained NSString *mana;
	__unsafe_unretained NSString *name;
} MagicSpellAttributes;

@interface MagicSpellID : NSManagedObjectID {}
@end

@interface _MagicSpell : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MagicSpellID*)objectID;

@property (nonatomic, strong) NSNumber* castCount;

@property (atomic) int16_t castCountValue;
- (int16_t)castCountValue;
- (void)setCastCountValue:(int16_t)value_;

//- (BOOL)validateCastCount:(id*)value_ error:(NSError**)error_;

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

@property (nonatomic, strong) NSNumber* magicSpellID;

@property (atomic) int64_t magicSpellIDValue;
- (int64_t)magicSpellIDValue;
- (void)setMagicSpellIDValue:(int64_t)value_;

//- (BOOL)validateMagicSpellID:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* mana;

@property (atomic) int32_t manaValue;
- (int32_t)manaValue;
- (void)setManaValue:(int32_t)value_;

//- (BOOL)validateMana:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@end

@interface _MagicSpell (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCastCount;
- (void)setPrimitiveCastCount:(NSNumber*)value;

- (int16_t)primitiveCastCountValue;
- (void)setPrimitiveCastCountValue:(int16_t)value_;

- (NSNumber*)primitiveDamage;
- (void)setPrimitiveDamage:(NSNumber*)value;

- (int16_t)primitiveDamageValue;
- (void)setPrimitiveDamageValue:(int16_t)value_;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int64_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int64_t)value_;

- (NSNumber*)primitiveMagicSpellID;
- (void)setPrimitiveMagicSpellID:(NSNumber*)value;

- (int64_t)primitiveMagicSpellIDValue;
- (void)setPrimitiveMagicSpellIDValue:(int64_t)value_;

- (NSNumber*)primitiveMana;
- (void)setPrimitiveMana:(NSNumber*)value;

- (int32_t)primitiveManaValue;
- (void)setPrimitiveManaValue:(int32_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

@end
