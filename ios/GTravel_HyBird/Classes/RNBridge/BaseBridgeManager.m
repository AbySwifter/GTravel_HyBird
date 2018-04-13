//
//  BaseBridgeManager.m
//  GTravel_HyBird
//
//  Created by aby on 2018/4/10.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(BaseBridge, NSObject)


/**
 实验方法

 @param NSString 实验参数
 @return 实验返回
 */
RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(changeTab:(BOOL)hidden)
/**
 处理多线程

 @return 返回在哪个线程里面执行方法
 */
-(dispatch_queue_t)methodQueue{
	return dispatch_get_main_queue();
}

@end
