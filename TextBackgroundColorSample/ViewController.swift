//
//  ViewController.swift
//  TextBackgroundColorSample
//
//  Created by Naoki Muramoto on 2022/08/26.
//

import UIKit
import SwiftRichString

class ViewController: UIViewController {

    // MARK: - Properties
    private let mark = Style {
        $0.backColor = UIColor.yellow
    }

    private let labelList = ["hoge", "hoge", "huga", "hoge", "puga"]

    // MARK: - Outlet
    @IBOutlet private weak var sampleLabel: UILabel!

    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}

// MARK: - Configure
extension ViewController {
    private func configure() {
        configure(label: self)
    }

    private func configure(label vc: ViewController) {
        let myGroup = StyleXML(["mark": mark])
        let string = labelList.joined(separator: " ")
//        let markText = "huga"
        // TODO: この配列は、背景色をつける文字をmapの類で格納する
        let markTextList = ["huga", "puga"]
//        let newString = string.replacingOccurrences(of: markText, with: "<mark>\(markText)</mark>")
        // TODO: 配列に背景つける文字を格納してmapで以下を回すイメージ
        let latestString = markTextList.reduce(string) {
            $0.replacingOccurrences(of: $1, with: "<mark>\($1)</mark>")
        }
//        sampleLabel.attributedText = newString.set(style: myGroup)
        sampleLabel.attributedText = latestString.set(style: myGroup)
    }
}
