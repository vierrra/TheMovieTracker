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
        
        screen?.delegate(delegate: self)
        showAboutSection()
    }
    
    private func showAboutSection() {
        screen?.descriptionLabel.text = "Da DC Comics surge o Esquadrão Suicida, uma equipe de anti-heróis de supervilões encarcerados que atuam como ativos negáveis ​​para o governo dos Estados Unidos, realizando missões de operações secretas de alto risco em troca de sentenças de prisão comutadas."
    }
    
    private func showReviewsSection() {
        screen?.descriptionLabel.text = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX."
    }
    
    private func showCastSection() {
        screen?.descriptionLabel.text = "Huguinho,\n Luizinho,\n Zezinho."
    }
}

extension DetailViewController: DetailScreenProtocol {
    func dismiss() {
        dismiss(animated: true)
    }
    
    func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            showAboutSection()
        case 1:
            showReviewsSection()
        case 2:
            showCastSection()
        default:
            break
        }
    }
}
