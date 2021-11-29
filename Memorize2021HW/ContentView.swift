//
//  ContentView.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 29.11.2021.
//


import SwiftUI

struct ContentView: View {
    
    let emojiSetOne = ["🚢", "⛴", "🚗", "🚌", "🛳", "🚙", "🛥", "🚕", "🚁", "🛸", "🚀", "🛰", "🚂", "🛩", "✈️", "🚇", "🚲", "🚃", "🏍", "🛺", "🚔", "🚆", "🛵", "🏎", "🚒", "🚑", "🚜", "🚛"]
    
    let emojiSetTwo = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥒", "🌶", "🫑", "🌽", "🥕", "🫒", "🧄", "🧅", "🥔", "🌰", "🥜"]
    
    let emojiSetThree = ["🐶", "🐯", "🐒", "🦇", "🐞", "🐢", "🐡", "🐆", "🦒", "🦙", "🐓", "🦨", "🐱", "🐜", "🐍", "🐠", "🦓", "🦃", "🦫", "🦍", "🦎", "🪰", "🐝", "🪱", "🦋", "🐌", "🦉", "🦀", "🦆"]
    
    
    
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
