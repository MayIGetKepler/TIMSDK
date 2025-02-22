//
//  TUIReplyPreviewData.m
//  TUIChat
//
//  Created by wyl on 2022/3/22.
//  Copyright © 2023 Tencent. All rights reserved.
//

#import "TUIReplyPreviewData.h"
#import <TIMCommon/TIMDefine.h>

@implementation TUIReplyPreviewData

+ (NSString *)displayAbstract:(NSInteger)type abstract:(NSString *)abstract withFileName:(BOOL)withFilename {
    NSString *text = abstract;
    if (type == V2TIM_ELEM_TYPE_IMAGE) {
        text = TIMCommonLocalizableString(TUIkitMessageTypeImage);
    } else if (type == V2TIM_ELEM_TYPE_VIDEO) {
        text = TIMCommonLocalizableString(TUIkitMessageTypeVideo);
    } else if (type == V2TIM_ELEM_TYPE_SOUND) {
        text = TIMCommonLocalizableString(TUIKitMessageTypeVoice);
    } else if (type == V2TIM_ELEM_TYPE_FACE) {
        text = TIMCommonLocalizableString(TUIKitMessageTypeAnimateEmoji);
    } else if (type == V2TIM_ELEM_TYPE_FILE) {
        if (withFilename) {
            text = [NSString stringWithFormat:@"%@%@", TIMCommonLocalizableString(TUIkitMessageTypeFile), abstract];
            ;
        } else {
            text = TIMCommonLocalizableString(TUIkitMessageTypeFile);
        }
    }
    return text;
}

@end

@implementation TUIReferencePreviewData

@end
