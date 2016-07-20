//
//  AnimatableMaterialIconButton.swift
//  IBAnimatable-Material
//
//  Created by George Kye on 2016-07-19.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import IBAnimatable
import Material


@IBDesignable
public class  AnimatableMaterialIconButton: IconButton, Animatable {
  // MARK: - Animatable
  @IBInspectable public var animationType: String?
  @IBInspectable public var autoRun: Bool = true
  @IBInspectable public var duration: Double = Double.NaN
  @IBInspectable public var delay: Double = Double.NaN
  @IBInspectable public var damping: CGFloat = CGFloat.NaN
  @IBInspectable public var velocity: CGFloat = CGFloat.NaN
  @IBInspectable public var force: CGFloat = CGFloat.NaN
  @IBInspectable public var repeatCount: Float = Float.NaN
  //  @IBInspectable public var x: CGFloat = CGFloat.NaN
  //  @IBInspectable public var y: CGFloat = CGFloat.NaN
  
  // MARK: - Lifecycle
  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    configAnimatableProperties()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    configAnimatableProperties()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    autoRunAnimation()
  }
}
