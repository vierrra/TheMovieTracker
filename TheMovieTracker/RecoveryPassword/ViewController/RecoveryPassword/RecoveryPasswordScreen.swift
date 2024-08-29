//
//  RecoveryPasswordScreen.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 29/08/24.
//

import UIKit

class RecoveryPasswordScreen: UIView {

    class ScreenView: UIView {
        
        init() {
            super.init(frame: .zero)
            backgroundColor = .white
            addElements()
            configConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        // MARK: Todos os elementos da tela, serao chamados aqui, para serem add na view
        func addElements() {
            
            
            
        }
        
        
        
        // MARK: Setando as contraints de cada elemento presente na screen
        func configConstraints () {
            NSLayoutConstraint.activate([
                
                
                
            ])
        }
        
        
    }
    

}
