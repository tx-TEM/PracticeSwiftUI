import SwiftUI
import Combine

final class CheckLifeCycleViewModel: ObservableObject {
    @Published var array = [String]()
    @Published var name = ""

    func appendArray() {
        self.array.append("\(array.count)")

    }

    func updateArray() {
        self.array = []
    }
}

struct CheckLifecycleView: View {
    @ObservedObject var viewModel: CheckLifeCycleViewModel
    @State var subViewName = "SubView"
    @State var subViewName2 = "SubView2"
    @State var subscriptions = Set<AnyCancellable>()

    init(viewModel: CheckLifeCycleViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            // ここを消したら通知が飛ばなくなる
            Text(self.viewModel.array.first ?? "Empty")

            ScrollView {
                ForEach(self.viewModel.array, id: \.self) { name in
                    Text(name)
                }
            }

            CheckLifeCycleTextView(name: self.subViewName)
            CheckLifeCycleTextView(name: self.subViewName2)

            Button(action: {
                print("- append VM")
                self.viewModel.appendArray()
            }, label: {
                Text("append Array VM")
            })

            Button(action: {
                print("- update VM")
                self.viewModel.updateArray()
            }, label: {
                Text("update Array VM")
            })

            Button(action: {
                print("- update SubView")
                self.subViewName +=  "!"
            }, label: {
                Text("update SubView")
            })

            Button(action: {
                print("- update SubView2")
                self.subViewName2 +=  "!"
            }, label: {
                Text("update SubView2")
            })

            Spacer()
        }.onAppear {
            print("画面表示")
            print("---------")
        }
    }
}

struct CheckLifeCycleTextView: View {
    var name: String

    init(name: String) {
        self.name = name
        print("init \(name)")
    }

    var body: some View {
        Text(name)
    }
}

struct CheckLifecycleView_Previews: PreviewProvider {
    static var previews: some View {
        CheckLifecycleView(viewModel: CheckLifeCycleViewModel())
    }
}


