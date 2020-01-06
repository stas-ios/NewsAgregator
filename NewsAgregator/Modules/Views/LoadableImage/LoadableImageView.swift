//
//  LoadableImageView.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class LoadableImageView: BaseView<
    LoadableImageViewToPresenterProtocol
>, LoadableImageViewProtocol {
    
    //MARK: UI elements
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    //MARK: LoadableImagePresenterToViewProtocol
    func display(image: UIImage?) {
        imageView.image = image
    }
    
    func display(loading: Bool) {
        loader.isHidden = !loading
        loading ? loader.startAnimating() : loader.stopAnimating()
    }
    
    //MARK: LoadableImageRouterToViewProtocol
}
