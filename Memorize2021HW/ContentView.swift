//
//  ContentView.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 29.11.2021.
//


import SwiftUI

struct ContentView: View {
    
    let emojiSetOne = ["🚢", "⛴", "🚗", "🚌", "🛳", "🚙", "🛥", "🚕", "🚁", "🛸", "🚀", "🛰", "🚂", "🛩", "✈️", "🚇", "🚲", "🚃", "🏍", "🛺", "🚔", "🚆", "🛵", "🏎", "🚒", "🚑", "🚜", "🚛", "🚎", "💺"]
    
    let emojiSetTwo = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥒", "🌶", "🫑", "🌽", "🥕", "🫒", "🧄", "🧅", "🥔", "🌰", "🥜", "🥚"]
    
    let emojiSetThree = ["🐶", "🐯", "🐒", "🦇", "🐞", "🐢", "🐡", "🐆", "🦒", "🦙", "🐓", "🦨", "🐱", "🐜", "🐍", "🐠", "🦓", "🦃", "🦫", "🦍", "🦎", "🪰", "🐝", "🪱", "🦋", "🐌", "🦉", "🦀", "🦆", "🐋"]
    
    @State var emojis: [String]
    
    var body: some View {
        VStack {
            //            emojis = emojiSetOne
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
    
    var button1: some View {
        Button(action: {
            emojis = emojiSetOne.shuffled()
        }) {
            VStack {
                Image(systemName: "car.2")
                    .font(.title)
                Text("Cars")
            }
        }
    }
    
    var button2: some View {
        Button(action: {
            emojis = emojiSetTwo.shuffled()
        }) {
            VStack {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                    .font(.title)
                Text("Fruits")
            }
        }
    }
    
    var button3: some View {
        Button(action: {
            emojis = emojiSetThree.shuffled()
        }) {
            VStack {
                Image(systemName: "hare.fill")
                    .font(.title)
                Text("Animals")
            }
        }
    }
}

struct Cards: View {
    let emojis: [String]
    var rangeEnd: Int {
        Int.random(in: 4..<emojis.count)
    }
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(emojis[0...rangeEnd], id: \.self) { emoji in
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
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojis: ["", "", "", "", "", ""])
            .previewInterfaceOrientation(.portrait)
    }
}
