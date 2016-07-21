//
//  AnimatableMaterialImageCardViewController.swift
//  IBAnimatableMaterial
//
//  Created by George Kye on 2016-07-17.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import UIKit
import IBAnimatableMaterial
import IBAnimatable
import Material

class AnimatableMaterialImageCardViewController: UIViewController {
  
  @IBOutlet weak var imageCardView: AnimatableMaterialImageCardView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createImageCardView()
  }
  
  //MARK: Create AnimatableMaterialCardView
  
  private func createImageCardView() {
    imageCardView.divider = false
    imageCardView.maxImageHeight = 130
    imageCardView.image = UIImage(named: "walkthrough-bg")
    
    // Title label.
    let titleLabel: UILabel = UILabel()
    titleLabel.text = "Animatable Material ImageCardView"
    titleLabel.textColor = MaterialColor.white
    titleLabel.font = RobotoFont.regularWithSize(20)
    titleLabel.numberOfLines = 0
    imageCardView.titleLabel = titleLabel
    imageCardView.titleLabelInset.top = 90
    
    // Star button.
    let img1: UIImage? = MaterialIcon.cm.audio
    let btn1: IconButton = IconButton()
    btn1.pulseColor = MaterialColor.blueGrey.lighten1
    btn1.tintColor = MaterialColor.blueGrey.lighten1
    btn1.setImage(img1, forState: .Normal)
    btn1.setImage(img1, forState: .Highlighted)
    
    // Bell button.
    let img2: UIImage? = MaterialIcon.cm.bell
    let btn2: IconButton = IconButton()
    btn2.pulseColor = MaterialColor.blueGrey.lighten1
    btn2.tintColor = MaterialColor.blueGrey.lighten1
    btn2.setImage(img2, forState: .Normal)
    btn2.setImage(img2, forState: .Highlighted)
    
    // Share button.
    let img3: UIImage? = MaterialIcon.cm.share
    let btn3: IconButton = IconButton()
    btn3.pulseColor = MaterialColor.blueGrey.lighten1
    btn3.tintColor = MaterialColor.blueGrey.lighten1
    btn3.setImage(img3, forState: .Normal)
    btn3.setImage(img3, forState: .Highlighted)
    
    // Add buttons to right side.
    imageCardView.rightButtons = [btn1, btn2, btn3]
  }
  
  
}