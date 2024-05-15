import SwiftUI

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
    
    @State private var allSlidersMoved = false
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
            .edgesIgnoringSafeArea(
                .all
            )
            VStack {
                ZStack {
                    Ellipse()
                        .frame(
                            width: 492,
                            height: 304
                        )
                        .foregroundColor(
                            Color(
                                red: 51/255,
                                green: 30/255,
                                blue: 27/255
                            )
                        )
                    HStack(
                        alignment: .top
                    ) {
                        Text(
                            "Criarte"
                        ).font(
                            .pottaOne(
                                size: 48.0
                            )
                        )
                        .foregroundColor(
                            Color(
                                red: 222/255,
                                green: 106/255,
                                blue: 96/255
                            ).opacity(
                                0.8
                            )
                        )
                        Button(action: {
                        }) {
                            Image(
                                systemName: "info.circle"
                            )
                            .foregroundColor(
                                Color(
                                    red: 222/255,
                                    green: 106/255,
                                    blue: 96/255
                                ).opacity(
                                    0.8
                                )
                            )
                        }
                    }
                    .padding(
                        .top,
                        150.0
                    ).padding(
                        .leading,
                        20.0
                    )
                }.edgesIgnoringSafeArea(
                    .top
                ).padding(
                    .top,
                    -130.0
                )
                
                HStack(
                    alignment: .center,
                    spacing: -70.0
                ) {
                    ZStack {
                        Rectangle().frame(
                            width: 258,
                            height: 305
                        ).foregroundColor(
                            Color(
                                red: 51/255,
                                green: 30/255,
                                blue: 27/255
                            )
                        )
                        Image(
                            selectedArt.archive
                        )
                        .resizable()
                        .padding(
                            .top,
                            -2.0
                        )
                        .frame(
                            width: 228.0,
                            height: 265.0
                        )
                        .scaledToFit()
                    }
                    Text(
                        "\(selectedArt.name) por \(selectedArt.author)"
                    )
                    .font(
                        .footnote
                    )
                    .rotationEffect(
                        .degrees(
                            90
                        )
                    )  .foregroundColor(
                        Color(
                            red: 51/255,
                            green: 30/255,
                            blue: 27/255
                        )
                    ).fontDesign(
                        .rounded
                    )
                }.padding(
                    .top,
                    -30.0
                )
                .padding(
                    .leading,
                    90.0
                )
                Text(
                    "Como você percebe a presença de..."
                ).font(
                    .title3
                )
                .fontWeight(
                    .semibold
                )   .foregroundColor(
                    Color(
                        red: 51/255,
                        green: 30/255,
                        blue: 27/255
                    )
                ).multilineTextAlignment(
                    .center
                ).frame(
                    width: 270.0,
                    height: 60.0
                ).fontDesign(
                    .rounded
                )
                ScrollView(
                    .vertical,
                    showsIndicators: true
                ) {
                    VStack(
                        spacing: 3
                    ) {
                        ForEach(
                            attributes.indices,
                            id: \.self
                        ) { index in
                            let attribute = attributes[index]
                            HStack {
                                VStack(
                                    alignment: .leading
                                ) {
                                    Text(
                                        attribute.name
                                    ).font(
                                        .body
                                    )
                                    .fontWeight(
                                        .medium
                                    )   .foregroundColor(
                                        Color(
                                            red: 51/255,
                                            green: 30/255,
                                            blue: 27/255
                                        )
                                    ).multilineTextAlignment(
                                        .leading
                                    ).fontDesign(
                                        .rounded
                                    )

                                    Slider(
                                        value: $attributes[index].position,
                                        in: 0...10,
                                        step: 1
                                    ).accentColor(
                                        Color(
                                            red: 222/255,
                                            green: 106/255,
                                            blue: 96/255
                                        )
                                    )
                                    .frame(
                                        width: 280
                                    ).onChange(
                                        of: attributes[index].position
                                    ) {
                                        attributes[index].moved = true
                                        updateButtonColor()
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(
                                .leading,
                                20.0
                            )
                        }
                        .frame(
                            width: 330,
                            height: 40
                        )
                        .padding()
                    }
                }
                
                Button(action: {
                    processResult()
                }) {
                    Text(
                        "Criartivar"
                    )
                    .font(
                        .callout
                    )
                    .fontWeight(
                        .semibold
                    ).fontDesign(
                        .rounded
                    )
                    .foregroundColor(
                        allSlidersMoved ? Color(
                            red: 51/255,
                            green: 30/255,
                            blue: 27/255
                        ) : Color(
                            red: 137/255,
                            green: 106/255,
                            blue: 103/255
                        )
                    )
                    .padding()
                    .frame(
                        width: 200,
                        height: 45
                    )
                    .background(
                        allSlidersMoved ? Color(
                            red: 222/255,
                            green: 106/255,
                            blue: 96/255
                        ) : Color(
                            red: 222/255,
                            green: 106/255,
                            blue: 96/255
                        ).opacity(
                            0.5
                        )
                    )
                    .cornerRadius(
                        16
                    )
                } .padding(
                    .top,
                    20
                )
                .disabled(
                    !allSlidersMoved
                ).alert(
                    isPresented: $showAlert
                ) {
                    Alert(
                        title: Text(
                            "Resultado"
                        ),
                        message: Text( "Você absorveu \(Int(result ?? 0))% da criatividade da obra!"),
                        dismissButton: .default(
                            Text(
                                "OK"
                            )
                        ) {
                            resetAttributes()
                        }
                    ) }
            }
        }.edgesIgnoringSafeArea(
            .top
        )
        
        
    }
    private func updateButtonColor() {
        allSlidersMoved = attributes.allSatisfy {
            $0.moved
        }
    }
    private func processResult(){
        
        let totalWeight = 36.0
        let weightedSum = attributes.reduce(
            0.0
        ) {
            sum,
            attribute in
            sum + (
                attribute.position * Double(
                    attribute.weight
                )
            )
        }
        result = (
            weightedSum / totalWeight
        ) * 10
        showAlert = true
        
    }
    private func resetAttributes() {
        for index in attributes.indices {
            attributes[index].position = 0
            attributes[index].moved = false
        }
        allSlidersMoved = false
        selectedArt = allArts.randomElement()!
        
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

extension Font{
    static func pottaOne(
        size: CGFloat
    ) -> Font{
        return .custom(
            "PottaOne-Regular",
            size: size
        )
    }
}


