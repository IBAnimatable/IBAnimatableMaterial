//
//  AnimatableMaterialNavBar.swift
//  IBAnimatable-Material
//
//  Created by Damien Tsenkoff on 7/11/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import Material
import IBAnimatable

@IBDesignable
public class AnimatableMaterialNavBar: NavigationBar, NavigationBarDesignable {
    
    // MARK: - Animatable
    @IBInspectable public var solidColor: Bool = false
    
    // MARK: - Lifecycle
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configInspectableProperties()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configInspectableProperties()
    }
    
    // MARK: - Private
    private func configInspectableProperties() {
        configNavigationBar()
    }
    
}