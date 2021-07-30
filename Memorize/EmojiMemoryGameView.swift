import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size)).foregroundColor(.orange)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font (in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius : CGFloat = 20
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
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
