//
//  LoadableImagePresenter.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class LoadableImagePresenter: BasePresenter<
    LoadableImagePresenterToViewProtocol,
    LoadableImagePresenterToInteractorProtocol,
    LoadableImagePresenterToRouterProtocol,
    LoadableImageOutputProtocol
>, LoadableImagePresenterProtocol {
    
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    
    private var imageRequest: Disposable?
    
    //MARK: LoadableImageInputProtocol
    func present(imageUrl: String?) {
        reset()
        guard let imageUrl = imageUrl else {
            return
        }
        view.display(loading: true)
        
        imageRequest = interactor.requestImage(url: imageUrl)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(
                onSuccess: { [weak self] image in
                    guard let `self` = self else { return }
                    self.didLoadImage(image)
                },
                onError: { [weak self] error in
                    guard let `self` = self else { return }
                    self.didFailLoadingImage(error)
                }
        )
        imageRequest?.disposed(by: disposeBag)
    }
    
    func reset() {
        imageRequest?.dispose()
        imageRequest = nil
        view.display(image: nil)
        view.display(loading: false)
    }
    
    //MARK: LoadableImageViewToPresenterProtocol
    
    //MARK: LoadableImageRouterToPresenterProtocol
    
    //MARK: Private methods
    private func didLoadImage(_ image: UIImage) {
        view.display(image: image)
        view.display(loading: false)
    }
    
    private func didFailLoadingImage(_ error: Error) {
        view.display(image: nil)
        view.display(loading: false)
    }
}
