//
//  RPSLSViewController.swift
//  RPSLS
//
//  Created by gustavo.freitas2 on 8/28/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import UIKit

class RPSLSViewController: UIViewController, UIPageViewControllerDataSource {
    
    
    var pageViewController: UIPageViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createPageViewController()

    }

    
    
    func createPageViewController() {
        
        self.pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController?.dataSource = self
        
        let firstController = getItemController(0)
        self.pageViewController.setViewControllers([firstController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.width, self.view.frame.size.height - 180)

        addChildViewController(pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
    }
    
    
    func getItemController(index: Int) -> RPSLSPageItemViewController {
        
        if(index < 3) {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! RPSLSPageItemViewController
            var itens: [RPSLSPageItemViewController.Line] = []
            
            switch(index){
                
            case 0:
                var line: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "scissors")!, text: "cut", rightImage: UIImage(named: "paper")!)
                var line2: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "paper")!, text: "couvers", rightImage: UIImage(named: "rock")!)
                var line3: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "rock")!, text: "crushes", rightImage: UIImage(named: "lizard")!)
                var line4: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "lizard")!, text: "poison", rightImage: UIImage(named: "Spock")!)
                
                itens = [line, line2, line3, line4]
                
            case 1:
                var line: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "Spock")!, text: "smashes", rightImage: UIImage(named: "scissors")!)
                var line2: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "scissors")!, text: "decapitates", rightImage: UIImage(named: "lizard")!)
                var line3: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "lizard")!, text: "eat", rightImage: UIImage(named: "paper")!)
                var line4: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "paper")!, text: "disproofs", rightImage: UIImage(named: "Spock")!)
                
                itens = [line, line2, line3, line4]
                
            case 2:
                var line: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "Spock")!, text: "vaporizes", rightImage: UIImage(named: "rock")!)
                var line2: RPSLSPageItemViewController.Line = RPSLSPageItemViewController.Line(leftImage: UIImage(named: "rock")!, text: "chushes", rightImage: UIImage(named: "scissors")!)
                
                itens = [line, line2]
                
            default:
                println("#ERROR")

            }

            pageItemController.lines = itens
            pageItemController.index = index
            
            return pageItemController
        }
        
        
        return RPSLSPageItemViewController()
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! RPSLSPageItemViewController
        
        if itemController.index > 0 {
            return getItemController(itemController.index-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! RPSLSPageItemViewController
        
        if itemController.index+1 < 3 {
            return getItemController(itemController.index+1)
        }
        
        return nil

        
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
