//
//  Info.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//

import Foundation
import SwiftUI

struct Info: View {
    @Binding var showInfo: Bool
    
    var body: some View {
        ZStack {
            if showInfo {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                            showInfo = false
                    }
                VStack(alignment: .center) {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                showInfo = false
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.orangeButtomOn)
                                    .padding([.bottom, .trailing], 10.0)
                                    .font(.system(size: 30))
                            }
                        }
                        .frame(width: 300.0)
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading) {
                                Text("""
                                    Entre os aspectos considerados para calcular o Quociente de Criatividade Artística estão:
                                    **Expressividade**: a capacidade de transmitir emoções e sentimentos através da arte.
                                    **Autenticidade**: a habilidade de expressar-se de forma genuína e verdadeira.
                                    **Complexidade**: a capacidade de criar obras com múltiplas camadas e significados.
                                    **Inovação**: a habilidade de introduzir novas ideias, conceitos e técnicas no campo artístico.
                                    **Impacto**: a capacidade de causar impacto e despertar reações no público.
                                    **Coerência**: a consistência e harmonia entre as diferentes obras produzidas.
                                    **Curiosidade**: a disposição para explorar novas referências e inspirações.
                                    **Experimentação**: a disposição para explorar novas abordagens e técnicas artísticas.
                                    """)
                                    .multilineTextAlignment(.leading)
                            }
                            .multilineTextAlignment(.center)
                            .font(.poppinsRegular(size: 16.0))
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 32.0)
                        .frame(height: 300.0)
                    }
                    .padding(.all)
                }
                .frame(width: 355, height: 400)
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
 Info(showInfo: .constant(true))
}
