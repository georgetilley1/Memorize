//
//  ContentView.swift
//  Memorize
//
//  Created by George Tilley on 27/05/2021.
//



import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle).foregroundColor(.orange)
            } else {
                shape.fill()
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}






//import SwiftUI
//
//struct ContentView: View {
//    @State var emojis = ["🚙", "🚌", "🏎", "🚛", "🚓", "🚑", "✈️", "🚲", "🛴", "🚒", "🚔", "🚞", "🚝", "🚍", "⛴", "🛵"]
//
//    let emojisVehicle = ["🚙", "🚌", "🏎", "🚛", "🚓", "🚑", "✈️", "🚲", "🛴", "🚒", "🚔", "🚞", "🚝", "🚍", "⛴", "🛵"]
//
//    let emojisAnimal = ["🐝", "🪱", "🦆", "🦐", "🐇", "🦍", "🦔", "🐌", "🐊", "🦧", "🐞", "🪰", "🐘", "🦤", "🦇", "🐢"]
//
//    let emojisFlag = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇮🇪", "🇫🇷", "🇺🇸", "🇯🇵", "🇷🇺", "🇨🇳", "🇨🇦", "🇦🇺", "🇩🇪", "🇮🇳", "🇧🇷", "🏴‍☠️"]
//
//    var body: some View {
//        VStack  {
//            HStack {
//                Text("Memorize!")
//                    .font(.title)
//                    .fontWeight(.heavy)
//                    .padding(.vertical)
//            }
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
//                    ForEach(emojis[0..<16] , id: \.self) { emoji in
//                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
//                    }
//                }
//            }
//            .foregroundColor(.red)
//            Spacer()
//            HStack {
//                vehicles
//                Spacer()
//                animals
//                Spacer()
//                flags
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
//        }
//        .padding(.horizontal)
//    }
//
//    var vehicles: some View {
//        Button {
//            emojis = emojisVehicle.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "car")
//                Text("Vehicles").font(.footnote)
//            }
//        }
//    }
//
//    var animals: some View {
//        Button {
//            emojis = emojisAnimal.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "hare")
//                Text("Animals").font(.footnote)
//            }
//        }
//    }
//
//    var flags: some View {
//        Button {
//            emojis = emojisFlag.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "flag")
//                Text("Flags").font(.footnote)
//            }
//        }
//    }
//
//}
//
//struct CardView: View {
//    var content: String
//    @State var isFaceUp: Bool = true
//
//    var body: some View {
//        ZStack {
//            let shape = RoundedRectangle(cornerRadius: 20)
//            if isFaceUp {
//                shape.fill().foregroundColor(.white)
//                shape.strokeBorder(lineWidth: 3)
//                Text(content).font(.largeTitle).foregroundColor(.orange)
//            } else {
//                shape.fill()
//            }
//        }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.light)
//        ContentView()
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//    }
//}
