//
//  DetailViewController.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 30/09/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var screen: DetailScreen?
    
    override func loadView() {
        screen = DetailScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
