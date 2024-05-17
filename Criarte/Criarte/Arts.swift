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

var allArts: [Arts] = [ Arts(name: "Abaporu", author: "Tarsila do Amaral", archive: "abaporu"),
                        Arts(name: "O Grito", author: "Edvard Munch", archive: "grito"),
                        Arts(name: "O Beijo", author: "Gustav Klimt", archive: "beijo"),
                        Arts(name: "O Filho do Homem", author: "Renê Magritte", archive: "filho"),
                        Arts(name: "Mona Lisa", author: "Leonardo da Vinci", archive: "monalisa"),
                        Arts(name: "Retrato de Picasso", author: "Juan Gris", archive: "retrato"),
                        Arts(name: "Os Girassóis", author: "Vincent Van Gogh", archive: "girassois"),
                        Arts(name: "O Homem de Sete Cores", author: "Anita Malfatti", archive: "homem"),
                        Arts(name: "Mulher com sombrinha", author: "Claude Monet", archive: "mulher"),
                        Arts(name: "Moça com o Brinco de Pérola", author: "Johannes Vermeer", archive: "brinco")
                        
]
