//
//  Cards.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 04.12.2021.
//

import SwiftUI

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
