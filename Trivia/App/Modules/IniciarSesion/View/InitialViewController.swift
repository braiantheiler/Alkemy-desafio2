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
    
    
    @IBAction func btnEmpezar(_ sender: Any) {
        if textField.hasText {
            let categoriesViewController = CategoriesViewController(nibName: "CategoriesViewController",bundle: nil)
            self.present(categoriesViewController, animated: true)
        }
        else {
            print("Por favor ingrese un nombre de usuario primero")
        }
    }

    private func presentTabBarController(){
        let tabBarController = TabBarViewController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }

}
