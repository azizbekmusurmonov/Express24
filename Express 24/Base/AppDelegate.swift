//
//  AppDelegate.swift
//  Express 24
//
//  Created by MacBook on 15/01/24.
//

import UIKit

//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//    
//    private var isSelectTabBar = false
//    
//    //MARK: - TabBarItems
//    private let tabBarItemsData = [
//        TabBarItemData(image: self.isSelectTabBar ? "heart.fill" : "heart", title: "Bosh sahifa", type: HomeVC(presenter: HomePresenter())),
//        TabBarItemData(image: "search", title: "Izlash", type: SearchVC()),
//        TabBarItemData(image: "basket", title: "Savat", type: BasketVC()),
//        TabBarItemData(image: "order", title: "Buyurtmalar", type: OrdersVC()),
//        TabBarItemData(image: "person", title: "Profil", type: ProfileVC()),
//    ]
//
//    var window: UIWindow?
//    
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        //MARK: - TabBars
//       
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
//
//        return true
//    }
//}
//
////MARK: - Extensions
//extension AppDelegate {
//    
//    var tabBarController: UITabBarController {
//        
//        let tabBarVC = UITabBarController()
//        tabBarVC.selectedIndex = 0
//        tabBarVC.tabBar.backgroundColor = .white
//        tabBarVC.tabBar.tintColor = .black
//        
//        var tabBars: [UINavigationController] = []
//        
//        for item in tabBarItemsData {
//            let vc: UINavigationController = UINavigationController(rootViewController: item.type)
//            
//            vc.tabBarItem.title = item.title
//            vc.tabBarItem.image = UIImage(named: item.image)
//            
//            tabBars.append(vc)
//        }
//        tabBarVC.viewControllers = tabBars
//        
//        return tabBarVC
//    }
//}
//
////MARK: - tabbarcontrol
struct TabBarItemData {
    let image: String
    let title: String
    let type: UIViewController
}


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var isSelectTabBar = false
    private var tabBarItemsData: [TabBarItemData] = []

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        tabBarItemsData = [
            TabBarItemData(image: isSelectTabBar ? "ic_home_yellow" : "ic_home" ,
                           title: "Bosh sahifa", type: HomeVC(presenter: HomePresenter())),
            TabBarItemData(image: isSelectTabBar ? "ic_search_yellow" : "ic_new_search",
                           title: "Izlash", type: SearchVC()),
            TabBarItemData(image: isSelectTabBar ? "ic_busket_yellow" : "ic_busket", 
                           title: "Savat", type: BasketVC()),
            TabBarItemData(image: isSelectTabBar ? "ic_orders_yellow" : "ic_orders",
                           title: "Buyurtmalar", type: OrdersVC()),
            TabBarItemData(image: isSelectTabBar ? "ic_user_yellow" : "ic_user",
                           title: "Profil", type: ProfileVC())
        ]

        //MARK: - TabBars
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

    var tabBarController: UITabBarController {
        let tabBarVC = UITabBarController()
        tabBarVC.selectedIndex = 0
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.tintColor = .black

        var tabBars: [UINavigationController] = []

        for item in tabBarItemsData {
            let vc: UINavigationController = UINavigationController(rootViewController: item.type)

            vc.tabBarItem.title = item.title
            vc.tabBarItem.image = UIImage(named: item.image)

            tabBars.append(vc)
        }
        tabBarVC.viewControllers = tabBars

        return tabBarVC
    }
}
