//
//  ViewController.m
//  12_9Map
//
//  Created by wordoor－z on 15/12/9.
//  Copyright © 2015年 wzx. All rights reserved.
//

#import "ViewController.h"
#define WchamferRadius 5
@interface ViewController ()
@property (weak, nonatomic) IBOutlet SCNView *scnView;

@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _scnView.autoenablesDefaultLighting = YES;
    _scnView.allowsCameraControl = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _scnView.backgroundColor = [UIColor blackColor];
     SCNScene * scene = [[SCNScene alloc]init];
    _scnView.scene = scene;
    
    SCNSphere * boxGeometry = [SCNSphere sphereWithRadius:WchamferRadius];
    SCNNode * boxNode = [SCNNode nodeWithGeometry:boxGeometry];
    [scene.rootNode addChildNode:boxNode];
    
    SCNSphere * smallBox =[SCNSphere sphereWithRadius:1];
    smallBox.firstMaterial.diffuse.contents = [UIColor redColor];
    SCNNode * cone = [SCNNode nodeWithGeometry:smallBox];
    //颜色
//    carbonAtom.firstMaterial!.diffuse.contents = UIColor.darkGrayColor()
    //透视颜色
//    carbonAtom.firstMaterial!.specular.contents = UIColor.whiteColor()
    cone.position = SCNVector3Make(0, 0, 5);
    [boxNode addChildNode:cone];
    
    SCNSphere * smallBox2 =[SCNSphere sphereWithRadius:1];
    smallBox2.firstMaterial.diffuse.contents = [UIColor blackColor];
    SCNNode * cone2 = [SCNNode nodeWithGeometry:smallBox2];
    cone2.position = SCNVector3Make(-1.5,2, 4);
    [boxNode addChildNode:cone2];
    
    SCNSphere * smallBox3 =[SCNSphere sphereWithRadius:1];
    smallBox3.firstMaterial.diffuse.contents = [UIColor blackColor];
    SCNNode * cone3 = [SCNNode nodeWithGeometry:smallBox3];
    cone3.position = SCNVector3Make(1.5,2, 4);
    [boxNode addChildNode:cone3];
    //灯光
    SCNNode * ambientLightNode = [[SCNNode alloc]init];
    ambientLightNode.light = [[SCNLight alloc]init];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor colorWithWhite:0.1 alpha:1];
    [scene.rootNode addChildNode:ambientLightNode];
    SCNNode * omniLightNode = [[SCNNode alloc]init];
    omniLightNode.light = [[SCNLight alloc]init];
    omniLightNode.light.type = SCNLightTypeOmni;
    omniLightNode.light.color = [UIColor colorWithWhite:0.75 alpha:1];
    omniLightNode.position = SCNVector3Make(0, 50, 50);
    [scene.rootNode addChildNode:omniLightNode];
    
    //摄像机
    SCNNode * cameraNode = [[SCNNode alloc]init];
    cameraNode.camera = [[SCNCamera alloc]init];
    cameraNode.position = SCNVector3Make(0, 0, 25);
    [scene.rootNode addChildNode:cameraNode];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
