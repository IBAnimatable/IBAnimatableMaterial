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
  
  override func viewDidLoad() {
    prepTabBar()
  }
  
  func prepTabBar(){
    let tabBar: TabBar = TabBar(frame: CGRectMake(0, 75, view.bounds.width, 44))
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

}