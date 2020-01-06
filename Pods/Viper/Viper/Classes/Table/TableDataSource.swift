//
//  ViperTableDataSource.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///TableDataSource позволяет добавлять в таблицу как простые ячейки, так и ячейки, являющиеся Viper-модулями
internal class TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    ///Данные таблицы
    internal var model: TableModel
    
    ///Фабрика для создания новых ячеек (роутер). Вообще view не должно обращаться к роутеру, но если ячейки-модули  создаются только там, то приходится, и cellFactory помогает избежать явной зависимости
    private let cellFactory: CellFactoryProtocol
    
    ///Ссылка на presenter для отправки события didSelectCell
    private weak var presenter: TableViewToPresenterProtocol?
    
    init(model: TableModel,
         cellFactory: CellFactoryProtocol,
         presenter: TableViewToPresenterProtocol?) {
        self.model = model
        self.cellFactory = cellFactory
        self.presenter = presenter
    }
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = model.sections[section]
        return section.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = model.sections[indexPath.section]
        let cellModel = section.cells[indexPath.row]
        
        //Через фабрику создаются только новые ячейки, реюз остаётся в силе.
        //Для ячеек-модулей реюзается не только view, но весь модуль целиком,
        //поэтому надо правильно обрабатывать prepareForReuse
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) ?? cellFactory.buildCell(model: cellModel)) as! CellProtocol
        
        //Передача ячейке новых данных при реюзе или сразу после создания
        cell.update(data: cellModel.data, indexPath: indexPath)
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectCell(model: model[indexPath], indexPath: indexPath)
    }
}
