//
//  BaseTableViewCell.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///Базовый класс View для модулей-ячеек. Отвечает за отображение данных, которые получает от презентера в готовом к отображению виде. Кроме того, передаёт события из жизненного цикла ячейки (prepareForReuse и добавленные в CellProtocol update(data:indexPath:), didSelect итд) презентеру.
open class BaseTableViewCell<ViewToPresenter>: UITableViewCell, ViewDependenciesProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
}
