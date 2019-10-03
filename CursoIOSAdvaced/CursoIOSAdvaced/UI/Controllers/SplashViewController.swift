//
//  SplashViewController.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 02/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Cargado Splash")
        // Do any additional setup after loading the view.
        
        //Gestionamos los hilos, el main de la app hara lo que pongamos en el código dentro de la función.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //Vamos a obtener el storyboard al que queremos navegar
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //Vamos a obtener el viewController a traves del storyboard
            //Si queremos conseguir un viewcontroller podemos hacerlo por el identifier que le ponemos en el storyboard
            //let viewControllerDestination = storyboard.instantiateViewController(identifier: String)
            //Como en este caso solo hay un viewController nos basta con pedir el inicial
            guard let viewControllerDestination = storyboard.instantiateInitialViewController() else {
                return
            }
            self.present(viewControllerDestination, animated: true)
        }
    }
    

}

