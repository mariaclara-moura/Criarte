import SwiftUI
import Foundation

extension Attribute {
    static var start: [Attribute] {
        [
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
    }
}
struct ContentView: View {
    @State var attributes = Attribute.start
    @State var allSlidersMoved = false
    @State var result: Double?
    @State var showAlert = false
    @State var showInfo = false
    @State var selectedArt = allArts.randomElement()!
    @State var resetButton = false
    @State var scrollToTop = false

    var body: some View {
        ZStack {
            Color(.pinkBackground )
            .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Ellipse()
                        .frame( width: 492, height: 304)
                        .foregroundColor(Color.darkBrown)
                    HStack(alignment: .top) {
                        Text("Criarte")
                        .font(.pottaOne(size: 48.0))
                        .foregroundColor(Color.orangeTitle)
                        Button(action: {showInfo = true}) {
                            Image(systemName: "info.circle")
                            .foregroundColor(Color(.orangeTitle))
                        }
                    }
                    .padding(.top, 150.0)
                    .padding(.leading,20.0)
                }
                .edgesIgnoringSafeArea(.top)
                .padding( .top,-130.0)
                ZStack {
                    Text( "\(selectedArt.name), \(selectedArt.author)")
                    .font(.poppinsRegular(size: 12.0))
                    .frame( width: 350.0)
                    .rotationEffect(.degrees(270))
                    .foregroundColor(Color.darkBrown)
                    .offset(x: -140)
                    ZStack {
                        Rectangle()
                            .frame( width: 250,height: 305)
                            .foregroundColor( Color(.darkBrown))
                        Image(selectedArt.archive)
                        .resizable()
                        .scaledToFit()
                        .frame( width: 218.0,height: 265.0)
                    }
                }
                .padding(.top, -30.0)
                Text("Como você percebe a presença de...")
                .font( .poppinsSemiBold(size: 20.0))
                .foregroundColor(Color(.darkBrown))
                .multilineTextAlignment(.center)
                .frame(width: 270.0,height: 60.0)
                ScrollViewReader { value in
                    ScrollView( .vertical, showsIndicators: true ) {
                        VStack(spacing: 2) {
                            ForEach( attributes.indices, id: \.self) { index in
                                let attribute = attributes[index]
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(attribute.name)
                                        .font(.poppinsRegular(size: 16.0))
                                        .padding(.leading,2.0)
                                        .foregroundColor(Color( .darkBrown ) )
                                        Slider( value: $attributes[index].position, in: 0...10, step: 1)
                                        .accentColor( Color(.orangeButtomOn))
                                        .frame( width: 280, height: 20.0)
                                        .onChange(of: attributes[index].position) {
                                            print("antes resetbutton: \(resetButton), \(attributes[index].name).moved: \(attributes[index].moved)")
                                            attributes[index].moved = (
                                                resetButton &&
                                                attributes[index].moved == .moved &&
                                                !attributes[index].didChange
                                            ) ? .idle : .moved
                                            attributes[index].didChange = true
                                            print("depois resetbutton: \(resetButton), \(attributes[index].name).moved: \(attributes[index].moved)")
                                            updateButtonColor()
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading,20.0)
                            }
                            .frame( width: 330,height: 40)
                            .padding()
                        }
                    }
                    .onChange( of: scrollToTop) {
                        if scrollToTop {
                            withAnimation {
                                value.scrollTo( 0, anchor: .top )
                            }
                            scrollToTop = false
                        }
                    }
                }
                
                Button(action: {
                    processResult()
                    scrollToTop = true
                }) {
                    Text("Criartivar")
                    .font(.poppinsSemiBold( size: 24.0) )
                    .foregroundColor( allSlidersMoved ? Color( .darkBrown ) : Color( .lightBrown ))
                    .padding()
                    .frame( width: 200,height: 45)
                    .background(allSlidersMoved ? Color( .orangeButtomOn ) : Color( .orangeButtomOff ) )
                    .cornerRadius(16)
                }
                .padding( .top,20)
                .disabled( !allSlidersMoved)
            }
            if showAlert {
                PopUp(showAlert: $showAlert,result: $result, resetAttributes: resetAttributes)
            }
            if showInfo {
                Info(showInfo: $showInfo)
            }
        }
        .edgesIgnoringSafeArea( .top )
    }
    
    func updateButtonColor() {
        var allTrue = attributes.allSatisfy { $0.moved == .moved }
        allSlidersMoved = allTrue
        print("alltrue \(allTrue)")
        if allTrue {
            resetButton = false
            print("liberou geral")
        }
    }
    
    func resetAttributes() {
        for index in attributes.indices {
            attributes[index].position = 0
            attributes[index].didChange = false
        }
        selectedArt = allArts.randomElement()!
        allSlidersMoved = false
        resetButton = true
        print("bloqueou geral")
    }
    
    func processResult() {
        let totalWeight = 36.0
        let weightedSum = attributes.reduce(0.0) {
            sum, attribute in sum + ( attribute.position * Double(attribute.weight))
        }
        result = (weightedSum / totalWeight) * 10
        showAlert = true
    }
    
}

struct Attribute: Identifiable {
    let id = UUID()
    let name: String
    var position: Double
    var weight: Int
    var moved = State.idle
    var didChange = false

    enum State {
        case idle
        case moved
    }
}



#Preview {
    ContentView()
}
