//
//  XibView.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 09/04/21.
//

import UIKit

///
/// This class contains all boiler plate code used to load an UIView from a Xib file and
/// use and outlet to the Content View.
///
open class XibView: UIView {

	// MARK: - Outlets

	@IBOutlet weak private(set) public var contentView: UIView!

	// MARK: - Initialization

	///
	/// Initializes the view with using `UIScreen.main.bounds` as frame.
	///
	public required init() {
		super.init(frame: UIScreen.main.bounds)
		commonInit()
	}

	///
	/// Initializes the view with using the given `frame`.
	/// - Parameter frame: Initial view dimensions.
	///
	override public init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	///
	/// Initializes the view with using the given `coder`.
	/// - Parameter aDecoder: NSCoder to be used.
	///
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	private func commonInit() {
		let bundle = Bundle(for: type(of: self))
		let className = String(describing: type(of: self))
		bundle.loadNibNamed(className, owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		setupView()
	}

	///
	/// Override this method in order to provide aditional view setup.
	/// This method will be called after the initialization.
	///
	open func setupView() {}

}
