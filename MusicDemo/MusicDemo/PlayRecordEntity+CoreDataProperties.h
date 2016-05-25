//
//  PlayRecordEntity+CoreDataProperties.h
//  MusicDemo
//
//  Created by lly on 16/5/9.
//  Copyright © 2016年 lly. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PlayRecordEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayRecordEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *autoID;
@property (nullable, nonatomic, retain) NSString *songFrom;
@property (nullable, nonatomic, retain) NSString *songID;
@property (nullable, nonatomic, retain) NSString *songImage;
@property (nullable, nonatomic, retain) NSString *songName;
@property (nullable, nonatomic, retain) NSString *songPlayCount;
@property (nullable, nonatomic, retain) NSString *songSinger;
@property (nullable, nonatomic, retain) NSString *songUrl;

@end

NS_ASSUME_NONNULL_END
