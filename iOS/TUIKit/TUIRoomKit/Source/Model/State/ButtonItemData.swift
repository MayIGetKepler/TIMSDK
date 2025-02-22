//
//  ButtonItemData.swift
//  TUIRoomKit
//
//  Created by 唐佳宁 on 2023/1/10.
//  Copyright © 2023 Tencent. All rights reserved.
//

import Foundation

class ButtonItemData {
    enum ButtonType {
        case exitItemType
        case muteAudioItemType
        case muteVideoItemType
        case raiseHandItemType
        case leaveSeatItemType
        case chatItemType
        case memberItemType
        case moreItemType
        case inviteSeatItemType
        case changeHostItemType
        case muteMessageItemType
        case stepDownSeatItemType
        case kickOutItemType
        case normal
    }
    var buttonType: ButtonType = .normal
    var normalIcon: String = ""
    var selectedIcon: String = ""
    var disabledIcon: String = ""
    
    var normalTitle: String = ""
    var selectedTitle: String = ""
    
    var resourceBundle: Bundle = Bundle.main
    
    var action: ((Any)->Void)?
    
    var normalImage: UIImage? {
        return UIImage(named: normalIcon, in: resourceBundle, compatibleWith: nil)
    }
    
    var selectedImage: UIImage? {
        return UIImage(named: selectedIcon, in: resourceBundle, compatibleWith: nil)
    }
    
    var disabledImage: UIImage? {
        return UIImage(named: disabledIcon, in: resourceBundle, compatibleWith: nil)
    }
    
    var size: CGSize?
    var backgroundColor: UIColor?
    var isSelect: Bool = false
    var isEnabled: Bool = true
}
