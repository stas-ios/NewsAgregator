//
//  CategoryListInteractor.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class CategoryListInteractor: BaseInteractor, CategoryListInteractorProtocol {
    //MARK: Dependencies
    @Injected private var categoryDBService: CategoryDBServiceProtocol!
    
    //MARK: CategoryListPresenterToInteractorProtocol
    func readCategories() -> Single<[CategoryData]> {
        return categoryDBService.readCategories()
            .map { DBToDomainCategoryMapper.map($0) }
            .map { $0.sorted { $0.name < $1.name } }
    }
    
    func save(category: CategoryData) -> Single<Bool> {
        return categoryDBService.markSelected(name: category.name,
                                              isSelected: category.isSelected)
    }
    
}
