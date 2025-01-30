//
//  ContentView.swift
//  calc
//
//  Created by Ming Xia on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["AC","Back","/","X"],
        ["7","8","9","-"],
        ["4","5","6","+"],
        ["1","2","3","="],
        ["0","."]
    ]
        
    @State var numScreen = ""
    @State var calResult = ""
    @State var count = 0
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            VStack(){
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    Text(numScreen).foregroundColor(.white)
                        .font(.system(size: 50))
                }.padding()
                    .foregroundColor(.yellow)
                
                ForEach(buttons, id: \.self){ row in
                    HStack{
                        ForEach(row, id: \.self){ button in
                            
                            Button(action: {
                                self.operWorking(item: button)
                            }){
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(items: button),
                                       height: self.buttonHeight(items: button))
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(35)
                            }
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(items: String) -> CGFloat{
        if (items == "0"){
            return (UIScreen.main.bounds.width - (5*12)) * 0.8
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    
    func buttonHeight(items: String) -> CGFloat{

        return (UIScreen.main.bounds.width - (5*12)) / 4
        
    }
    
    func operWorking(item: String){
        
        if (item == "+" || item == "-" || item == "X" || item == "/"){
            count += 1
        }
        
        if (count > 1){
            calResult = Calculator(num: numScreen)
            numScreen = calResult
            calResult = ""
            count = 1
        }
        
        switch (item){
        case "AC":
            numScreen = ""
            count = 0
            break
        case "Back":
            numScreen = String(numScreen.dropLast())
            break
        case "=":
            calResult = Calculator(num: numScreen)
            numScreen = calResult
            count = 1
            break
        case "+", "-", "X", "/":
            if(numScreen != ""){
                numScreen += item
            }else{
                numScreen = ""
            }
            break
        default:
            if (numScreen != "0"){
                if (calResult != ""){
                    numScreen = ""
                    calResult = ""
                }
                numScreen += item
            }else{
                numScreen = ""
                numScreen += item
            }
        }
        
    }
    
    func Calculator(num: String) -> String {
        
        if (num.contains("+")){
            let newArray = num.split(separator: "+")
            if (newArray.count == 2){
                let ele0 = Double(newArray[0]) ?? 0
                let ele1 = Double(newArray[1]) ?? 0
                return String(format: "%.2f", ele0 + ele1)
            }else{
                return "ERROR"
            }
        }else if (num.contains("-")){
            let newArray = num.split(separator: "-")
            if (newArray.count == 2){
                let ele0 = Double(newArray[0]) ?? 0
                let ele1 = Double(newArray[1]) ?? 0
                return String(format: "%.2f", ele0 - ele1)
            }else{
                return "ERROR"
            }
        }else if (num.contains("X")){
            let newArray = num.split(separator: "X")
            if (newArray.count == 2){
                let ele0 = Double(newArray[0]) ?? 0
                let ele1 = Double(newArray[1]) ?? 0
                return String(format: "%.2f", ele0 * ele1)
            }else{
                return "ERROR"
            }
        }else if (num.contains("/")){
            let newArray = num.split(separator: "/")
            if (newArray.count == 2){
                let ele0 = Double(newArray[0]) ?? 0
                let ele1 = Double(newArray[1]) ?? 0
                return String(format: "%.2f", ele0 / ele1)
            }else{
                return "ERROR"
            }
        }else{
            return num
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
