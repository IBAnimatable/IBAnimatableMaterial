//
//  AnimatableMaterialPulseView.swift
//  IBAnimatable-Material
//
//  Created by George Kye on 2016-07-19.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import IBAnimatable
import Material

@IBDesignable
public class AnimatableMaterialPulseView: MaterialPulseView, FillDesignable, BorderDesignable, RotationDesignable, BlurDesignable, TintDesignable, GradientDesignable, MaskDesignable, Animatable {
  
  // MARK: - FillDesignable
  @IBInspectable public var fillColor: UIColor? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var predefinedColor: String? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var opacity: CGFloat = CGFloat.NaN {
    didSet {
      configOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable public var borderSide: String? {
    didSet {
      configBorder()
    }
  }
  
  // MARK: - RotationDesignable
  @IBInspectable public var rotate: CGFloat = CGFloat.NaN {
    didSet {
      configRotate()
    }
  }
  
  
  // MARK: - BlurDesignable
  @IBInspectable public var blurEffectStyle: String? {
    didSet {
      configBlurEffectStyle()
    }
  }
  @IBInspectable public var vibrancyEffectStyle: String? {
    didSet {
      configBlurEffectStyle()
    }
  }
  @IBInspectable public var blurOpacity: CGFloat = CGFloat.NaN {
    didSet {
      configBlurEffectStyle()
    }
  }
  
  // MARK: - TintDesignable
  @IBInspectable public var tintOpacity: CGFloat = CGFloat.NaN
  @IBInspectable public var shadeOpacity: CGFloat = CGFloat.NaN
  @IBInspectable public var toneColor: UIColor?
  @IBInspectable public var toneOpacity: CGFloat = CGFloat.NaN
  
  // MARK: - GradientDesignable
  @IBInspectable public var startColor: UIColor?
  @IBInspectable public var endColor: UIColor?
  @IBInspectable public var predefinedGradient: String?
  @IBInspectable public var startPoint: String?
  
  // MARK: - MaskDesignable
  @IBInspectable public var maskType: String? {
    didSet {
      configMask()
      configBorder()
    }
  }
  
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
    configInspectableProperties()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    configInspectableProperties()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    configAfterLayoutSubviews()
    autoRunAnimation()
  }
  
  // MARK: - Private
  private func configInspectableProperties() {
    configAnimatableProperties()
    configTintedColor()
  }
  
  private func configAfterLayoutSubviews() {
    configMask()
    configBorder()
    configGradient()
  }
}
