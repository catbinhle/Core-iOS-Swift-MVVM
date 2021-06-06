//
//  ViewController.swift
//  VietTravelApp
//
//  Created by Cát Bình Lê on 06/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onListScreenAction(_ sender: Any) {
        let vc = ListViewController.make(with: ListViewModel(language: "RxSwift"))
        navigationController?.pushViewController(vc, animated: true)
    }

}

