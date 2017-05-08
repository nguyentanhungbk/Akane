//
// This file is part of Akane
//
// Created by JC on 15/12/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

/**
Default implementation of `ComponentController`. You need to extend from this 
class rather than from `UIViewController` to make binding binding your component
view and your view model work.
*/
open class ComponentViewController : UIViewController, ComponentController {
    open var viewModel: ComponentViewModel! {
        didSet { self.didSetViewModel() }
    }

    open var componentView: ComponentView? {
        get { return self.isViewLoaded ? self.view as? ComponentView : nil }
    }

    open override func viewDidLoad() {
        self.makeBindings()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.mount()
    }

    func didSetViewModel() {
        self.viewModel.router = self as? ComponentRouter
        self.didLoadComponent()
        self.makeBindings()
    }

    open func didLoadComponent() {
    }
}


        }
    }


