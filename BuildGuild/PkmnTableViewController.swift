//
//  PkmnTableViewController.swift
//  BuildGuild
//
//  Created by Nick Krogstad on 10/19/16.
//  Copyright © 2016 BuildGuild. All rights reserved.
//

import UIKit
import PokemonKit

class PkmnTableViewController: UITableViewController {
    var pkmns = [Pkmn]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSamplePkmn()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pkmns.count
    }
    
    func loadSamplePkmn() {
        PokemonKit.fetchPokemon("608")
            .then { pokemonInfo in
                let pkmnName = pokemonInfo.name!.capitalizedString
                let pkmnSpriteURL = pokemonInfo.sprites?.frontShiny
                var pkmnSprite = UIImage()
                var pkmn1 = Pkmn(name: pkmnName, sprite: pkmnSprite)
                
                if let url = NSURL(string: pkmnSpriteURL!) {
                    if let data = NSData(contentsOfURL: url) {
                        pkmnSprite = UIImage(data: data)!
                        pkmn1 = Pkmn(name: pkmnName, sprite: pkmnSprite)
                    }
                }
    
                self.pkmns += [pkmn1!]
                self.tableView?.reloadData()
                
            }.onError {error in
                print(error)
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PkmnTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PkmnTableViewCell
        
        let currentPkmn = self.pkmns[indexPath.row]
        
        cell.pkmnName.text = currentPkmn.name
        cell.pkmnSprite.image = currentPkmn.sprite

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
