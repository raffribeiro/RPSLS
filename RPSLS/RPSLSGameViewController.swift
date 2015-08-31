//
//  RPSLSGameViewController.swift
//  RPSLS
//
//  Created by gustavo.freitas2 on 8/31/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import UIKit

class RPSLSGameViewController: UIViewController {

    struct Match {
        
        let player: RPSLS
        let cpu: RPSLS
        
        init(player: RPSLS, cpu: RPSLS){
            self.player = player
            self.cpu = cpu
        }
        
        var result : RPSLS? {
            if player == cpu {
                return nil
            }
            
            return player.defeats(cpu) ? player : cpu
        }
        
    }
    
    @IBOutlet weak var resultGame: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func rockSelected(sender: AnyObject) {
        makeGame(player: RPSLS.Rock)
    }
    @IBAction func paperSelected(sender: AnyObject) {
        makeGame(player: RPSLS.Paper)
    }
    @IBAction func scissorsSelected(sender: AnyObject) {
        makeGame(player: RPSLS.Scissors)
    }
    @IBAction func lizardSelected(sender: AnyObject) {
        makeGame(player: RPSLS.Lizard)
    }
    @IBAction func spockSelected(sender: AnyObject) {
        makeGame(player: RPSLS.Spock)
    }
    
    func makeGame(#player: RPSLS) {
        let cpu = RPSLS()
        
        let match: Match = Match(player: player, cpu: cpu)
        
        if let result = match.result {
            if result == player {
                resultGame.text = "You won! \(player.description) \(player.action(opponent: cpu)) \(cpu.description)"
            }else {
                resultGame.text = "You lose! \(cpu.description) \(cpu.action(opponent: player)) \(player.description)"
            }
        } else {
            resultGame.text = "tie!"
        }
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
