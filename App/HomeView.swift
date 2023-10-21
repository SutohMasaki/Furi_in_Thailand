import SwiftUI

/*#-code-walkthrough(HomeView.struct)*/
struct HomeView: View {
    @State var nowDate = Date()
    @State var japanDateText = ""
    private let japanDateFormatter = DateFormatter()
    @State var thaiDateText = ""
    private let thaiDateFormatter = DateFormatter()
    
    /*#-code-walkthrough(HomeView.struct)*/
    /*#-code-walkthrough(HomeView.views)*/
    init() {
        japanDateFormatter.dateFormat = "YY/MM/dd(E) HH:mm:ss"
        japanDateFormatter.locale = Locale(identifier: "ja_JP")
        japanDateFormatter.timeZone = TimeZone(abbreviation: "UTC+9")
        thaiDateFormatter.dateFormat = "YY/MM/dd(E) HH:mm:ss"
        thaiDateFormatter.locale = Locale(identifier: "th_US")
        thaiDateFormatter.timeZone = TimeZone(abbreviation: "UTC+7")
    }

    var body: some View {
        VStack {
            Text("Furi in ThaiLand")
            /*#-code-walkthrough(HomeView.modifiers)*/
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            /*#-code-walkthrough(HomeView.modifiers)*/
            /*#-code-walkthrough(HomeView.Image)*/
            Image(systemName: "network")
            /*#-code-walkthrough(HomeView.Image.resizable)*/
                .resizable()
                .scaledToFit()
            /*#-code-walkthrough(HomeView.Image.resizable)*/
            /*#-code-walkthrough(HomeView.Image.modifiers)*/
                .frame(width: 200, height: 200)
            /*#-code-walkthrough(HomeView.Image)*/
            
            /*#-code-walkthrough(HomeView.Image.modifiers)*/
            /*#-code-walkthrough(omeView.Image.overlay)*/
            /*#-code-walkthrough(HomeView.Text)*/
            Text("ThaiLand Time")
            /*#-code-walkthrough(HomeView.Text)*/
            /*#-code-walkthrough(HomeView.Text.modifiers)*/
                .font(.title)
            Text(thaiDateText.isEmpty ? "\(thaiDateFormatter.string(from: nowDate))" : thaiDateText)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        thaiDateText = "\(thaiDateFormatter.string(from: nowDate))"
                    }
                }            
            
            Text("Japan Time")
            /*#-code-walkthrough(HomeView.Text)*/
            /*#-code-walkthrough(HomeView.Text.modifiers)*/
                .font(.title)
            /*#-code-walkthrough(HomeView.Text.modifiers)*/
            /*#-code-walkthrough(HomeView.Text.moreModifiers)*/
            Text(japanDateText.isEmpty ? "\(japanDateFormatter.string(from: nowDate))" : japanDateText)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        japanDateText = "\(japanDateFormatter.string(from: nowDate))"
                    }
                }
            /*#-code-walkthrough(HomeView.Image.modifiers)*/
            /*#-code-walkthrough(omeView.Image.overlay)*/
            /*#-code-walkthrough(HomeView.Text)*/

            
            /*#-code-walkthrough(HomeView.stacksOnStacks)*/
        }
        .padding()
        /*#-code-walkthrough(HomeView.Image.background)*/
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct FontNames {
    static var americanTypwriter = "American Typewriter"
    static var arial = "Arial"
    static var baskerville = "Baskerville"
    static var chalkduster = "Chalkduster"
    static var courier = "Courier"
    static var georgia = "Georgia"
    static var helvetica = "Helvetica"
    static var palatino = "Palatino"
    static var zapfino = "Zapfino"
}
