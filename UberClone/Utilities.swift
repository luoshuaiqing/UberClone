//
//  Utilities.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/20/20.
//

import UIKit

class Utilities {
    
    func inputContainerView(
        withImage image: UIImage,
        textField: UITextField? = nil,
        segmentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        if let textField = textField {
            imageView.centerY(view: view)
            imageView.anchor(leading: view.leadingAnchor, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(textField)
            textField.centerY(view: view)
            textField.anchor(leading: imageView.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingLeft: 8, paddingBottom: 8)
        }
        
        if let sc = segmentedControl {
            imageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, paddingTop: -8, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(sc)
            sc.anchor(leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingLeft: 8, paddingRight: 8)
            sc.centerY(view: view, constant: 8)
        }

        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool = false) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
    
    
}
