//
//  UITableView+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 7/29/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

// MARK: - Header and Footer Configuration

extension UITableView {
    
    private func adjustHeight(of view: UIView) {
        let targetSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        guard view.frame.size.height != targetSize.height else { return }
        
        view.frame.size.height = targetSize.height
        
        // iOS 9 only
        self.layoutIfNeeded()
    }
    
    /// Automatically adjusts height of the header view to fit the content.
    public func adjustHeaderViewHeight() {
        guard let headerView = self.tableHeaderView else { return }
        
        adjustHeight(of: headerView)
    }
    
    /// Automatically adjusts height of the footer view to fit the content.
    public func adjustFooterViewHeight() {
        guard let footerView = self.tableFooterView else { return }
        
        adjustHeight(of: footerView)
    }
    
}
