//
//  AnimatableMaterialCardViewController.swift
//  IBAnimatable-Material
//
//  Created by George Kye on 2016-07-13.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import UIKit
import IBAnimatableMaterial
import IBAnimatable
import Material

class AnimatableMaterialCardViewController: UIViewController {
  
  @IBOutlet weak var cardView: AnimatableMaterialCardView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareTopCardView()
  }

  
  /// Prepares the topCardView.
  func prepareTopCardView() {
    // Title label.
    let titleLabel: UILabel = UILabel()
    titleLabel.text = "Welcome Back!"
    titleLabel.textColor = MaterialColor.blue.darken1
    titleLabel.font = RobotoFont.mediumWithSize(20)
    cardView.titleLabel = titleLabel
    
    // Detail label.
    let detailLabel: UILabel = UILabel()
    detailLabel.text = "It’s been a while, have you read any new books lately?"
    detailLabel.numberOfLines = 0
    cardView.contentView = detailLabel
    
    // Yes button.
    let btn1: FlatButton = FlatButton()
    btn1.pulseColor = MaterialColor.blue.lighten1
    btn1.setTitle("YES", forState: .Normal)
    btn1.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
    
    // No button.
    let btn2: FlatButton = FlatButton()
    btn2.pulseColor = MaterialColor.blue.lighten1
    btn2.setTitle("NOPE", forState: .Normal)
    btn2.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
    
    // Add buttons to left side.
    cardView.leftButtons = [btn1, btn2]
  }
}