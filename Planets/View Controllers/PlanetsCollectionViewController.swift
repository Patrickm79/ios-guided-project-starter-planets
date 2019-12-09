//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Patrick Millet on 12/9/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit


class PlanetsCollectionViewController: UICollectionViewController {

    let planetController = PlanetController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetsCollectionViewCell else { return UICollectionViewCell() }
    
        let planet = planetController.planets[indexPath.row]
        cell.planet = planet
    
        return cell
    }
}
