import SwiftUI

struct Calculator_KeyboardView: View {
    
    @ObservedObject var calc: Calc
    
    var body: some View {
        HStack {
            VStack {
                OtherOperatorButtons(calc: calc)
                Calculator_NumberPlateView(calc: calc)
                    .padding()
            }
            OperatorButtons(calc: calc)
        }
        .accentColor(.white)
        .font(.title)
    }
}


class Calc: ObservableObject {
    @Published var num1: Int = 0
    @Published var num2: Int = 0
    @Published var operatorType: OperatorType? = .no
    @Published var target = Target.no
}


enum Target {
    case num1
    case num2
    case no
}


struct OperatorButtons: View {
    
    @ObservedObject var calc: Calc
    
    var body: some View {
        VStack {
            RadiusButton(title: "÷", color: Color.orange) {
                calc.operatorType = .devide
            }
            .padding(3)
            RadiusButton(title: "×", color: Color.orange) {
                calc.operatorType = .multiple
            }
            .padding(3)
            RadiusButton(title: "ー", color: Color.orange) {
                calc.operatorType = .minus
            }
            .padding(3)
            RadiusButton(title: "＋", color: Color.orange) {
                calc.operatorType = .plus
            }
            .padding(3)
            RadiusButton(title: "＝", color: Color.orange) {
                calculate()
            }
            .padding(3)
        }
    }
    
    private func calculate() {
        switch calc.operatorType {
        case .plus:
            calc.num1 += calc.num2
            break
        case .minus:
            calc.num1 -= calc.num2
            break
        case .multiple:
            calc.num1 *= calc.num2
            break
        case .devide:
            calc.num1 /= calc.num2
            break
        case .no:
            break
        case .none:
            break
        }
    }
}

enum OperatorType {
    case plus
    case minus
    case multiple
    case devide
    case no
}

struct OtherOperatorButtons: View {
    
    @ObservedObject var calc: Calc
    
    var body: some View {
        HStack {
            RadiusButton(title: "CLEAR", width: 170, color: Color.black) {
                calc.num1 = 0
                calc.num2 = 0
                calc.operatorType = .no
            }
            
            RadiusButton(title: "◀︎", width: 80, color: Color.black) {
                if calc.target == .num1 {
                    calc.num1 /= 10
                } else {
                    calc.num2 /= 10
                }
            }
        }
    }
}
