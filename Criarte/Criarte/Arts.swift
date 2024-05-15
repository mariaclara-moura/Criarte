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

var allArts: [Arts] = [ Arts(name: "Abaporu", author: "Tarsila do Amaral", archive: "abaporu"), Arts(name: "O Grito", author: "Edward Munch", archive: "grito")
]
