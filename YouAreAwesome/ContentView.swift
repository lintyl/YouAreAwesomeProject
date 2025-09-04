//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Tyler Lin on 8/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var message = ""
    @State private var messageNumber = 0
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
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Can Do Better...",
                                "That's Very Mediocre!",
                                "You Kinda Don't Suck!",
                                "You Did An Okay Job?",
                                "Your Mom May Or May Not Approve!",
                                "Prof G Tossed You A Snickers Bar, But You're Deathly Allergic to Nuts!!!"]
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
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
