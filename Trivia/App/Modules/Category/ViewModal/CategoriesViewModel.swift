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
    
    init(service: CategoryService){
        self.categoriesService = service
    }

    func getCategories(completion: @escaping() -> Void){
        categoriesService.getCategories { categories in
            self.categories = categories // Obtenemos las categorias del servicio
        } onError: {
            // TODO
        }
    }

    func getCategory(at index: Int) -> Category {
        categories[index]
    }
    
    func getCategoriesCount() -> Int {
        categories.count
    }

//    func getCategoryName(at index: Int) -> String {
//        getCategory(at: index).name
//    }
    
}
