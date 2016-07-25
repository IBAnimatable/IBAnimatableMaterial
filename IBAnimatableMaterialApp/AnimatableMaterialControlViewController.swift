//
//  AnimatableMaterialControlViewController.swift
//  IBAnimatableMaterial
//
//  Created by George Kye on 2016-07-17.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import IBAnimatableMaterial
import IBAnimatable
import Material

class AnimatableMaterialControlViewController: UIViewController {
  
  @IBOutlet weak var controlView: AnimatableMaterialControlView!
  @IBOutlet weak var materialView: AnimatableMaterialView!
  
  
  override func viewDidLoad() {
    prepareControlView()
    prepareMaterialView()
  }
  
  //MARK: Create ControlView
  
  private func prepareControlView() {
   
    // Undo button.
    let undoButton: FlatButton = FlatButton()
    undoButton.pulseColor = MaterialColor.white
    undoButton.setTitle("UNDO", forState: .Normal)
    undoButton.setTitleColor(MaterialColor.teal.accent1, forState: .Normal)
    
    let label: UILabel = UILabel()
    label.text = "Message Deleted"
    label.textColor = MaterialColor.white
    
    controlView.contentView.addSubview(label)
    controlView.rightControls = [undoButton]
    controlView.contentInsetPreset = .WideRectangle3
    
    controlView.contentView.grid.views = [label]
  }
  
  //MARK: Crate MaterialView
  
  private func prepareMaterialView() {
    materialView.image = UIImage(named: "timeline-bg")
    materialView.shape = .Circle
    materialView.depth = .Depth2
  }
}