import SwiftUI
import Combine
import WebKit

final class WebViewExampleViewModel: ObservableObject {

    var wkwebView: WKWebView? {
        didSet {
            self.wkwebView?.load(URLRequest(url: URL(string: "https://www.apple.com")!))
        }
    }

    init() {
        print("init WebviewVM")
    }

    deinit {
        print("deinit WebviewVM")
    }

}

struct WebViewExampleView: View {
    @ObservedObject var viewModel: WebViewExampleViewModel

    init(viewModel: WebViewExampleViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            BridgeWKWebView(wkWebView: BridgeWKWebView.defaultWkWebView(), eventAction: { event in
                if case .initialize(let wkwebView) = event {
                    self.viewModel.wkwebView = wkwebView
                }
            })
        }
    }
}


struct WebViewExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CheckLifecycleView(viewModel: CheckLifeCycleViewModel())
    }
}


