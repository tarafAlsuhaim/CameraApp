//
//  ViewController.swift
//  CameraApp
//
//  Created by .
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView.image = UIImage(named: "cam")
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
        self.animate()
        })
    }

    func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let x =  size - self.view.frame.size.width
            let y = self.view.frame.size.height - size
            self.imageView.frame = CGRect(x: -(x/2), y: (y/2), width: size, height: size)
            })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        })
        
        let nextVC = LogInViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }


}

