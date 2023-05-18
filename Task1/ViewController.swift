import UIKit

final class ViewController: UIViewController {
    lazy var animator = UIDynamicAnimator(referenceView: view)
    private lazy var snap: UISnapBehavior = .init(item: squareView, snapTo: view.center)
    
    lazy var squareView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3.0
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(squareView)
        animator.addBehavior(snap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        snap.snapPoint = touches.first!.location(in: view)
    }
}
