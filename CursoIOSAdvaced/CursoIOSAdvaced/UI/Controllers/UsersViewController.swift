//
//  UsersViewController.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segment: UISegmentedControl!
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    
    
    
    // MARK: - Live Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

}

// MARK: - Extension TableView methods
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        

        
        return cell
    }
}


// MARK: - Extension CollectionView methods
extension UsersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? PersonCollectionViewCell else {
            return UICollectionViewCell()
        }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - cellSpacing) / 2
        return CGSize(width: size,
                      height: size)
    }
}


/**
 Tenemos varios sitios para guardar datos:
 - Flie: se guarda por defecto en la app pero puedes guardarlo donde quieras del móvil. En la app es algo más seguro
 - UserDefatult: Guarda pares clave - valor y se elimina al borrar la app. Aqui guardaremos datos de configuración de la app.
 - Keychain - es el lugar más seguro donde guardar datos, es del sistema. Guarda información segura del sistema, aún así es recomendable guardarlo encriptado. No se elimina cuando se elimina la app. Aqui guardaremos los datos privados del usuario y token de conexión con el servidor.
 - Coredata: BBDD en nuestra aplicación, integrado en XCode.
 - Databse externas: BBDD de terceros (Realm)
 */
