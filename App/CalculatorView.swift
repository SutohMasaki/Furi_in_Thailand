import SwiftUI
import UIKit


struct CalculatorView: View {
    
    @ObservedObject var calc = Calc()
    @State var rate:String = ""
    @State var yen:String = ""
    @State var baht : Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack{
                    Text("両替レート").font(.headline)   
                    TextField("rate", text:$rate)
                        .border(Color.black, width: 1)
                        .multilineTextAlignment(TextAlignment.trailing)
                        .frame(minWidth: 0, idealWidth: 100, maxWidth:  100, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 50, alignment: .trailing)
                    Spacer()
                }
                HStack {
                    Text("円(JPY)").font(.headline)
                    TextField("yen", text:$yen)
                        .border(Color.black, width: 1)
                        .multilineTextAlignment(TextAlignment.trailing)
                        .frame(minWidth: 0, idealWidth: 100, maxWidth:  100, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 50, alignment: .trailing)
                    Spacer()
                }
            }
            VStack{
                VStack{
                    Button(action: {
                        guard let rate = Double(self.rate),
                              let yen = Double(self.yen) else {
                            print("Fail to Calc Rate")
                            return
                        }
                        baht = yen / rate
                    }) {
                        Text("Exchange").font(.title3)                        .border(Color.black, width: 1)

                    }
                }
                VStack {
                    Text("฿(THB) \(Double(baht))").font(.title)
                }
            }
        
            Spacer()
            Divider()
            Text(String(calc.num1))
                .font(.system(size: 70))
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 70, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .onTapGesture {
                    calc.target = .num1
                }
            Text(String(calc.num2))
                .font(.system(size: 70))
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 70, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .onTapGesture {
                    calc.target = .num2
                }
            Calculator_KeyboardView(calc: calc)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
