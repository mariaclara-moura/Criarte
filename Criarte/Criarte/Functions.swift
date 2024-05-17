//
//  Functions.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//

import Foundation

func updateButtonColor() {
        var allTrue = true
        for attribute in attributes {
            if !attribute.moved {
                allTrue = false
                break
            }
        }
        allSlidersMoved = allTrue
    }
func processResult() {
    let totalWeight = 36.0
    let weightedSum = attributes.reduce(0.0) { sum, attribute in
        sum + (attribute.position * Double(attribute.weight))
    }
    result = (weightedSum / totalWeight) * 10
    showAlert = true
}

func resetAttributes() {
    for index in attributes.indices {
        attributes[index].position = 0
        attributes[index].moved = false
    }
    selectedArt = allArts.randomElement()!
    allSlidersMoved = false
}
}
