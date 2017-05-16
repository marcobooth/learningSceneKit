//
//  GameViewController.swift
//  learningSceneKit
//
//  Created by Marco BOOTH on 5/15/17.
//  Copyright © 2017 Marco BOOTH. All rights reserved.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    let circlePoints = [
        (Float(0.579), Float(1.363), Float(-3.213)),
        (Float(0.484), Float(-0.006), Float(-3.053)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScene()
        setupCamera()
        spawnLine()
        spawnCircle1()
        spawnCircle2()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        self.scnView = self.view as! SCNView
        self.scnView.showsStatistics = true
        self.scnView.allowsCameraControl = true
        self.scnView.autoenablesDefaultLighting = true
    }
    
    func setupScene() {
        self.scnScene = SCNScene()
        self.scnView.scene = self.scnScene
        self.scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    
    func setupCamera() {
        self.cameraNode = SCNNode()
        self.cameraNode.camera = SCNCamera()
        self.cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        self.scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func between(_ first: Float, _ second: Float) -> Float {
        return (second + first) / 2
    }
    
    func spawnLine() {
        var geometry: SCNGeometry
        
        geometry = SCNCylinder(radius: 0.02, height: 5.0)
        geometry.firstMaterial?.diffuse.contents = UIColor(red: 30.0 / 255.0, green: 150.0 / 255.0, blue: 30.0 / 255.0, alpha: 1)
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.position = SCNVector3(x: between(circlePoints[0].0, circlePoints[1].0), y: between(circlePoints[0].1, circlePoints[1].1), z: between(circlePoints[0].2, circlePoints[1].2))
        geometryNode.eulerAngles = SCNVector3(x: 1, y: 1, z: 1)
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
    func spawnCircle1() {
        var geometry: SCNGeometry
        geometry = SCNSphere(radius: 0.05)
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.position = SCNVector3(x: circlePoints[0].0, y: circlePoints[0].1, z: circlePoints[0].2)
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
    func spawnCircle2() {
        var geometry: SCNGeometry
        geometry = SCNSphere(radius: 0.05)
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.position = SCNVector3(x: circlePoints[1].0, y: circlePoints[1].1, z: circlePoints[1].2)
        scnScene.rootNode.addChildNode(geometryNode)
    }

//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }
}
