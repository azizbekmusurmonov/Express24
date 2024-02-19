//
//  ProfilePresenter.swift
//  Express 24
//
//  Created by MacBook on 31/01/24.
//

import UIKit

protocol ProfileViewPresenterable: AnyObject {
    
    var vc: ProfileVC! { get set }
    
    func numberOfRowsInSection(for section: Int) -> Int
    func cellForRaw(_ tableView: UITableView, 
                    at indexPath: IndexPath) -> UITableViewCell
    func didSelectRow(at indexPath: IndexPath, navigationController: UINavigationController?)
}

final class ProfilePresenter: ProfileViewPresenterable {
        
    weak var vc: ProfileVC!
    
    func numberOfRowsInSection(for section: Int) -> Int {
        guard let sectionType = ProfileSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .information:
            return 2
        case .cartAdress:
            return 3
        case .setting:
            return 2
        case .reference:
            return 4
        case .deleteAcc:
            return 3
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
            
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Azizbek Musurmonov"
                cell.numberLabel.text = "+998883825004"
                cell.nextImageView.image = UIImage(named: "next")
            } else {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Bonus hisobi"
                
            }
            
            return cell
        case .cartAdress:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "cartAdressCell",
                for: indexPath
            ) as? CartAdressCell else {
                return UITableViewCell()
                
            }
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.titleHeaderLabel.text = "To'lov va manzillar"
            } else if indexPath.row == 1 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "To'lov kartalari"
                cell.nextImageView.image = UIImage(named: "next")
                cell.cardImageView.image = UIImage(named: "ic_payment_cards")
            } else {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Mening manzillarim"
                cell.nextImageView.image = UIImage(named: "next")
                cell.cardImageView.image = UIImage(named: "ic_location")
            }
            return cell
            
        case .setting:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "settingCell",
                for: indexPath
            ) as? SettingCell else {
                return UITableViewCell()
                
            }
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.titleHeaderLabel.text = "Sozlamalar"
            } else {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Til"
                cell.nextImageView.image = UIImage(named: "next")
                cell.languageImageView.image = UIImage(named: "ic_languages")
            }
            return cell
        case .reference:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "referenceCell",
                for: indexPath
            ) as? ReferenceCell else {
                return UITableViewCell()
                
            }
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.titleHeaderLabel.text = "Ma'lumot"
            } else if indexPath.row == 1 {
                
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Bildirishnomalar"
                cell.nextImageView.image = UIImage(named: "next")
                cell.titleImageView.image = UIImage(named: "ic_notification")
                
            } else if indexPath.row == 2 {
                
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Yordam xizmati"
                cell.nextImageView.image = UIImage(named: "next")
                cell.titleImageView.image = UIImage(named: "ic_support_service")
                
            } else {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Foydalanish shartlari"
                cell.nextImageView.image = UIImage(named: "next")
                cell.titleImageView.image = UIImage(named: "ic_user_agreement")
            }
                        
            return cell
        case .deleteAcc:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "deleteAccCell",
                for: indexPath
            ) as? DeleteAccCell else {
                return UITableViewCell()
                
            }
            
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Chiqish"
                cell.nextImageView.image = UIImage(named: "next")
                cell.titleImageView.image = UIImage(named: "ic_logout")
            } else if indexPath.row == 1 {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.nameLabel.text = "Akkountni o'chirish"
                cell.nextImageView.image = UIImage(named: "next")
                cell.titleImageView.image = UIImage(named: "ic_account_deletion")
            } else {
                cell.selectionStyle = .none
                cell.isUserInteractionEnabled = true
                cell.titleVersion.text = "Versiya 2.7.0"
            }
                        
            return cell
        }
    }
    
    func didSelectRow(at indexPath: IndexPath, navigationController: UINavigationController?) {
        guard let sectionType = ProfileSectionType(rawValue: indexPath.section
        ) else { return }
        switch sectionType {
            
        case .information:
            if indexPath.row == 0 {
                let informationVC = InformationVC()
                navigationController?.pushViewController(informationVC, animated: true)
            }
        case .cartAdress:
            if indexPath.row == 1 {
            let cardVC = CardVC()
                navigationController?.pushViewController(cardVC, animated: true)
            } else if indexPath.row == 2 {
                let myLocationVC = MyLocationVC()
                navigationController?.pushViewController(myLocationVC, animated: true)
            }
        case .setting:
            if indexPath.row == 1 {
                let alertVC = UIAlertController(
                    title: "Til",
                    message: "",
                    preferredStyle: .actionSheet)
                
                let rusAction = UIAlertAction(title: "Русский", style: .default) { UIAlertAction in
                    print("Русский")
                }
                
                let uzbekAction = UIAlertAction(title: "O’zbekcha", style: .default) { UIAlertAction in
                    print("O’zbekcha")
                }
                
                let englishAction = UIAlertAction(title: "English", style: .default) { UIAlertAction in
                    print("english")
                }
                
                let tasdiqlashAction = UIAlertAction(title: "Tasdiqlash", style: .cancel){ UIAlertAction in
                    print("Tasdiqlandi")
                }
                alertVC.addAction(rusAction)
                alertVC.addAction(uzbekAction)
                alertVC.addAction(englishAction)
                alertVC.addAction(tasdiqlashAction)
                self.vc.present(alertVC, animated: true)
            }
        case .reference:
            if indexPath.row == 1 {
                let notificationsVC = NotificationsVC()
                navigationController?.pushViewController(notificationsVC, animated: true)
            } else if indexPath.row == 2 {
                
                let alertVC = UIAlertController(
                    title: "Yordam xizmati",
                    message: "",
                    preferredStyle: .actionSheet)
                
                let sendMessageAction = UIAlertAction(title: "Xabar Yuborish", style: .default) { UIAlertAction in
                    print("Xabar yuborish")
                }
                
                let numberAction = UIAlertAction(title: "+998712004001", style: .default) { UIAlertAction in
                    print("998712004001")
                }
                
                alertVC.addAction(sendMessageAction)
                alertVC.addAction(numberAction)
                self.vc.present(alertVC, animated: true)
                
            } else if indexPath.row == 3 {
                let termsOfUseVC = TermsOfUseVC()
//                termsOfUseVC.modalPresentationStyle =
                vc.present(termsOfUseVC, animated: true)
            }
        case .deleteAcc:
            if indexPath.row == 0 {
                let alertVC = UIAlertController(
                    title: "",
                    message: "Tizimdan chiqasizmi?",
                    preferredStyle: .alert)
                
                let deleteAction = UIAlertAction(title: "Tasdiqlash", style: .destructive) { UIAlertAction in
                    print("Accountingiz o'chib ketdi")
                }
                
                let cancelAction = UIAlertAction(title: "Bekor qilish", style: .cancel) { UIAlertAction in
                    print("Amal bekor qilindi")
                }
                
                alertVC.addAction(deleteAction)
                alertVC.addAction(cancelAction)
                self.vc.present(alertVC, animated: true)
            } else if indexPath.row == 1 {
                let alertVC = UIAlertController(
                    title: "",
                    message: "O'chirish 30 kun davom etadi. Agar 30 kun ichida ushbu raqam bilan qayta ro'yxatdan o'tsangiz, u bekor qilinadi",
                    preferredStyle: .alert)
                
                let deleteAction = UIAlertAction(title: "O'chirish", style: .destructive) { UIAlertAction in
                    print("Accountingiz o'chib ketdi")
                }
                
                let cancelAction = UIAlertAction(title: "Bekor qilish", style: .cancel) { UIAlertAction in
                    print("Amal bekor qilindi")
                }
                
                alertVC.addAction(deleteAction)
                alertVC.addAction(cancelAction)
                self.vc.present(alertVC, animated: true)
            }
        }
    }

}
