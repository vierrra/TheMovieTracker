//
//  DetailScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 30/09/24.
//

import UIKit

class DetailScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        
    }
    
    private func configConstraints() {
        
    }
    
}
