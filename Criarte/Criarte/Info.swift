import Foundation
import SwiftUI

struct Info: View {
    @Binding var showInfo: Bool
    @Binding var message: String
    @Binding var height: CGFloat

    var body: some View {
        ZStack {
            if showInfo {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showInfo = false
                    }
                
                VStack(alignment: .center) {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                showInfo = false
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.orangeButtomOn)
                                    .padding(.trailing, 10.0)
                                    .font(.system(size: 30))
                            }
                        }
                        .padding(.top, height == 430 ? 10 : 56)
                        .frame(width: 300.0)
                        
                        ScrollView {
                                Text(.init(message != "" ? message : """
**Bem-vindo ao Criarte!**

No Criarte, você irá explorar obras de arte e perceber os atributos criativos que elas transmitem.

**Como jogar:**

1. **Observe atentamente:** Dedique um tempo para observar cada detalhe da obra. Note as cores, formas, expressões faciais, e a composição geral.
2. **Identifique os atributos:** Pense sobre os sentimentos que a obra evoca em você. Use seu próprio senso crítico para identificar esses atributos.

**Lembre-se:** não há respostas certas ou erradas. A arte é subjetiva e cada pessoa pode perceber algo diferente. Aproveite a experiência e se permita absorver a criatividade que a arte pode oferecer!
"""
                                ))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.darkBrown)
                                .font(.poppinsRegular(size: 16.0))
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .frame(width: 330)
                                
                        }
                        .frame(height: (75 * height / 100))
                    }
                    .padding(.all)
                }
                .frame(width: 355, height: height)
                .background(Color.pinkBackground)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.orangeButtomOn, lineWidth: 4))
                .shadow(radius: 10)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: showInfo)
            }
        }
    }
}

#Preview {
    Info(showInfo: .constant(true), message: .constant("É capacidade de transmitir emoções e sentimentos através"), height: .constant(180))
}
