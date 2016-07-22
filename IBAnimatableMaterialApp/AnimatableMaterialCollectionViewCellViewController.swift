//
//  AnimatableMaterialCollectionViewCellViewController.swift
//  IBAnimatableMaterial
//
//  Created by George Kye on 2016-07-19.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit
import Material
import IBAnimatableMaterial

class AnimatableMaterialCollectionViewCellViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  private lazy var menuView: AnimatableMaterialMenuView = AnimatableMaterialMenuView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareMenuViewExample()
  }
  
  /// Handle the menuView touch event.
  internal func handleMenu() {
    if menuView.menu.opened {
      menuView.menu.close()
      (menuView.menu.views?.first as? MaterialButton)?.animate(MaterialAnimation.rotate(rotation: 0))
    } else {
      menuView.menu.open() { (v: UIView) in
        if let v = v as? AnimatableMaterialFabButton{
          v.pulse()
        }
      }
      (menuView.menu.views?.first as? MaterialButton)?.animate(MaterialAnimation.rotate(rotation: 0.125))
    }
  }
  
  /// Handle the menuView touch event.
  @objc(handleButton:)
  internal func handleButton(button: AnimatableMaterialFabButton) {
    button.wobble()
    print("Menu Button was tapped")
  }
  
  
  /// Prepares the MenuView example.
  private func prepareMenuViewExample() {
    var image: UIImage? = MaterialIcon.cm.audio
    let btn1: AnimatableMaterialFabButton = AnimatableMaterialFabButton()
    btn1.setImage(image, forState: .Normal)
    btn1.addTarget(self, action: #selector(handleMenu), forControlEvents: .TouchUpInside)
    menuView.addSubview(btn1)
    
    image = MaterialIcon.image
    let btn2: AnimatableMaterialFabButton = AnimatableMaterialFabButton()
    btn2.setImage(image, forState: .Normal)
    btn2.addTarget(self, action: #selector(handleButton), forControlEvents: .TouchUpInside)
    menuView.addSubview(btn2)
    
    
    image = MaterialIcon.share
    let btn3: AnimatableMaterialFabButton = AnimatableMaterialFabButton()
    btn3.setImage(image, forState: .Normal)
    btn3.addTarget(self, action: #selector(handleButton), forControlEvents: .TouchUpInside)
    menuView.addSubview(btn3)
    
    // Initialize the menu and setup the configuration options.
    menuView.menu.direction = .Up
    menuView.menu.baseSize = CGSizeMake(56,56)
    menuView.menu.views = [btn1, btn2, btn3]
    
    view.layout(menuView).width(100).height(100).bottom(40).right()
    
    //FIX-ME: Animation not executed, view simply blinks
    menuView.delay = 0.5
    menuView.wobble()
  }
  
  
  
  // MARK: UICollectionViewDataSource
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AnimatableMaterialCollectionViewCell
    cell.startColor = UIColor.randomColor()
    cell.endColor = UIColor.randomColor()
    
    if indexPath.row % 3 == 0 {
      cell.slideInLeft()
    }else{
      cell.pop()
    }
    
    return cell
  }
  
  // MARK: UICollectionViewDelegateFlowLayout
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 200)
  }
  
  
}

//MARK: Generate random color
extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

extension UIColor {
  static func randomColor() -> UIColor {
    return UIColor(red:   .random(),
                   green: .random(),
                   blue:  .random(),
                   alpha: 1.0)
  }
}