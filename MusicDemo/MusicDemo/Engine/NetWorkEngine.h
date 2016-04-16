//
//  NetWorkEngine.h
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkEngine : NSObject


/**
 *  请求json数据
 *
 *  @param url       请求地址
 *  @param parameter 参数
 *  @param success   请求成功的block
 *  @param fail      请求失败的block
 *  @prram view      当前请求数据的页面
 */
+ (void)jsonDataWithUrl:(NSString *)url andPara:(NSDictionary *)parameter andSuccess:(void(^)(id obj))success andFail:(void(^)(id obj))fail andView:(UIView *)view;
@end
