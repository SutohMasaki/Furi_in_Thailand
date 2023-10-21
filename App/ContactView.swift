import SwiftUI


struct ContactView: View {
    
    /*#-code-walkthrough(FunFactsView.funFacts)*/
    var NounWords = NounList.list
    var VerbWords = VerbList.list
    var AdjectiveWords = AdjectiveList.list
    /*#-code-walkthrough(FunFactsView.funFacts)*/
    /*#-code-walkthrough(FunFactsView.stateVariable)*/
    @State var places:[String:String] = ["ホテル":"โรงแรม","ゴーゴーバー":"อะโกโก้บาร์","コンビニ":"ร้านสะดวกซื้อ"]
    @State var picker:[String] = ["ホテル","ゴーゴーバー","コンビニ"]
    @State var selected:String = "ホテル"

    @State var languages:[String] = ["English","Russian","Ukrainian"]
    @State var greetings:[String:String] = ["English":"Hello",
                                            "Russian":"Привет привет(Privet privet)",
                                            "Ukrainian":"Привіт привіт(Pryvit pryvit)"]
    @State var selectedLanguage:String = "English"
    
    var body: some View {
        /*#-code-walkthrough(FunFactsView.color)*/
        ZStack {
            VStack{
                HStack{
                    VStack{
                        VStack{
                            Text("私は〜〜行きたいです。").font(.title2)
                            .frame(minWidth: 100,maxWidth: .infinity , minHeight: 15,alignment: .topLeading)
                            
                        }
                        VStack{
                            Text("(อยากไป + 場所)").font(.subheadline).frame(minWidth: 100,maxWidth: .infinity , minHeight: 15,alignment: .topLeading)
                        }
                    }
                    HStack{
                        Picker(selection: $selected, label: Text("Place"), content: {
                            ForEach(picker, id:\.self) { value in
                                Text("\(value)")
                                    .tag(value)
                            }
                        }).onChange(of: selected) { newValue in
                            print(newValue)
                        }
                        .pickerStyle(.menu)
                    }
                }
                HStack {
                    Text("อยากไป" + places[selected]!).font(.title)
                        .frame(minWidth: 200,maxWidth: .infinity , minHeight: 15,alignment: .topLeading)
                }
            } 
            Spacer()

          }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
