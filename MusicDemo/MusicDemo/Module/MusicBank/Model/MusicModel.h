//
//  MusicModel.h
//  MusicDemo
//
//  Created by lly on 16/4/18.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

@property (nonatomic, strong) NSNumber *singerId;
@property (nonatomic, strong) NSNumber *songId;
@property (nonatomic, copy) NSString *singerName;
@property (nonatomic, copy) NSString *albumName;//专辑名字
@property (nonatomic, strong) NSNumber *albumId;//专辑id
//@property (nonatomic, assign) NSInteger pick_count;
@property (nonatomic, copy) NSString *picUrl;  //存储歌曲图片
@property (nonatomic, copy) NSString *favorites;//喜欢
@property (nonatomic, copy) NSString *name;

//url_list数组中是字典集合
//"url_list": [
//             {
//                 "duration": "03:23",
//                 "format": "m4a",
//                 "bitrate": 32,
//                 "type_description": "压缩品质",
//                 "url": "b.ali.hotchanson.com/8065807e782a5c4f/1437132686/m4a_32_11/fd/65/fdffb1fcc5153e64f0f1c88be9163e65.m4a?s=t",
//                 "size": "0.81M",
//                 "type": 1
//             },
//             {
//                 "duration": "03:23",
//                 "format": "mp3",
//                 "bitrate": 128,
//                 "type_description": "标准品质",
//                 "url": "nie.dfe.yymommy.com/8065807e782a5c4f/1437132686/mp3_128_11/fd/65/fdffb1fcc5153e64f0f1c88be9163e65.mp3?s=t",
//                 "size": "3.10M",
//                 "type": 2
//             },
//             {
//                 "duration": "03:23",
//                 "format": "mp3",
//                 "bitrate": 320,
//                 "type_description": "超高品质",
//                 "url": "ttp://b.ali.hotchanson.com/d1cf3f2cde236f67/1437132686/mp3_190_11/4f/4e/4f8400842de2d3a40d7c27e0b4d0f94e.mp3?s=t",
//                 "size": "7.76M",
//                 "type": 3
//             }
//             ],
@property (nonatomic, strong) NSMutableArray *urlList;

//排行数据中得简介
@property (nonatomic, copy) NSString *alias;

@end
