//
//  HomeView.swift
//  restart
//
//  Created by Sabir's MacBook on 7/8/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
      
            VStack(spacing: 20) {
                
                // HEADER
                
                Spacer()
                ZStack {
                    
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35: -35)
                        .animation(
                            Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating)
                }
                
                // CENTER
                
                Text("The time that leads to maestry is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
               
                // FOOTER
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                }) {
                    
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
            }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .padding()
        }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { isAnimating = true })
            })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
