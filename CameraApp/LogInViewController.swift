//
//  LogInViewController.swift
//  CameraApp
//
//  Created by
//

import UIKit
import CoreData

class LogInViewController: UIViewController {

    let welcomeLabel = UILabel(frame: CGRect(x: 20, y: 60, width: 400, height: 100))
    let imageLogo = UIImageView(frame: CGRect(x: 80, y: 150, width: 250, height: 250))
    let viewS = UIView(frame: CGRect(x: 30, y: 380, width: 350, height: 300))
    let name = UILabel(frame: CGRect(x: 50, y: 400, width: 300, height: 30))
    let nameText = UITextField(frame: CGRect(x: 50, y: 440, width: 300, height: 35))
    let password = UILabel(frame: CGRect(x: 50, y: 510, width: 300, height: 30))
    let passwordText = UITextField(frame: CGRect(x: 50, y: 550, width: 300, height: 35))
    let loginButton = UIButton(frame: CGRect(x: 85, y: 650, width: 250, height: 45))
    let signUpLabel = UILabel(frame: CGRect(x: 50, y: 780, width: 350, height: 35))
    let label = UILabel(frame: CGRect(x: 30, y: 700, width: 350, height: 35))

    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()

        //welcomeLabel
        welcomeLabel.setUpLabel("Welcome to Your Camera App", .white, 20, .bold, .center)
        view.addSubview(welcomeLabel)
        // imageLogo
        imageLogo.image = UIImage(named: "cam")
        view.addSubview(imageLogo)
        //viewS
        viewS.backgroundColor = #colorLiteral(red: 0.9399074912, green: 0.9400648475, blue: 0.9398867488, alpha: 1)
        viewS.layer.cornerRadius = 20
        view.addSubview(viewS)
        //name
        name.setUpLabel("Name :",#colorLiteral(red: 0.9399074912, green: 0.9400648475, blue: 0.9398867488, alpha: 1) , 20, .medium, .left)
        view.addSubview(name)
        //nameText
        nameText.placeholder = "Enter name"
        nameText.borderStyle = .roundedRect
        view.addSubview(nameText)
        //password
        password.setUpLabel("Password :", #colorLiteral(red: 0.9399074912, green: 0.9400648475, blue: 0.9398867488, alpha: 1), 20, .medium, .left)
        view.addSubview(password)
        //passwordText
        passwordText.placeholder = "Enter password"
        passwordText.borderStyle = .roundedRect
        passwordText.isSecureTextEntry = true
        view.addSubview(passwordText)
        //logInButton
        loginButton.setUpButton("Login", .black,#colorLiteral(red: 1, green: 0.792078197, blue: 0.6776204109, alpha: 1) , 20)
        loginButton.addTarget(self, action: #selector (login) , for: .touchDown)
        view.addSubview(loginButton)
        //signUpLabel
        signUpLabel.setUpLabel("you don't have an account? SignUp", .white, 20, .medium, .left)
        view.addSubview(signUpLabel)
        //label
        view.addSubview(label)
    }
                        
    @objc func login(){
        let nextVC = PictureViewController()
        nextVC.modalPresentationStyle = .fullScreen
        if nameText.text == "admin" && passwordText.text == "Ad123" {
            label.text = "Successfully logged"
            label.textAlignment = .center
            nextVC.userName.text = nameText.text! + "'s Photo"
            present(nextVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Not Successfully logged", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}


extension UILabel {
    func setUpLabel(_ titleOfText:String ,_ color:UIColor ,_ sizeOfText:CGFloat ,_ widthOfText:UIFont.Weight , _ textAlign:NSTextAlignment){
        text = titleOfText
        backgroundColor = color
        font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: sizeOfText , weight: widthOfText ))
        textAlignment = textAlign
    }
}

extension UIButton{
    func setUpButton(_ title:String ,_ titleColor:UIColor ,_ color:UIColor , _ cornerRad:CGFloat){
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = cornerRad
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
