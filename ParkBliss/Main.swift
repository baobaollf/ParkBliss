//
//  Main.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI

struct Main: View {
    var body: some View {
        VStack {
            Text("Google, world!")
                .padding();
            Text("Google, world!")
                .padding();
        }
        .navigationBarTitle("ParkBliss")
        .navigationBarTitleDisplayMode(.inline);
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
