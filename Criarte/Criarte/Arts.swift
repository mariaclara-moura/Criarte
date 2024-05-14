//
//  Arts.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 14/05/24.
//

import Foundation

// definir artes, suas fotos e seus creditos

struct Arts: Identifiable {
    let id = UUID()
    let name: String
    let author: String
    let archive: String
}
