//
//  ViewController.swift
//  TextInput-1
//
//  Created by Mobark Alseif on 20/03/1443 AH.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    
    let email:UITextField? = {
       let textFiled = UITextField()
        
        textFiled.placeholder = "Email Address"
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.borderStyle = .roundedRect
        textFiled.keyboardType = .emailAddress
        
        return textFiled
        
    }()
    
    let password:UITextField? = {
       let textFiled = UITextField()
        
        textFiled.placeholder = "Your Password"
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.borderStyle = .roundedRect
        textFiled.keyboardType = .emailAddress
        
        return textFiled
        
    }()
    
    let textView:UITextView? = {
       let textView = UITextView()
        textView.text = " If text can be selected, it can be marked. Marked text represents provisionally inserted text that has yet to be confirmed by the user.  It requires unique visual treatment in its display.  If there is any marked text, the selection, whether acaret or an extended range, always resides within. Setting marked text either replaces the existing marked text or, if none is present,inserts it from the current selection."
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .label
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.keyboardType = .emailAddress
        //textView.isEditable = false
        
        return textView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        view.addGestureRecognizer(tap)
        
        guard let email = email else { return }
        guard let password = password else { return }
        guard let textView = textView else { return }

        view.addSubview(email)
        view.addSubview(textView)

        textView.delegate = self
        email.delegate = self
        
        email.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        email.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        email.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -20).isActive = true
        
        view.addSubview(password)
        
        password.delegate = self
        password.topAnchor.constraint(equalTo: email.safeAreaLayoutGuide.bottomAnchor,constant: 12).isActive = true
        password.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        password.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -20).isActive = true
      
        
        textView.topAnchor.constraint(equalTo: password.safeAreaLayoutGuide.bottomAnchor,constant: 12).isActive = true
        
        textView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        textView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -20).isActive = true
        
        textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
    }
    fileprivate func alertEmail(_ email: String) {
        let alert = UIAlertController(title: "Title", message: email, preferredStyle: .actionSheet)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { ok in
            print("Okay")
        }
        let cuncel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alert.addAction(okAction)
        alert.addAction(cuncel)
        
        
        present(alert, animated: true)
    }
    
    @objc func dismissTap() {
        password?.resignFirstResponder()
        email?.resignFirstResponder()
        
        guard let email = email?.text else { return }
        alertEmail(email)
        
    }
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text ?? " ")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

