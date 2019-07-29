//
//  UITableView+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 7/29/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

extension UITableView {
    
    private func adjustHeight(of view: UIView) {
        let targetSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        guard view.frame.size.height != targetSize.height else { return }
        
        view.frame.size.height = targetSize.height
        
        // iOS 9 only
        self.layoutIfNeeded()
    }
    
    public func adjustHeaderViewHeight() {
        guard let headerView = self.tableHeaderView else { return }
        
        adjustHeight(of: headerView)
    }
    
    public func adjustFooterViewHeight() {
        guard let footerView = self.tableFooterView else { return }
        
        adjustHeight(of: footerView)
    }
    
}
