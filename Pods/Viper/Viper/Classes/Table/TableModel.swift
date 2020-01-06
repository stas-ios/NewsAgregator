//
//  TableModel.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Данные таблицы
public struct TableModel {
    public var sections: [SectionModel]
    
    public init(cells: [CellModelProtocol]) {
        sections = [SectionModel(header: nil, footer: nil, cells: cells)]
    }
    
    ///субскрипт для быстрого доступа к моделям ячеек по indexPath
    public subscript(indexPath: IndexPath) -> CellModelProtocol {
        get {
            return sections[indexPath.section].cells[indexPath.row]
        }
        set {
            sections[indexPath.section].cells[indexPath.row] = newValue
        }
    }
    
    public func existsCell(indexPath: IndexPath) -> Bool {
        return indexPath.section < sections.count && indexPath.row < sections[indexPath.section].cells.count
    }
}

public struct SectionModel {
    //TODO: header / footer
    public var header: CellModelProtocol?
    public var footer: CellModelProtocol?
    public var cells: [CellModelProtocol]
}

///Протокол модели ячейки. Ячейки могут быть чем угодно, в данном приложении это енумы, содержащие в том числе DomainData, но view к ним доступа не имеет, поэтому принципы VIPER не нарушаются.
public protocol CellModelProtocol {
    var identifier: String { get }
    var data: Any { get }
}
