//
//  ViewController.swift
//  CollectionViewCrash
//
//  Created by Petryshena, Julia on 05/10/16.
//  Copyright © 2016 marktplaats. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var array:[Int] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        self.insert()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func insert () {
        array.append(1)
        let currentIndex = array.count - 1
        
        if currentIndex  > 0 {
            self.collectionView?.insertItems(at: [IndexPath(row:currentIndex, section:0)])
        } else {
            self.collectionView?.reloadData()
        }


        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.insert()
        }
    }
}
