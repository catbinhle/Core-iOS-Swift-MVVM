//
//  DetailViewController.swift
//  VietTravelApp
//
//  Created by Cát Bình Lê on 06/06/2021.
//

import UIKit
import RxCocoa
import RxSwift
import WebKit
import RxWebKit

final class DetailViewController: UIViewController {

    static func make(with viewModel: DetailViewModel) -> DetailViewController {
        let view = DetailViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    private var viewModel: DetailViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.outputs.navigationBarTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        webView.rx.loading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)

        webView.load(viewModel.outputs.request)
    }
}

extension DetailViewController: StoryboardInstantiable {}
