//
//  InitialViewController.swift
//  Trivia
//
//  Created by Braian Theiler on 18/02/2022.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var btnEmpezar: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "Braian"
        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func btnEmpezar(_ sender: Any) {
//        if textField.hasText {
//            let categoriesViewController = CategoriesViewController(nibName: "CategoriesViewController",bundle: nil)
//            self.present(categoriesViewController, animated: true)
//        }
//        else {
//            print("Por favor ingrese un nombre de usuario primero")
//        }
//    }
    
    @IBAction func btnEmpezar(_ sender: Any) {
        if textField.hasText {
            let tabBarController = TabBarController()
            tabBarController.modalPresentationStyle = .overFullScreen
//            self.present(tabBarController, animated: true)
            self.navigationController?.pushViewController(tabBarController, animated: true)
            
        }
        else {
            let message = "Por favor ingrese un nombre para acceder!"
            
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    private func presentTabBarController(){
        let tabBarController = TabBarViewController()
//        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }

}
