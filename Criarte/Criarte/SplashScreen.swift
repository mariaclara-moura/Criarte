import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var textOpacity = 0.2

    var body: some View {
        VStack {
            if isActive {
                ContentView()
            } else {
                Color.pinkBackground
                    .ignoresSafeArea()
                    .overlay(
                        Text("Criarte")
                            .font(.pottaOne(size: 42))
                            .fontWeight(.bold)
                            .foregroundColor(.orangeTitle)
                            .opacity(textOpacity)
                    )
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 3)) {
                self.textOpacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
