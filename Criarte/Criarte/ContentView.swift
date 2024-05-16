import SwiftUI
import Foundation

struct ContentView: View {
    @State var attributes = [
        Attribute(
            name: "Expressividade",
            position: 0,
            weight: 8
        ),
        Attribute(
            name: "Autenticidade",
            position: 0,
            weight: 6
        ),
        Attribute(
            name: "Complexidade",
            position: 0,
            weight: 1
        ),
        Attribute(
            name: "Inovação",
            position: 0,
            weight: 2
        ),
        Attribute(
            name: "Impacto",
            position: 0,
            weight: 4
        ),
        Attribute(
            name: "Coerência",
            position: 0,
            weight: 3
        ),
        Attribute(
            name: "Curiosidade",
            position: 0,
            weight: 5
        ),
        Attribute(
            name: "Experimentação",
            position: 0,
            weight: 7
        )
    ]
    @State var allSlidersMoved = false
    @State var result: Double?
    @State private var showAlert = false
    @State private var selectedArt = allArts.randomElement()!
    
    var body: some View {
        ZStack {
            Color(
                red: 231/255,
                green: 211/255,
                blue: 209/255
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Ellipse()
                        .frame(width: 492, height: 304)
                        .foregroundColor(
                            Color(red: 51/255, green: 30/255, blue: 27/255)
                        )
                    HStack(alignment: .top) {
                        Text("Criarte")
                            .font(.pottaOne(size: 48.0))
                            .foregroundColor(
                                Color(red: 222/255, green: 106/255, blue: 96/255).opacity(0.8)
                            )
                        Button(action: {
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(
                                    Color(red: 222/255, green: 106/255, blue: 96/255).opacity(0.8)
                                )
                        }
                    }
                    .padding(.top, 150.0)
                    .padding(.leading, 20.0)
                }
                .edgesIgnoringSafeArea(.top)
                .padding(.top, -130.0)
                
                ZStack {
                    Text("\(selectedArt.name), \(selectedArt.author)")
                        .font(.poppinsRegular(size: 12.0))
                        .rotationEffect(.degrees(270))
                        .foregroundColor(
                            Color(red: 51/255, green: 30/255, blue: 27/255)
                        )
                        .offset(x: -140)
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 305)
                            .foregroundColor(
                                Color(red: 51/255, green: 30/255, blue: 27/255)
                            )
                        Image(selectedArt.archive)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 218.0, height: 265.0)
                    }
                }
                .padding(.top, -30.0)
                
                Text("Como você percebe a presença de...")
                    .font(.poppinsSemiBold(size: 20.0))
                    .foregroundColor(Color(red: 51/255, green: 30/255, blue: 27/255))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(width: 270.0, height: 60.0)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 2) {
                        ForEach(attributes.indices, id: \.self) { index in
                            let attribute = attributes[index]
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(attribute.name)
                                        .font(.poppinsRegular(size: 16.0))
                                        .foregroundColor(
                                            Color(red: 51/255, green: 30/255, blue: 27/255)
                                        )
                                    Slider(
                                        value: $attributes[index].position,
                                        in: 0...10,
                                        step: 1
                                    )
                                    .padding(.leading, -2.0)
                                    .accentColor(
                                        Color(red: 222/255, green: 106/255, blue: 96/255)
                                    )
                                    .frame(width: 280, height: 20.0)
                                    .onChange(of: attributes[index].position) {
                                        attributes[index].moved = true
                                        updateButtonColor()
                                    }
                                }
                                Spacer()
                            }
                            .padding(.leading, 20.0)
                        }
                        .frame(width: 330, height: 40)
                        .padding()
                    }
                }
                
                Button(action: {
                    processResult()
                }) {
                    Text("Criartivar")
                        .font(.poppinsSemiBold(size: 24.0))
                        .foregroundColor(
                            allSlidersMoved ? Color(red: 51/255, green: 30/255, blue: 27/255) : Color(red: 137/255, green: 106/255, blue: 103/255)
                        )
                        .padding()
                        .frame(width: 200, height: 45)
                        .background(
                            allSlidersMoved ? Color(red: 222/255, green: 106/255, blue: 96/255) : Color(red: 222/255, green: 106/255, blue: 96/255).opacity(0.5)
                        )
                        .cornerRadius(16)
                }
                .padding(.top, 20)
                .disabled(!allSlidersMoved)
               
            }
            if showAlert {
                PopUps(showAlert: $showAlert, result: $result, resetAttributes: resetAttributes)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
//    private func updateButtonColor() {
//    allSlidersMoved = attributes.allSatisfy { $0.moved } //aqui
//
//  }
    private func updateButtonColor() {
            var allTrue = true
            for attribute in attributes {
                if !attribute.moved {
                    allTrue = false
                    break
                }
            }
            allSlidersMoved = allTrue
        }
    private func processResult() {
        let totalWeight = 36.0
        let weightedSum = attributes.reduce(0.0) { sum, attribute in
            sum + (attribute.position * Double(attribute.weight))
        }
        result = (weightedSum / totalWeight) * 10
        showAlert = true
    }
    
    private func resetAttributes() {
        for index in attributes.indices {
            attributes[index].position = 0
            attributes[index].moved = false
        }
        selectedArt = allArts.randomElement()!
        allSlidersMoved = false
    }
}

struct Attribute: Identifiable {
    let id = UUID()
    let name: String
    var position: Double
    var weight: Int
    var moved = false
}


#Preview {
    ContentView()
}

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
