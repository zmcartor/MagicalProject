// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MagicSpell.m instead.

#import "_MagicSpell.h"

const struct MagicSpellAttributes MagicSpellAttributes = {
	.damage = @"damage",
	.id = @"id",
	.mana = @"mana",
	.name = @"name",
	.timestamp = @"timestamp",
};

@implementation MagicSpellID
@end

@implementation _MagicSpell

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MagicSpell" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MagicSpell";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MagicSpell" inManagedObjectContext:moc_];
}

- (MagicSpellID*)objectID {
	return (MagicSpellID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"damageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"damage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"manaValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mana"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic damage;

- (int16_t)damageValue {
	NSNumber *result = [self damage];
	return [result shortValue];
}

- (void)setDamageValue:(int16_t)value_ {
	[self setDamage:@(value_)];
}

- (int16_t)primitiveDamageValue {
	NSNumber *result = [self primitiveDamage];
	return [result shortValue];
}

- (void)setPrimitiveDamageValue:(int16_t)value_ {
	[self setPrimitiveDamage:@(value_)];
}

@dynamic id;

- (int64_t)idValue {
	NSNumber *result = [self id];
	return [result longLongValue];
}

- (void)setIdValue:(int64_t)value_ {
	[self setId:@(value_)];
}

- (int64_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result longLongValue];
}

- (void)setPrimitiveIdValue:(int64_t)value_ {
	[self setPrimitiveId:@(value_)];
}

@dynamic mana;

- (int32_t)manaValue {
	NSNumber *result = [self mana];
	return [result intValue];
}

- (void)setManaValue:(int32_t)value_ {
	[self setMana:@(value_)];
}

- (int32_t)primitiveManaValue {
	NSNumber *result = [self primitiveMana];
	return [result intValue];
}

- (void)setPrimitiveManaValue:(int32_t)value_ {
	[self setPrimitiveMana:@(value_)];
}

@dynamic name;

@dynamic timestamp;

@end

