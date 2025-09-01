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
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            Spacer()
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                let string1 = "hand.thumbsup"
                let string2 = "sun.max.fill"
//                if message == message1 {
//                    message = message2
//                    imageName = string1
//                } else {
//                    message = message1
//                    imageName = string2
//                }
                message = (message == message1 ? message2 : message1)
                imageName = (imageName == string2 ? string1 : string2)
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
