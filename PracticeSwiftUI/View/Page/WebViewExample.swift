import SwiftUI
import Combine
import WebKit

final class OAuthHandler {
    static let shared = OAuthHandler()
    weak var handlerWebView: WKWebView?
}

final class WebViewExampleViewModel: ObservableObject {
    private let oauthHandler = OAuthHandler.shared

    var wkwebView: WKWebView? {
        didSet {
            self.oauthHandler.handlerWebView = self.wkwebView
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


