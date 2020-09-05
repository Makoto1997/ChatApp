//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by 田中誠 on 2020/08/21.
//  Copyright © 2020 田中誠. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Firebaseにユーザーを登録する。
    @IBAction func registerNewUser(_ sender: Any) {
        
        //アニメーションのスタート
        startAnimation()
        
        //新規登録
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil{
                
                print(error as Any)
            }else{
                
                print("ユーザーの作成が成功しました！")
                
                //アニメーションのストップ
                self.stopAnimation()
                
                //チャット画面に遷移させる
                self.performSegue(withIdentifier: "chat", sender: nil)
                
            }
        }
            
    }
        
        func startAnimation(){
            
            let animation = Animation.named("looding")
            animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/1.5)
            
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            
            view.addSubview(animationView)
        }
        
        func stopAnimation(){
            
            animationView.removeFromSuperview()
            
        }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
