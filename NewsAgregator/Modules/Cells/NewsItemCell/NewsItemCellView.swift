//
//  NewsItemCellView.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsItemCellView: BaseTableViewCell<
    NewsItemCellViewToPresenterProtocol
>, NewsItemCellViewProtocol {
    
    //MARK: UI elements
    @IBOutlet private weak var imageContainer: UIView!
    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var detailContainer: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var arrow: UIImageView!
    
    //MARK: UITableViewCell lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        presenter.prepareForReuse()
    }
    
    //MARK: CellProtocol
    func update(data: Any, indexPath: IndexPath) {
        presenter.present(data, indexPath: indexPath)
    }
    
    //MARK: NewsItemCellPresenterToViewProtocol
    func display(title: String) {
        titleLabel.text = title
    }
    
    func display(source: String) {
        sourceLabel.text = source
    }
    
    func display(date: String) {
        dateLabel.text = date
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
    
    func display(fullMode: Bool) {
        detailContainer.isHidden = !fullMode
        arrow.transform = fullMode ? CGAffineTransform.init(scaleX: 1.0, y: -1.0) : CGAffineTransform.identity
    }
    
    func display(hasRead: Bool) {
        titleLabel.textColor = hasRead ? UIColor.gray : UIColor.black
    }
    
    //MARK: NewsItemCellRouterToViewProtocol
    func addLoadableImage(_ view: UIView) {
        imageContainer.addContentSubview(view)
    }
}
