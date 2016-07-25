//
//  AnimatableMaterialBarViews.swift
//  IBAnimatableMaterial
//
//  Created by George Kye on 2016-07-24.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import UIKit
import Material
import IBAnimatableMaterial


class AnimatableMaterialBarViews: UIViewController {
  
//  @IBOutlet var tabBar: AnimatableMaterialTabBar!
//  @IBOutlet weak var toolbar: AnimatableMaterialToolBar!
  private var containerView: UIView!
  private var toolbar: AnimatableMaterialToolBar!
  
  override func viewDidLoad() {
    prepareToolbar()
    prepTabBar()
  }
  
  func prepTabBar(){
    let tabBar: AnimatableMaterialTabBar = AnimatableMaterialTabBar(frame: CGRectMake(0, 100, view.bounds.width, 44))
    view.addSubview(tabBar)
    tabBar.backgroundColor = MaterialColor.purple.accent2
    let btn1: FlatButton = FlatButton()
    btn1.setTitle("Tab 1", forState: .Normal)
    btn1.setTitleColor(MaterialColor.white, forState: .Normal)
    
    let btn2: FlatButton = FlatButton()
    btn2.setTitle("Tab 2", forState: .Normal)
    btn2.setTitleColor(MaterialColor.white, forState: .Normal)
    tabBar.buttons = [btn1, btn2]
  }
  
  private func prepareToolbar() {
    containerView = UIView()
    view.layout(containerView).edges(top: 0, left: 0, right: 0)
    
    toolbar = AnimatableMaterialToolBar()
    containerView.addSubview(toolbar)
    
    toolbar.title = "IBAnimatableMaterial"
    toolbar.titleLabel.textColor = MaterialColor.white
    
    // Detail label.
    toolbar.detail = "Bring IBAnimatable and Material Design together."
    toolbar.detailLabel.textColor = MaterialColor.white
    
    var image: UIImage? = MaterialIcon.cm.menu
    
    // Menu button.
    let menuButton: IconButton = IconButton()
    menuButton.tintColor = MaterialColor.white
    menuButton.setImage(image, forState: .Normal)
    menuButton.setImage(image, forState: .Highlighted)
    
    // Switch control.
    let switchControl: MaterialSwitch = MaterialSwitch(state: .Off, style: .LightContent, size: .Small)
    
    // Search button.
    image = MaterialIcon.cm.search
    let searchButton: IconButton = IconButton()
    searchButton.tintColor = MaterialColor.white
    searchButton.setImage(image, forState: .Normal)
    searchButton.setImage(image, forState: .Highlighted)
    
    toolbar.backgroundColor = MaterialColor.blue.base
    toolbar.leftControls = [menuButton]
    toolbar.rightControls = [switchControl, searchButton]
  }

}