//
//  NibLoadable.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import UIKit

// MARK: Protocol Definition
/// Make your UIView subclasses conform to this protocol when:
///  * they *are* NIB-based, and
///  * this class is used as the XIB's root view
///
/// to be able to instantiate them from the NIB in a type-safe manner
public protocol NibLoadable: class {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: Default implementation
public extension NibLoadable {
    /// By default, use the nib which have the same name as the name of the class,
    /// and located in the bundle of that class
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func getNib(for anyclass: AnyClass) -> UINib {
//        return UINib(nibName: String(describing: self), bundle: Bundle(for: class))
        return UINib(nibName: String(describing: self), bundle: Bundle(for: anyclass))
    }
}

// MARK: Support for instantiation from NIB
public extension NibLoadable where Self: UIView {
    /**
     A `NibLoadable`, `UIView` instance
     - returns: A `NibLoadable`, `UIView` instance
     */
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
    
    /// A `NibLoadable`, `UIView` instance
    ///
    /// - Parameter anyclass: Bundle class
    /// - Returns: A `NibLoadable`, `UIView` instance
    static func loadFromNib(for anyclass: AnyClass) -> Self {
        guard let view = getNib(for: anyclass).instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
