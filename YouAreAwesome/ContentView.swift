//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Tyler Lin on 8/31/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    
    
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
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Press Me!") {
                // List of Possible Messages
                let messages = ["You Can Do Better Bro!",
                                "That's Very Mediocre!",
                                "My Dog Usually Likes Everyone, But He Has Taken A Particularly Standoff-ish Stance Towards Your Face And Overall Demeanour :c",
                                "You Kinda Don't Suck!",
                                "Congrats! You're Not Completely Incompetent!",
                                "Your Mom May Or May Not Approve!",
                                "Prof G Tossed You A Snickers Bar, But You're Deathly Allergic to Nuts!!!"]
                
                // Random Message Generation
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                // Random Image Generation
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...(numberOfImages-1))
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                // Random Sound Generation
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...(numberOfSounds-1))
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
                
                // Audio player
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("ERROR: \(error.localizedDescription) creating audioPlayer")
                }
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
