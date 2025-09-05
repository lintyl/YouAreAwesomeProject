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
            Text(message)
                .frame(height: 100)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Press Me!") {
                let messages = ["You Can Do Better Bro!",
                                "That's Very Mediocre!",
                                "My Dog Usually Likes Everyone, But He Has Taken A Particularly Standoff-ish Stance Towards Your Face And Overall Demeanour :c",
                                "You Kinda Don't Suck!",
                                "Congrats! You're Not Completely Incompetent!",
                                "Your Mom May Or May Not Approve!",
                                "Prof G Tossed You A Snickers Bar, But You're Deathly Allergic to Nuts!!!"]
                
                message = messages[Int.random(in: 0...messages.count-1)]
                imageName = "image\(Int.random(in: 0...9))"
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
