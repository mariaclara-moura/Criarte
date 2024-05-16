//
//  PopUps.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//
import SwiftUI

struct PopUps: View {
    @Binding var showAlert: Bool
    @Binding var result: Double?
    var resetAttributes: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(
                            Color(red: 222/255, green: 106/255, blue: 96/255)
                        )
                        .padding([.bottom, .trailing], 10.0)
                        .font(.system(size: 30))
                }
                .frame(width: 300.0)
                VStack(spacing: -16.0) {
                    Text("Você absorveu")
                        .foregroundColor(Color(red: 51/255, green: 30/255, blue: 27/255))
                        .padding(.bottom, 20)                    .font(.poppinsBold(size: 36.0))
                    
                    HStack {
                        Text("\(Int(result ?? 0))%")
                            .foregroundColor(Color(red: 222/255, green: 106/255, blue: 96/255))
                            .padding(.bottom, 20)                    .font(.poppinsBold(size: 40.0))
                        Text("de")
                            .foregroundColor(Color(red: 51/255, green: 30/255, blue: 27/255))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)                    .font(.poppinsBold(size: 36.0))
                    }
                    Text("criatividade!")
                        .foregroundColor(Color(red: 51/255, green: 30/255, blue: 27/255))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)                    .font(.poppinsBold(size: 36.0))
                }
            }
            Button(action: {
                resetAttributes()
                showAlert = false
            }) {
                Text("Nova avaliação")
                    .font(.poppinsSemiBold(size: 20.0))
                    .foregroundColor(Color(red: 51/255, green: 30/255, blue: 27/255))
                    .frame(width: 230, height: 60)
                    .background(Color(red: 222/255, green: 106/255, blue: 96/255))
                    .cornerRadius(10)
            }
            .padding(.bottom, 32.0)
        }
        .frame(width: 355, height: 450)
        .background(Color(
            red: 231/255,
            green: 211/255,
            blue: 209/255
        ))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 222/255, green: 106/255, blue: 96/255), lineWidth: 4)
        )
        .shadow(radius: 10)
        .transition(.opacity)
    }
}

#Preview {
    PopUps(showAlert: .constant(true), result: .constant(75.0), resetAttributes: {})
}
