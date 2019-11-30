import SwiftUI
import WebKit

struct BridgeWKWebView: UIViewRepresentable {
    var wkWebView: WKWebView
    var eventAction: (WkWebViewEvent) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self, eventAction)
    }

    func makeUIView(context: Context) -> WKWebView {
        wkWebView.navigationDelegate = context.coordinator
        wkWebView.uiDelegate = context.coordinator
        return wkWebView
    }

    // ページの読み込みはwkWebViewを直接触って行う
    func updateUIView(_ uiView: WKWebView, context _: Context) {}

    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var bridgeWkWebView: BridgeWKWebView
        var eventAction: (WkWebViewEvent) -> Void

        init(_ bridgeWkWebView: BridgeWKWebView, _ eventAction: @escaping (WkWebViewEvent) -> Void) {
            self.bridgeWkWebView = bridgeWkWebView
            self.eventAction = eventAction
            eventAction(.initialize(bridgeWkWebView.wkWebView))
        }

        func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
            eventAction(.didStartProvisionalNavigation)
        }

        func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
            eventAction(.didFinish)
        }

        func webView(_: WKWebView, didFail _: WKNavigation!, withError error: Error) {
            eventAction(.didFailProvisionalNavigation(error))
        }

        func webView(_: WKWebView, didFailProvisionalNavigation _: WKNavigation!, withError error: Error) {
            eventAction(.didFailProvisionalNavigation(error))
        }

        func webViewWebContentProcessDidTerminate(_: WKWebView) {
            eventAction(.webContentProcessDidTerminate)
        }
    }

    static func defaultWkWebView() -> WKWebView {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        return WKWebView(frame: CGRect.zero, configuration: config)
    }
}

enum WkWebViewEvent: Equatable {
    case initialize(WKWebView)
    case didStartProvisionalNavigation
    case didFinish
    case didFail(Error)
    case didFailProvisionalNavigation(Error)
    case webContentProcessDidTerminate
    case unknown

    static func == (lhs: WkWebViewEvent, rhs: WkWebViewEvent) -> Bool {
        switch (lhs, rhs) {
        case (.initialize, .initialize):
            return true
        case (.didStartProvisionalNavigation, .didStartProvisionalNavigation):
            return true
        case (didFinish, .didFinish):
            return true
        case (.didFail, .didFail):
            return true
        case (.didFailProvisionalNavigation, .didFailProvisionalNavigation):
            return true
        case (.webContentProcessDidTerminate, .webContentProcessDidTerminate):
            return true
        default:
            return false
        }
    }
}
