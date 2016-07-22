//
//  AnimatableMaterialTableViewCell.swift
//  IBAnimatableMaterial
//
//  Created by Damien Tsenkoff on 7/11/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import Material
import IBAnimatable

@IBDesignable
public class AnimatableMaterialTableViewCell: MaterialTableViewCell, Animatable, FillDesignable, BorderDesignable, TableViewCellDesignable, GradientDesignable {
    
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
    @IBInspectable override public var borderColor: UIColor? {
        didSet {
            configBorder()
        }
    }
    
    @IBInspectable override public var borderWidth: CGFloat {
        didSet {
            configBorder()
        }
    }
    
    @IBInspectable public var borderSide: String? {
        didSet {
            configBorder()
        }
    }
    
    // MARK: - TableViewCellDesignable
    @IBInspectable public var removeSeparatorMargins: Bool = false
    
    // MARK: - GradientDesignable
    @IBInspectable public var startColor: UIColor?
    @IBInspectable public var endColor: UIColor?
    @IBInspectable public var predefinedGradient: String?
    @IBInspectable public var startPoint: String?
    
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
        configOpacity()
        configSeparatorMargins()
    }
    
    private func configAfterLayoutSubviews() {
        configBorder()
        configGradient()
    }
}