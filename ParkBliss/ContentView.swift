//
//  ContentView.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ParkButton();
//                Text("Google, world!")
//                    .padding();
                HStack {
                    Button("History", action: {
                        print("hi")
                    })
                    .buttonStyle(GrowingButton())
                    Button("Share", action: {
                        print("hi again")
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
