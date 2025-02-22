//
//  PopUpViewController.swift
//  TUIRoomKit
//
//  Created by 唐佳宁 on 2023/1/12.
//  Copyright © 2023 Tencent. All rights reserved.
//

import Foundation
import TUICore

class PopUpView: UIView {
    let viewModel: PopUpViewModel
    var rootView: UIView?
    
    private let panelControl : UIControl = {
        let control = UIControl()
        control.backgroundColor = .clear
        return control
    }()
    
    init(viewModel: PopUpViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        constructViewHierarchy()
        activateConstraints()
        bindInteraction()
    }
    
    func constructViewHierarchy() {
        addSubview(panelControl)
        setupViewState()
        guard let rootView = rootView else { return }
        addSubview(rootView)
    }
    
    func activateConstraints() {
        panelControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        guard let orientationIsLandscape = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape as? Bool
        else { return }
        if orientationIsLandscape { //横屏
            if let height = viewModel.height {
                rootView?.snp.makeConstraints { make in
                    make.width.equalTo(UIScreen.main.bounds.size.height)
                    make.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    make.right.equalTo(safeAreaLayoutGuide.snp.right)
                }
            } else {
                rootView?.snp.makeConstraints { make in
                    make.width.equalTo(UIScreen.main.bounds.size.height)
                    make.top.equalToSuperview()
                    make.height.equalToSuperview()
                    make.right.equalTo(safeAreaLayoutGuide.snp.right)
                }
            }
        } else { //竖屏
            if let height = viewModel.height {
                rootView?.snp.makeConstraints { make in
                    make.width.bottom.equalToSuperview()
                    make.height.equalTo(height)
                }
            } else {
                rootView?.snp.makeConstraints { make in
                    make.width.height.equalToSuperview()
                }
            }
        }
    }
    
    func bindInteraction() {
        rootView?.backgroundColor = viewModel.backgroundColor
        panelControl.addTarget(self, action: #selector(panelControlAction), for: .touchUpInside)
    }
    
    func setupViewState() {
        switch viewModel.viewType {
        case .roomInfoViewType:
            let model = RoomInfoViewModel()
            rootView = RoomInfoView(viewModel: model)
        case .moreViewType:
            let model = MoreFunctionViewModel()
            rootView = MoreFunctionView(viewModel: model)
        case .setUpViewType:
            let model = SetUpViewModel()
            let view = SetUpView(viewModel: model)
            rootView = view
        case .userListViewType:
            let model = UserListViewModel()
            viewModel.viewResponder = model
            rootView = UserListView(viewModel: model)
        case .raiseHandApplicationListViewType:
            let model = RaiseHandApplicationListViewModel()
            viewModel.viewResponder = model
            rootView = RaiseHandApplicationListView(viewModel: model)
        case .transferMasterViewType:
            let model = TransferMasterViewModel()
            viewModel.viewResponder = model
            rootView = TransferMasterView(viewModel: model)
        case .QRCodeViewType:
            let model = QRCodeViewModel(urlString: "https://web.sdk.qcloud.com/component/tuiroom/index.html#/" + "#/room?roomId=" +
                                        EngineManager.createInstance().store.roomInfo.roomId)
            rootView = QRCodeView(viewModel: model)
        default: break
        }
    }
    
    //根据设备旋转方向更改弹出view
    func updateRootViewOrientation(isLandscape: Bool) {
        viewModel.updateOrientation(isLandscape: isLandscape)
        if isLandscape { //横屏
            if let height = viewModel.height {
                rootView?.snp.remakeConstraints{ make in
                    make.width.equalTo(UIScreen.main.bounds.size.width)
                    make.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    make.right.equalTo(safeAreaLayoutGuide.snp.right)
                }
            } else {
                rootView?.snp.remakeConstraints{ make in
                    make.width.equalTo(UIScreen.main.bounds.size.width)
                    make.top.equalToSuperview()
                    make.height.equalToSuperview()
                    make.right.equalTo(safeAreaLayoutGuide.snp.right)
                }
            }
        } else {
            if let height = viewModel.height {
                rootView?.snp.remakeConstraints { make in
                    make.width.bottom.equalToSuperview()
                    make.height.equalTo(height)
                }
            } else {
                rootView?.snp.remakeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
        }
    }
    
    @objc func panelControlAction() {
        viewModel.panelControlAction()
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
}
