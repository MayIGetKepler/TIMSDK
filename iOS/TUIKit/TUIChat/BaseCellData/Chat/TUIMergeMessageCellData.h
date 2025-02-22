//
//  TUIMergeMessageCellData.h
//  Pods
//
//  Created by harvy on 2020/12/9.
//  Copyright © 2023 Tencent. All rights reserved.
//

#import <TIMCommon/TIMDefine.h>
#import <TIMCommon/TUIBubbleMessageCellData.h>
#import <TIMCommon/TUIMessageCellData.h>
NS_ASSUME_NONNULL_BEGIN

@interface TUIMergeMessageCellData : TUIMessageCellData

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) NSArray<NSString *> *abstractList;
@property(nonatomic, strong) V2TIMMergerElem *mergerElem;
@property(nonatomic, assign) CGSize abstractSize;
- (NSAttributedString *)abstractAttributedString;

@end

NS_ASSUME_NONNULL_END
