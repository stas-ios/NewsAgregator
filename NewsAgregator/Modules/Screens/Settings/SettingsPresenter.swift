//
//  SettingsPresenter.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class SettingsPresenter: BasePresenter<
    SettingsPresenterToViewProtocol,
    SettingsPresenterToInteractorProtocol,
    SettingsPresenterToRouterProtocol,
    SettingsOutputProtocol
>, SettingsPresenterProtocol {
    
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    
    //MARK: SettingsInputProtocol
    func didLoad() {
        view.display(navigationTitle: "Настройки")
    }
    
    func willAppear() {
        interactor.readSettings()
        .subscribe(
            onSuccess: { [weak self] settingsData in
                self?.present(settingsData)
        },
            onError: { [weak self] error in
                self?.present(error: error)
        }
        ).disposed(by: disposeBag)
    }
    
    //MARK: SettingsViewToPresenterProtocol
    
    //MARK: SettingsRouterToPresenterProtocol
    
    //MARK: TableViewToPresenterProtocol
    func didSelectCell(model: CellModelProtocol, indexPath: IndexPath) {
        switch model as! SettingsCells {
        case .keyValue(_, let tag):
            //обработка выбора ячеек в tableView делегируется координатору
            switch tag {
            case .categories:
                output?.didSelectCategoriesCellOnSettingsScreen()
                break
            case .updateTimeInterval:
                output?.didSelectTimeIntervalCellOnSettingsScreen()
                break
            }
        case .error(_):
            break
        }
    }
    
    //MARK: Private methods
    private func present(_ settingsData: SettingsData) {
        let categoriesValue = "\(settingsData.selectedCategoryCount) из \(settingsData.totalCategoryCount)"
        
        let cells: [SettingsCells] = [
            .keyValue(KeyValueCellData(key: "Категории",
                                       value: categoriesValue),
                      tag: .categories),
            .keyValue(KeyValueCellData(key: "Период обновления",
                                       value: settingsData.updateTimeInterval.textValue),
                      tag: .updateTimeInterval)
        ]
        
        let tableModel = TableModel(cells: cells)
        view.display(tableModel: tableModel,
                                 cellFactory: router)
    }
    
    private func present(error: Error) {
        let tableModel = TableModel(cells: [SettingsCells.error(error)])
        view.display(tableModel: tableModel,
                                 cellFactory: router)
    }
}
