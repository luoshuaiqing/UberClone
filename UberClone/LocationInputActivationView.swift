//
//  LocationInputActivationView.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/7/21.
//

import UIKit

class LocationInputActivationView: UIView {
    
    // MARK: - Properties
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
        
        addSubview(indicatorView)
        indicatorView.centerY(view: self, leadingAnchor: self.leadingAnchor, paddingLeft: 16)
        indicatorView.setDimensions(width: 6, height: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.centerY(view: self, leadingAnchor: indicatorView.trailingAnchor, paddingLeft: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
