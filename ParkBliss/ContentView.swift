//
//  ContentView.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tagText = "";
    var body: some View {
        
        NavigationView {
            VStack {
                ParkButton()
                HStack {
                    Button("History", action: {
                        print("history")
                    })
                    .buttonStyle(GrowingButton())
                    Button("Share", action: {
                        print("share")
                    })
                    .buttonStyle(GrowingButton())
                }
                .padding()
            }
            .navigationTitle("ParkBliss")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
