#if canImport(UIKit)

import UIKit
import ErrorKit

public final class CircleView<ContentView: UIView>: UIView {
    
    public let contentView: ContentView
    
    public override init(frame: CGRect) {
        self.contentView = ContentView(frame: frame)
        
        super.init(frame: frame)
        
        self.configureViewHierarchies()
        self.configureLayoutConstraints()
        self.configureView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        guard layer == self.layer else {
            return
        }
        
        layer.cornerRadius = min(layer.bounds.width, layer.bounds.height) / 2.0
    }
}

extension CircleView {
    
    private func configureViewHierarchies() {
        self.addSubview(self.contentView)
    }
    
    private func configureLayoutConstraints() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    private func configureView() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = .white
        }
        
        self.clipsToBounds = true
    }
}

#endif
