//
//  CategoriesViewModel.swift
//  Trivia
//
//  Created by Braian Theiler on 22/02/2022.
//

import Foundation

class CategoriesViewModel {
    
    private let categoriesService: CategoryService
    private var categories = [Category]()
    private var delegate: CategoryListDelegate
    
    init(service: CategoryService, delegate: CategoryListDelegate){
        self.categoriesService = service
        self.delegate = delegate
    }

    func getCategories(){
        categoriesService.getCategories { categories in
            self.categories = categories // Obtenemos las categorias del servicio
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }
    }

    func getCategory(at index: Int) -> Category {
        categories[index]
    }
    
    func getCategoriesCount() -> Int {
        return categories.count
    }

//    func getCategoryName(at index: Int) -> String {
//        getCategory(at: index).name
//    }
    
}
