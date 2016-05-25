//
//  NetWorkEngine.m
//  MusicDemo
//
//  Created by lly on 16/4/16.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "NetWorkEngine.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@implementation NetWorkEngine

+ (void)jsonDataWithUrl:(NSString *)url andPara:(NSDictionary *)parameter andSuccess:(void(^)(id obj))success andFail:(void(^)(id obj))fail andView:(UIView *)view{
    
    NSLog(@"++++++url = %@++++++",url);

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status <= 0) {
            MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:view animated:YES];
            mb.mode = MBProgressHUDModeText;
            mb.labelText = @"当前没有网络~~~";
            [mb hide:YES afterDelay:1];
        }
        else{
        
            MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:view animated:YES];
            mb.mode = MBProgressHUDModeIndeterminate;
            mb.labelText = @"拼命请求中~~~";
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (responseObject) {
                    [mb removeFromSuperview];
                    if (success) {
                        success(responseObject);
                    }
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [mb removeFromSuperview];
                if (fail) {
                    fail(error);
                }
            }];

        }
    }];
}
@end
