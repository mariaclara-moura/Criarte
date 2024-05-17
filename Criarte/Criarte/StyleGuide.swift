//
//  StyleGuide.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//

import Foundation
import SwiftUI


extension Font {
    static func pottaOne(size: CGFloat) -> Font {
        return .custom("PottaOne-Regular", size: size)
    }
    static func poppinsRegular(size: CGFloat) -> Font {
        return .custom("Poppins-Regular", size: size)
    }
    static func poppinsBold(size: CGFloat) -> Font {
        return .custom("Poppins-Bold", size: size)
    }
    static func poppinsSemiBold(size: CGFloat) -> Font {
        return .custom("Poppins-SemiBold", size: size)
    }
}
