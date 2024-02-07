//
//  ProfilePresenter.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

protocol ProfileViewPresenterable: AnyObject {
    func numberOfRowsInSection(for section: Int) -> Int
    func cellForRaw(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

final class ProfilePresenter: ProfileViewPresenterable {
    func numberOfRowsInSection(for section: Int) -> Int {
        guard let sectionType = ProfileSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .information:
            return 1
        case .cartAdress:
            return 2
        case .setting:
            return 1
        case .reference:
            return 3
        case .deleteAcc:
            return 2
        }
    }
    
    func cellForRaw(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = ProfileSectionType(rawValue: indexPath.section) else { return UITableViewCell()}
        switch sectionType {
            
        case .information:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "informationCell",
                for: indexPath
            ) as? InformationCell else {
                return UITableViewCell()
                
            }
                        
            return cell
        case .cartAdress:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "cartAdressCell",
                for: indexPath
            ) as? CartAdressCell else {
                return UITableViewCell()
                
            }
            
            cell.backgroundColor = .orange
                        
            return cell
        case .setting:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "settingCell",
                for: indexPath
            ) as? SettingCell else {
                return UITableViewCell()
                
            }
                        
            return cell
        case .reference:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "referenceCell",
                for: indexPath
            ) as? ReferenceCell else {
                return UITableViewCell()
                
            }
                        
            return cell
        case .deleteAcc:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "deleteAccCell",
                for: indexPath
            ) as? DeleteAccCell else {
                return UITableViewCell()
                
            }
                        
            return cell
        }
    }
}
