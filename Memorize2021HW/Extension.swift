//
//  Extension.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 04.12.2021.
//

import SwiftUI

extension ContentView {
    
    var button1: some View {
        Button(action: {
            emojis = EmojisSet.emojiSetOne.shuffled()
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
            emojis = EmojisSet.emojiSetTwo.shuffled()
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
            emojis = EmojisSet.emojiSetThree.shuffled()
        }) {
            VStack {
                Image(systemName: "hare.fill")
                    .font(.title)
                Text("Animals")
            }
        }
    }
}
