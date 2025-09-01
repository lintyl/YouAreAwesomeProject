//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Tyler Lin on 8/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var message = ""
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
//                if message == message1 {
//                    message = message2
//                    imageName = string1
//                } else {
//                    message = message1
//                    imageName = string2
//                }
                message = (message == message1 ? message2 : message1)
                imageName = (imageName == "image0" ? "image1" : "image0")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
