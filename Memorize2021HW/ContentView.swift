//
//  ContentView.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 29.11.2021.
//


import SwiftUI



struct ContentView: View {
    
    @State var emojis: [String]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                Cards(emojis: emojis)
            }
            Spacer()
            HStack(spacing: 50) {
                button1
                button2
                button3
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojis: EmojisSet.emojiSetOne)
            .previewInterfaceOrientation(.portrait)
    }
}



