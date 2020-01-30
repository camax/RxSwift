//
//  WKWebView+RxTests.swift
//  Tests
//
//  Created by Andrew Breckenridge on 8/30/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)
    
import UIKit
import RxSwift
import RxCocoa
import RxBlocking
import XCTest

final class WKWebViewTests: RxTest {}

fileprivate let testHTMLString = "<html><head></head><body><h1>🔥</h1></body></html>"
    
extension WKWebViewTests {
        
    func testDidStartLoad() {
        let webView = WKWebView()
        var didStartLoad = false

        let subscription = webView.rx.didStartLoad.subscribe(onNext: { _ in
            didStartLoad = true
        })

        webView.delegate!.webViewDidStartLoad!(webView)

        XCTAssertTrue(didStartLoad)
        subscription.dispose()
    }
    
    func testDidFinishLoad() {
        let webView = WKWebView()
        var didFinishLoad = false

        let subscription = webView.rx.didFinishLoad.subscribe(onNext: { _ in
            didFinishLoad = true
        })

        webView.delegate!.webViewDidFinishLoad!(webView)

        XCTAssertTrue(didFinishLoad)
        subscription.dispose()
    }

    func testDidFailLoad() {
        let webView = WKWebView()
        var didFailLoad = false

        let subscription = webView.rx.didFailLoad.subscribe { _ in
            didFailLoad = true
        }

        webView.delegate!.webView!(webView, didFailLoadWithError: NSError(domain: "", code: 0, userInfo: .none))

        XCTAssertTrue(didFailLoad)
        subscription.dispose()
    }

}

#endif
