//
//  ContentView.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 29.11.2021.
//


import SwiftUI

struct ContentView: View {
    
    let emojiSetOne = ["đĸ", "â´", "đ", "đ", "đŗ", "đ", "đĨ", "đ", "đ", "đ¸", "đ", "đ°", "đ", "đŠ", "âī¸", "đ", "đ˛", "đ", "đ", "đē", "đ", "đ", "đĩ", "đ", "đ", "đ", "đ", "đ"]
    
    let emojiSetTwo = ["đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đĢ", "đ", "đ", "đĨ­", "đ", "đĨĨ", "đĨ", "đ", "đ", "đĨ", "đĨ", "đļ", "đĢ", "đŊ", "đĨ", "đĢ", "đ§", "đ§", "đĨ", "đ°", "đĨ"]
    
    let emojiSetThree = ["đļ", "đ¯", "đ", "đĻ", "đ", "đĸ", "đĄ", "đ", "đĻ", "đĻ", "đ", "đĻ¨", "đą", "đ", "đ", "đ ", "đĻ", "đĻ", "đĻĢ", "đĻ", "đĻ", "đĒ°", "đ", "đĒą", "đĻ", "đ", "đĻ", "đĻ", "đĻ"]
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationView {
                TabView {
                    Cards(emojis: emojiSetOne).tabItem { Label("Cars", systemImage: "car.2") }
                    Cards(emojis: emojiSetTwo).tabItem { Label("Fruits", systemImage: "takeoutbag.and.cup.and.straw") }
                    Cards(emojis: emojiSetThree).tabItem { Label("Animals", systemImage: "hare.fill") }
                }
                .navigationTitle("Memorize!")
            }
        }
//        .padding(.horizontal)
    }
}

struct Cards: View {
    let emojis: [String]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(emojis.shuffled()[0...Int.random(in: 4...emojis.count)], id: \.self) { emoji in
                    CardView(emoji: emoji)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CardView: View {
    let emoji: String
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }.aspectRatio(2/3, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
