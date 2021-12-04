//
//  PictureViewController.swift
//  CameraApp
//
//  Created by 
//

import UIKit
import CoreData

class PictureViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    

    let userName = UILabel(frame: CGRect(x: 20, y: 30, width: 400, height: 100))
    let viewImage = UIView(frame: CGRect(x: 30, y: 120, width: 350, height: 600))
    let imageView = UIImageView(frame: CGRect(x: 25, y: 40, width: 300, height: 450))
    let buttonCamera = UIButton (frame: CGRect(x: 90, y: 700, width: 250, height: 45))
//    let photoButton = UIButton (frame: CGRect(x: 120, y: 600, width: 75, height: 35))
//    let photoButton1 = UIButton (frame: CGRect(x: 230, y: 600, width: 75, height: 35))

    let cameraView = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cameraView.delegate = self
        //userName
        userName.setUpL(.white, 20, .medium, .center)
        view.addSubview(userName)
        //viewImage
        viewImage.backgroundColor = #colorLiteral(red: 0.9399074912, green: 0.9400648475, blue: 0.9398867488, alpha: 1)
        viewImage.layer.cornerRadius = 20
        view.addSubview(viewImage)
        //imageView
        imageView.image = UIImage(named: "NoImage")
        viewImage.addSubview(imageView)
        //buttonCamera
        buttonCamera.setUpB("Take a Picture!", .black, #colorLiteral(red: 1, green: 0.792078197, blue: 0.6776204109, alpha: 1), 20)
        buttonCamera.addTarget(self, action: #selector (cameraButtonPressed), for: .touchDown)
        view.addSubview(buttonCamera)
        //photoButton --------
//        photoButton.setUpB("Save", .black, #colorLiteral(red: 1, green: 0.792078197, blue: 0.6776204109, alpha: 1), 20)
//        photoButton.addTarget(self, action: #selector (savePhoto), for: .touchDown)
//        view.addSubview(photoButton)
//
//        photoButton1.setUpB("Show", .black, #colorLiteral(red: 1, green: 0.792078197, blue: 0.6776204109, alpha: 1), 20)
//        photoButton1.addTarget(self, action: #selector (showPhoto), for: .touchDown)
//        view.addSubview(photoButton1)
    }
    
    @objc func cameraButtonPressed() {
        cameraView.sourceType = .camera
        cameraView.modalPresentationStyle = .fullScreen
        present(cameraView, animated: true, completion: nil)
    }
    //save image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    //-----------
//    @objc func savePhoto() {
//        if let imageData = imageView.image?.pngData() {
//            DataBaseHelper.shareInstance.saveImage(data: imageData)
//        }
//    }
//    @objc func showPhoto() {
//        let nextVC = PictureViewController()
//        let arr = DataBaseHelper.shareInstance.fetchImage()
//        imageView.image = UIImage(data: arr[0].storedImage!)
//        present(nextVC, animated: true, completion: nil)
//    }
}

extension UILabel {
    func setUpL(_ color:UIColor ,_ sizeOfText:CGFloat ,_ widthOfText:UIFont.Weight , _ textAlign:NSTextAlignment){
        backgroundColor = color
        font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: sizeOfText , weight: widthOfText ))
        textAlignment = textAlign
    }
}

extension UIButton{
    func setUpB(_ title:String ,_ titleColor:UIColor ,_ color:UIColor , _ cornerRad:CGFloat){
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = cornerRad
    }
}
