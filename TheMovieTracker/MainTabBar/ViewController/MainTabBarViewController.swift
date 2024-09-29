//
//  MainTabBarViewController.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
       super.viewDidLoad()

       let tela01 = createNavController(viewController: HomeViewController(), title: "Home", imageName: "homekit")
       let tela02 = createNavController(viewController: SearchViewController(), title: "Busca", imageName: "magnifyingglass")
       let tela03 = createNavController(viewController: FavoritesViewController(), title: "Favoritos", imageName: "bookmark")

       viewControllers = [tela01, tela02, tela03]
       customizeTabBarAppearance()
     }

    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navigationItem.hidesBackButton = true
        return navController
     }

     private func customizeTabBarAppearance() {
        tabBar.tintColor = .systemBlue // cor dos itens fica black quando selecionado
        tabBar.unselectedItemTintColor = .lightGray // cor dos itens fica lightGray quando não está selecionado
         tabBar.backgroundColor = .backGroundTextField // cor de fundo
        tabBar.isTranslucent = false // serve para não deixar transparente o fundo quando trabalhamos com lista
        tabBar.layer.borderColor = UIColor.lightGray.cgColor // cor da borda
        tabBar.layer.borderWidth = 0.5 // espessura da borda
     }
}
