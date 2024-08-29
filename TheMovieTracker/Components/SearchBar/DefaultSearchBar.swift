//
//  DefaultSearchBar.swift
//  SearchBarWithTableView
//
//  Created by Renato Vieira on 23/08/24.
//

import UIKit

class DefaultSearchBar: UISearchBar {
    
    // Closure que pode ser usada para passar eventos de texto modificado
    var onTextDidChange: ((String) -> Void)?
    
    // Closure para lidar com o clique no botão de cancelar
    var onCancelButtonClicked: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        self.placeholder = "Busca"
        self.barTintColor = .viewBackground
        self.searchTextField.backgroundColor = .searchTextFieldBackground
        self.searchTextField.layer.cornerRadius = 15
        self.searchTextField.clipsToBounds = true
        
        changedColorPlaceHolder()
        changedColorIcon()
        changedColorText()
    }
    
    private func changedColorPlaceHolder() {
        let placeHolderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.searchTextFieldComponents
        ]
        
        self.searchTextField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: placeHolderAttributes)
    }
    
    private func changedColorIcon() {
        if let glassIconView = self.searchTextField.leftView as? UIImageView {
            glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = .searchTextFieldComponents
        }
    }
    
    private func changedColorText() {
        self.searchTextField.textColor = .white
    }
    
    func customizeCancelButton() {
        if let cancelButton = self.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(.white, for: .normal)
        }
    }
    
    private func changedColorClearButton() {
        let clearButton = self.searchTextField.value(forKey: "_clearButton") as! UIButton
        clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        clearButton.tintColor = UIColor.white
    }
}

