//
//  AnimatableMaterialTextFieldViewController.swift
//  IBAnimatableMaterial
//
//  Created by Damien Tsenkoff on 7/11/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit
import IBAnimatableMaterial

/**
 This view controller class is internal and only for the demo/example application. It shows a `AnimatableMaterialTextField` in action.
 */

internal class AnimatableMaterialTextFieldViewController: UIViewController {
  
  @IBOutlet weak var constraintBottomButton: NSLayoutConstraint!
  @IBOutlet weak var constraintMiddleTextfield: NSLayoutConstraint!
  @IBOutlet weak var textField: AnimatableMaterialTextField!
  
  @IBAction func buttonDidTouched(sender: AnyObject) {
    // Setup the animation
    textField.animationType = "Shake"
    textField.force = 0.2
    textField.duration = 0.5
    textField.damping = 0.5
    textField.velocity = 2
    textField.animate()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addNotifications()
  }
  
  
  override func viewDidAppear(animated: Bool) {
    textField.becomeFirstResponder()
  }
  
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillChangeFrameNotification, object: nil)
  }
  
}



extension AnimatableMaterialTextFieldViewController {
  
  // Dismiss the keyboard when return key is pressed.
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  // Dismiss the keyboard when touched outside.
  func tap(notification: NSNotification) {
    textField.resignFirstResponder()
  }
  
  
  // Add the two notification observer for this view: One for the Keyboard Toggle, and one for the touch away.
  func addNotifications() {
    
    let tapGesture = UITapGestureRecognizer(
      target: self,
      action: #selector(AnimatableMaterialTextFieldViewController.tap(_:)))
    view.addGestureRecognizer(tapGesture)
    
    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: #selector(AnimatableMaterialTextFieldViewController.updateBottomLayoutConstraintWithNotification(_:)),
      name: UIKeyboardWillChangeFrameNotification, object: nil
    )
  }
  
  
  // Update the view when keyboard change frame.
  func updateBottomLayoutConstraintWithNotification(notification: NSNotification) {
    
    let userInfo = notification.userInfo!
    let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
    let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
    let convertedKeyboardEndFrame = view.convertRect(keyboardEndFrame, fromView: view.window)
    let rawAnimationCurve = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).unsignedIntValue << 16
    let animationCurve = UIViewAnimationOptions(rawValue: UInt(rawAnimationCurve))
    
    constraintBottomButton.constant = ((CGRectGetMaxY(view.bounds) - CGRectGetMinY(convertedKeyboardEndFrame)) + 10)
    constraintMiddleTextfield.constant = -((CGRectGetMaxY(view.bounds) - CGRectGetMinY(convertedKeyboardEndFrame))/2)
    
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: [.BeginFromCurrentState, animationCurve], animations: {
      self.view.layoutIfNeeded()
      }, completion: nil)
  }
  
}