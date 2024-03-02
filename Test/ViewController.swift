//
//  ViewController.swift
//  Test
//
//  Created by yukifuruhashi on 2024/03/02.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var factTextView: NSTextView = {
        let textView = NSTextView(frame: .zero)
        textView.alignment = .center
        textView.drawsBackground = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(factTextView)
        
        factTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        factTextView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        factTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        factTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        Task {
            await loadFact()
        }
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 200))
    }
    
    private func loadFact() async {
        do {
            guard let title = try await Webservice().fetchRandomFact() else { return }
            factTextView.string = title.title
        } catch {
            print(error)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

