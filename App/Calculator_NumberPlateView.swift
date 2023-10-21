import SwiftUI

struct Calculator_NumberPlateView: View {
    
    @ObservedObject var calc: Calc
    
    var body: some View {
        VStack {
            HStack {
                RadiusButton(title: "7", handler: {
                    insertionNumber(num: 7)
                })
                RadiusButton(title: "8", handler: {
                    insertionNumber(num: 8)
                })
                RadiusButton(title: "9", handler: {
                    insertionNumber(num: 9)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
            
            HStack {
                RadiusButton(title: "4", handler: {
                    insertionNumber(num: 4)
                })
                RadiusButton(title: "5", handler: {
                    insertionNumber(num: 5)
                })
                RadiusButton(title: "6", handler: {
                    insertionNumber(num: 6)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
            
            HStack {
                RadiusButton(title: "1", handler: {
                    insertionNumber(num: 1)
                })
                RadiusButton(title: "2", handler: {
                    insertionNumber(num: 2)
                })
                RadiusButton(title: "3", handler: {
                    insertionNumber(num: 3)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
            
            HStack {
                RadiusButton(title: "0", width: 260, handler: {
                    insertionNumber(num: 0)
                    print(calc.num1)
                    print(calc.num2)
                })
            }
        }
    }
    
    private func insertionNumber(num: Int) {
        if calc.operatorType == .no || calc.target == .num1 {
            calc.num1 = calc.num1 * 10 + num
        } else if calc.operatorType != .no || calc.target == .num2 {
            calc.num2 = calc.num2 * 10 + num
        }
    }
}

struct RadiusButton: View {
    var title: String
    var width: CGFloat?
    var color: Color?
    var handler: () -> Void
    
    var body: some View {
        Button(title) {
            self.handler()
        }
        .frame(width: width ?? 70.0, height: 70.0)
        .background(color ?? Color.init(.systemGray2))
        .cornerRadius(40)
    }
}
