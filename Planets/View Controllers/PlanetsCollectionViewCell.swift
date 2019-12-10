//
//  PlanetsCollectionViewCell.swift
//  Planets
//
//  Created by Patrick Millet on 12/9/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var internalView: UIView!
    
    var planet: Planet? {
           didSet {
               updateViews()
           }
       }
       
       func updateViews() {
           guard let planet = planet else { return }
           setUpViewConstraints()
           setUpLabelConstraints()
            setUpSubViewConstraints()
           planetNameLabel.text = planet.name
           planetImageView.image = planet.image
       }
    
    func setUpViewConstraints() {
        
        guard let planetView = planetImageView else { return }
        guard let superView = internalView else { return }
        
        planetView.contentMode = .scaleAspectFit
        
        let viewLeadingConstraint = NSLayoutConstraint(item: planetView, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: 8)
        
        let viewTopConstraint = NSLayoutConstraint(item: planetView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 8)
        
        let viewTrailingConstraint = NSLayoutConstraint(item: planetView, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 8)
        
        let viewHeight = NSLayoutConstraint(item: planetView, attribute: .height, relatedBy: .equal, toItem: planetView, attribute: .width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([viewLeadingConstraint, viewTopConstraint, viewTrailingConstraint, viewHeight])
    }
    
    func setUpLabelConstraints() {
        guard let imageLabel = planetNameLabel else { return }
        imageLabel.textAlignment = .center
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeadingConstraint = NSLayoutConstraint(item: imageLabel, attribute: .leading, relatedBy: .equal, toItem: internalView, attribute: .leading, multiplier: 1, constant: 20)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: imageLabel, attribute: .trailing, relatedBy: .equal, toItem: internalView, attribute: .trailing, multiplier: 1, constant: 0)
        
        let labelYConstraint = NSLayoutConstraint(item: imageLabel, attribute: .top, relatedBy: .equal, toItem: planetImageView, attribute: .bottom, multiplier: 1, constant: 8)
        
        NSLayoutConstraint.activate([labelYConstraint, labelLeadingConstraint, labelTrailingConstraint])
    }
    
    func setUpSubViewConstraints() {
        
        guard let subView = internalView else { return }
        guard let superView = mainCellView else { return }
        
        
        
        let topConstraint = NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 0)
        
        let leadingConstraint = NSLayoutConstraint(item: subView, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: 0)
        
        let trailingConstraint = NSLayoutConstraint(item: subView, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
}
