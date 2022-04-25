import SwiftUI

struct NextButton: View {
    @Binding var index: Int
    var body: some View {
        VStack {
            HStack {
                Button {
                    if index == 0 {
                        index = 0
                    }else {
                        index-=1
                    }
                    print(index)
                } label: {
                    Text("Back")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(Color.orange)
                .cornerRadius(20)
                .padding()
                Button {
                    if index == 5 {
                        index = 5
                    }else {
                        index+=1
                    }
                    print(index)
                } label: {
                    Text("Go")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}
