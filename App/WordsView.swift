import SwiftUI

struct WordsView: View {
    /*#-code-walkthrough(FunFactsView.funFacts)*/

    @State private var thaiWord = "タイ語"
    /*#-code-walkthrough(FunFactsView.funFacts)*/
    /*#-code-walkthrough(FunFactsView.stateVariable)*/
    @State private var enunciation = "発音"
    @State private var meaning = "日本語"
    /*#-code-walkthrough(FunFactsView.stateVariable)*/
    @State private var pronunciation = "読み方"

    var NounWords = NounList.list
    var VerbWords = VerbList.list
    var AdjectiveWords = AdjectiveList.list
    var randomWords = NounList.list + VerbList.list + AdjectiveList.list
    
    var body: some View {
        HStack {

            Spacer()
            VStack {
                Spacer()
                Text("ランダム単語")
                    .font(.subheadline)
                    .frame(minWidth: 50,maxWidth: 100, minHeight: 60)
                /*#-code-walkthrough(FunFactsView.textView)*/
                Button("更新/อัปเดต") {
                    let word:String = randomWords.randomElement() ?? "ไทย|thay|タイ|タイ"
                    let wordAry:Array = separateWords(listWord:word)
                    thaiWord = wordAry[0]
                    enunciation = wordAry[1]
                    pronunciation = wordAry[2]
                    meaning = wordAry[3]
                }
            }.padding(10)
            VStack {
                Spacer()
                VStack{
                    Text("タイ語/日本語")
                        .font(.subheadline)
                    .frame(minWidth: 200,maxWidth: .infinity , minHeight: 15,alignment: .leading)                    
                }
                VStack{
                    /*#-code-walkthrough(FunFactsView.textView)*/
                    Text(thaiWord + "/" + meaning)
                        .font(.body)
                        .frame(maxWidth: 300, minHeight: 15,alignment: .leading)
                    /*#-code-walkthrough(FunFactsView.textView)*/
                }
                VStack{
                    Text("ピン音/発音")
                        .font(.subheadline)
                        .frame(minWidth: 200,maxWidth: .infinity , minHeight: 15,alignment: .leading)
                }
                VStack{
                    /*#-code-walkthrough(FunFactsView.textView)*/
                    Text(enunciation + "/" + pronunciation)
                        .font(.body)
                        .frame(maxWidth: 300, minHeight: 30,alignment: .leading)
                }
            }.padding(10)
        }
        
    }

}

func separateWords (listWord: String)-> Array<String>{
    let wordAry:Array = listWord.components(separatedBy: "|")
    return wordAry
}


struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
