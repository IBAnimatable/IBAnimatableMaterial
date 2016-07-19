//
//  AnimatableMaterialErrorTextFieldViewController.swift
//  IBAnimatable-Material
//
//  Created by George Kye on 2016-07-18.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import UIKit
import Material

class AnimatableMaterialErrorTextFieldViewController: UIViewController, UITextFieldDelegate{
  
  @IBOutlet weak var emailField: AnimatableMaterialErrorTextField!
  @IBOutlet weak var textView: AnimatableMaterialTextView!
  
  override func viewDidLoad() {
    prepareEmailField()
  }
  
  private func prepareEmailField() {
    emailField.placeholder = "Email"
    emailField.detail = "Error, incorrect email"
    emailField.enableClearIconButton = true
    emailField.delegate = self
    
    emailField.placeholderColor = MaterialColor.amber.darken4
    emailField.placeholderActiveColor = MaterialColor.pink.base
    emailField.dividerColor = MaterialColor.cyan.base
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    (textField as? ErrorTextField)?.revealError = true
    return true
  }
  
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldDidBeginEditing(textField: UITextField) {
  }
  
  func textFieldShouldEndEditing(textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    (textField as? ErrorTextField)?.revealError = false
  }
  
  func textFieldShouldClear(textField: UITextField) -> Bool {
    (textField as? ErrorTextField)?.revealError = false
    emailField.pop()
    return true
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    (textField as? ErrorTextField)?.revealError = false
    return true
  }
}