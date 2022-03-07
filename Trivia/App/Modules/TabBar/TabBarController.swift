//
//  TabBarController.swift
//  Trivia
//
//  Created by Braian Theiler on 07/03/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }

    func setupViewControllers(){

        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        let secondTabTitle = "Random"
        let secondTabImage = UIImage(systemName: "shuffle")

        // Categorías
        let firstTabViewController = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTabViewController.title = firstTabTitle

        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for:.selected)
        UITabBar.appearance().tintColor = UIColor.blue

        // Random
        let secondTabViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            secondTabViewController.title = secondTabTitle

        let secondTabNavigationController = UINavigationController(rootViewController: secondTabViewController)
            secondTabNavigationController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)


        viewControllers = [firstTabNavigationController, secondTabNavigationController]
//        viewControllers?.append(firstTabNavigationController)
        }
    }
