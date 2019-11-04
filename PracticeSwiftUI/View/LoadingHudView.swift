import SwiftUI

struct LoadingHudView: View {
    @State var isLoading = false

    var body: some View {
        VStack(alignment: .center) {
            SimpleLargeButton()
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

//struct LoadingHudView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingHud()
//    }
//}

struct LoadingHud: View {
    @Binding var isLoading: Bool

    init(isLoading: Binding<Bool>) {
        _isLoading = isLoading
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}
