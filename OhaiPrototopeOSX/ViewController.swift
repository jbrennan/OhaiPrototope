//
//  ViewController.swift
//  OhaiPrototopeOSX
//
//  Created by Jason Brennan on 2015-07-12.
//  Copyright (c) 2015 Prototope Research Facility. All rights reserved.
//

import Cocoa
import PrototopeOSX

class ViewController: NSViewController {
	
	var environment: Environment!
	var layer: Layer!
	var protoroLayer: Layer!
	var heartbeat: Heartbeat!
	var scrollLayer: ScrollLayer!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
//		Speech.say("oh hi", rate: 200)
		self.view.wantsLayer = true
		afterDuration(1, action: { () -> Void in
			
			self.view.window?.acceptsMouseMovedEvents = true
		})
		self.environment = Environment.defaultEnvironmentWithRootView(self.view)
		Environment.currentEnvironment = self.environment
		
		Layer.root.backgroundColor = Color(hex: 0xFFF5D9)
		
		self.layer = Layer(parent: nil, name: "My layer", viewClass: nil)
		self.layer.size = Size(width: 200, height: 200)
		self.layer.backgroundColor = Color.purple
		self.layer.border = Border(color: Color.orange, width: 5)
		
		self.protoroLayer = Layer(parent: nil, imageName: "protoro-512")
		self.protoroLayer.position = Point(x: 300, y: 150)
		
//		self.protoroLayer.animators.position.target = Point(x: 100, y: 100)
		
//		Layer.root.mouseMovedHandler = { 
//			(event: InputEvent) in
//			self.protoroLayer.position = event.globalLocation
//		}
		
		
		self.scrollLayer = ScrollLayer()
		self.scrollLayer.backgroundColor = Color.brown
		self.scrollLayer.frame.size = Size(width: 300, height: 400)
		
		var layers = [Layer]()
		for index in 0..<5 {
			let layer = Layer(parent: self.scrollLayer, name: "layer", viewClass: nil)
			
			layer.size = Size(width: self.scrollLayer.width - 20, height: 100)
			layer.frame.origin = Point(x: 10.0, y: Double(index) * 140.0)
			layer.backgroundColor = Color(hex: 0x70B21A)
			layer.cornerRadius = Double(index * 2)
			layers.append(layer)
			
		}
		
		self.scrollLayer.updateScrollableSizeToFitSublayers()
		
		
//		self.heartbeat = Heartbeat() { _ in
//			println("buh?")
//		}
		

		


	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

