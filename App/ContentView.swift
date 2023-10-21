import SwiftUI

struct ContentView: View {
    var body: some View {
        /*#-code-walkthrough(ContentView.tabView)*/
        TabView {
            /*#-code-walkthrough(ContentView.tabView)*/
            /*#-code-walkthrough(ContentView.homeTab)*/
            HomeView()
            /*#-code-walkthrough(ContentView.homeTab)*/
            /*#-code-walkthrough(ContentView.tabItem)*/
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }

            CalculatorView()
                .tabItem {
                    Label("Culc", systemImage: "function")
                }
            
            WordsView()
                .tabItem {
                    Label("Words", systemImage: "book")
                }
            
            ContactView()
                .tabItem {
                    Label("Contact", systemImage: "ellipsis.message")
                }
            /*#-code-walkthrough(ContentView.addATab)*/

            /*#-code-walkthrough(ContentView.addATab)*/
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
