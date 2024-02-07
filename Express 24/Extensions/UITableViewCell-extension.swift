//
//  UITableViewCell-extension.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 06/02/24.
//

import UIKit



extension UITableViewCell
{
    func makeRouned(view: UIView,
                    corners: UIRectCorner,
                    cornerRadius:Double)
    {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = view.bounds
        shapeLayer.path = maskPath.cgPath
        
        self.layer.mask = shapeLayer
    }
}


extension UITableView {
    func register(_ cell: AnyClass) {
        self.register(cell, forCellReuseIdentifier: String(describing: cell))
    }

    func dequeue(_ cell: AnyClass, indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath)
    }
    
    func dequeueCell<Cell: UITableViewCell>(_ cell: Cell.Type, indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return Cell() }
        return cell
    }

    func registerHeaderFooter(_ header: AnyClass) {
        self.register(header, forHeaderFooterViewReuseIdentifier: String(describing: header))
    }

    func dequeueHeaderFooter(_ header: AnyClass) -> UITableViewHeaderFooterView? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: header))
    }

    func showLastCellLoader(_ tableView: UITableView, _ indexPath: IndexPath, _ isEnableSendRequestServer: Bool) {
        if isEnableSendRequestServer {
            let lastSectionIndex = tableView.numberOfSections - 1
            let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
            if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
                
                let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 80))
                
//                let spinner = CustomActivityIndicatorView(style: .white)
//                spinner.center = view.center
//                view.addSubview(spinner)
                
                self.tableFooterView = view
                self.tableFooterView?.isHidden = false
            }
        }
        else {
            self.tableFooterView = nil
            self.tableFooterView?.isHidden = true
        }
    }
}
