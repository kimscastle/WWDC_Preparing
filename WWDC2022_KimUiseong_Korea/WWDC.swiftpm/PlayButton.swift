import SwiftUI

struct PlayButton: View {
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
                .frame(width: 100, height: 100, alignment: .center)
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
                    Text("Play")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 300, height: 100, alignment: .center)
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}
