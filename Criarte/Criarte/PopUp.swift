//
//  PopUp.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//
import SwiftUI

struct PopUp: View {
    @Binding var showAlert: Bool
    @Binding var result: Double?
    var resetAttributes: () -> Void
    
    var body: some View {
        ZStack {
            if showAlert {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showAlert = false
                    }

                VStack(alignment: .center) {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action:{
                                showAlert = false
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.orangeButtomOn)
                                    .padding([.bottom, .trailing], 10.0)
                                    .font(.system(size: 30))
                            }
                        }
                        .frame(width: 300.0)
                        
                        VStack(spacing: -16.0) {
                            Text("Você absorveu")
                                .foregroundColor(Color.darkBrown)
                                .padding(.bottom, 20)
                                .font(.poppinsBold(size: 36.0))
                            
                            HStack {
                                Text("\(Int(result ?? 0))%")
                                    .foregroundColor(Color.orangeButtomOn)
                                    .padding(.bottom, 20)
                                    .font(.poppinsBold(size: 40.0))
                                Text("de")
                                    .foregroundColor(Color.darkBrown)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 20)
                                    .font(.poppinsBold(size: 36.0))
                            }
                            
                            Text("criatividade!")
                                .foregroundColor(Color.darkBrown)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 20)
                                .font(.poppinsBold(size: 36.0))
                        }
                    }
                    
                    Button(action: {
                        resetAttributes()
                        showAlert = false
                    }) {
                        Text("Nova avaliação")
                            .font(.poppinsSemiBold(size: 20.0))
                            .foregroundColor(Color.darkBrown)
                            .frame(width: 230, height: 60)
                            .background(Color.orangeButtomOn)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 32.0)
                }
                .frame(width: 355, height: 450)
                .background(Color.pinkBackground)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orangeButtomOn, lineWidth: 4)
                )
                .shadow(radius: 10)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: showAlert)
            }
        }
    }
}

#Preview {
    PopUp(
        showAlert: .constant(true),
        result: .constant(75.0),
        resetAttributes: {}
    )
}
