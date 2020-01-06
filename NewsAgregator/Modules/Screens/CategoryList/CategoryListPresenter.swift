//
//  CategoryListPresenter.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class CategoryListPresenter: BasePresenter<
    CategoryListPresenterToViewProtocol,
    CategoryListPresenterToInteractorProtocol,
    CategoryListPresenterToRouterProtocol,
    CategoryListOutputProtocol
>, CategoryListPresenterProtocol {
    
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    
    //MARK: CategoryListInputProtocol
    
    //MARK: CategoryListViewToPresenterProtocol
    func didLoad() {
        view.display(navigationTitle: "Категории")
        
        interactor.readCategories()
            .subscribe(
                onSuccess: { [weak self] categories in
                    self?.present(categories)
                },
                onError: { [weak self] error in
                    self?.present(error: error)
            }).disposed(by: disposeBag)
    }
    
    //MARK: TableViewToPresenterProtocol
    func didSelectCell(model: CellModelProtocol, indexPath: IndexPath) {
        switch model as! CategoryListCells {
        case .checkmarkable(_, var category):
            //при нажатии на категорию ставим / снимаем галочку, обновляем в таблице и сохраняем новое значение в базу данных
            category.isSelected = !category.isSelected
            
            let newCellModel = createCellModel(category: category)
            view.refresh(cellModel: newCellModel, indexPath: indexPath, animated: false)
            saveCategoryToDB(category: category)
            break
        default:
            return
        }
    }
    
    //MARK: CategoryListRouterToPresenterProtocol
    
    //MARK: Private methods
    private func saveCategoryToDB(category: CategoryData) {
        interactor.save(category: category)
            .subscribe(
                onError: { [weak self] error in
                    self?.present(error: error)
            }).disposed(by: disposeBag)
    }
    
    private func present(_ categories: [CategoryData]) {
        let cells: [CategoryListCells] = categories
            .map({ createCellModel(category: $0) })
        
        let tableModel = TableModel(cells: cells)
        view.display(tableModel: tableModel, cellFactory: router)
    }
    
    private func present(error: Error) {
        let tableModel = TableModel(cells: [CategoryListCells.error(error)])
        view.display(tableModel: tableModel, cellFactory: router)
    }
    
    private func createCellModel(category: CategoryData) -> CategoryListCells {
        let categoryName = (category.name.count > 0) ? category.name : "Без категории"
        return .checkmarkable(CheckmarkableCellData(value: categoryName,
                                                    isSelected: category.isSelected),
                              category: category)
    }
}
