//
//  TableViewController.swift
//  Streaming Audio
//
//  Created by Nivardo Ibarra on 1/7/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit
import Parse
import AVFoundation
import AVKit

public var AudioPlayer = AVPlayer()
//var AudioPlayer = AVPlayer()
public var SelectedSongNumber = Int()

class TableViewController: UITableViewController, AVAudioPlayerDelegate {

    var idArray = [String]()
    var nameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ObjectIDQuery = PFQuery(className: "Songs")
        ObjectIDQuery.findObjectsInBackgroundWithBlock({
            (objectsArray: [PFObject]?, error: NSError?) -> Void in
            var objectsIDs = objectsArray! as [PFObject]
//            print("\(objectsIDs)")
            for i in 0..<objectsIDs.count{
                self.idArray.append(objectsIDs[i].valueForKey("objectId") as! String)
                self.nameArray.append(objectsIDs[i].valueForKey("SongName") as! String)
                self.tableView.reloadData()
            }
        })
    }

    func grabSong() {
        let SonQuery = PFQuery(className: "Songs")
        SonQuery.getObjectInBackgroundWithId(idArray[SelectedSongNumber], block: {
            (object: PFObject?, error:NSError?) -> Void in
            if let audioFIleTemp: PFFile = object?.valueForKey("SongFile") as? PFFile {
                AudioPlayer = AVPlayer(URL: NSURL(string: audioFIleTemp.url!)!)
                AudioPlayer.play()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return self.idArray.count
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return idArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = nameArray[indexPath.row]
        
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        SelectedSongNumber = indexPath.row
        grabSong()
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
