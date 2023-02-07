//
//  ContentView.swift
//  AnimateSplashScreen
//
//  Created by matthieu passerel on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var splashLoaded = false
    var body: some View {
        if (splashLoaded) {
            AppBody()
        } else {
            Splash(splashLoaded: $splashLoaded)
        }
    }
}

struct Splash: View {
    @Binding var splashLoaded: Bool
    @State var scale = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Image("Codabee")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .animation(.interactiveSpring(
                    response: 1,
                    dampingFraction: 0.4,
                    blendDuration: 1.5
                ), value: scale)
            Spacer()
        }
        
        .background(Color.white)
            .onAppear() {
                scale = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.splashLoaded = true
                    }
                }
            }
        
    }
}

struct AppBody: View {
    
    var body: some View {
        VStack {
            Image("logo no bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
            Text("Codabee.com")
                .font(.largeTitle)
                .bold()
            Text("Apprendre le développement d'applications mobiles n'a jamais été aussi simple!")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
