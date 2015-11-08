//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by ios－54 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanOthersModel.h"
//只要公用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可
//如果不会 可以参考汽车之家接口

typedef NS_ENUM(NSUInteger, TuWanDataType) {
    TuWanDataTypeDefault, //默认 头条
    TuWanDataTypeDuJia, //独家/八卦 mode
    TuWanDataTypeAnHei3, //暗黑3 dtid
    TuWanDataTypeMoShou, //魔兽
    TuWanDataTypeFengBao, //风暴
    TuWanDataTypeLuShi, //炉石
    TuWanDataTypeXingJi2, //星际2
    TuWanDataTypeShouWang, //守望者传说
    TuWanDataTypePicture, //图片 type
    TuWanDataTypeGuide, // 攻略
    TuWanDataTypeVideo, // 视频
    TuWanDataTypeHuanHua, // 幻化 mod
    TuWanDataTypeQuWen, // 趣闻
    TuWanDataTypeCOS, // COS
    TuWanDataTypeMeiNv // 美女
};

@interface TuWanNetManager : BaseNetManager

/**
 *  获取兔玩相关的信息
 *
 *  @param type             获取界面的类型，这是一个枚举值
 *  @param start            当前资讯起始索引值，最小为0。 eg 0,11,22,33,44...
 *  @param completionHandle 一个block，用于返回从服务器返回的数据
 *
 *  @return 返回当前请求的任务
 */
+ (id)getTuWanDataType:(TuWanDataType)type start:(NSInteger)start CompletionHandle:(void(^)(TuWanModel *model, NSError *error))completionHandle;

/**
 *  获取详情页的视频信息和图片信息
 *
 *  @param aid              视频或图片的唯一标识
 *  @param completionHandle 从服务器请求回来的数据
 *
 *  @return 返回当前请求的任务
 */
+ (id)getTuwanOthersDataOfAid:(NSString *)aid CompletionHandle:(void(^)(NSArray<TuWanOthersModel*> *model, NSError *error))completionHandle;

@end
