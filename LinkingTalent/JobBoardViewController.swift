//
//  JobBoardViewController.swift
//  LinkingTalent
//
//  Created by Matthew Falzon on 2017-06-25.
//  Copyright © 2017 Matthew Falzon. All rights reserved.
//

import UIKit
import Firebase

class JobBoardViewController: UITableViewController {

    var jobs = [Job]()
    var cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(handleLogout))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        Database.database().reference().child("test").child("test2").observeSingleEvent(of: .value, with: { (snap) in
            //print(snap)
        }, withCancel: nil)*/
        checkIfUserIsLoggedIn()
        getJobs()
    }
    
    
    func getJobs() {
        Database.database().reference().child("job").observe(.childAdded, with: { (snap) in
            //print(snap)
            
            if let dictionary = snap.value as? [String: AnyObject] {
                //print("GOT A JOB")
                let job = Job(dictionary: dictionary)
                //job.setValuesForKeys(dictionary)
                //print(job.value(forKey: "bounty")! as! String)
                self.jobs.append(job)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                }
            )}
        }, withCancel: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jobs.count
    }
    
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            
        }
    }
    
    func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let job = jobs[indexPath.row]
        cell.textLabel?.text = job.value(forKey: "title") as! String
        cell.detailTextLabel?.text = job.value(forKey: "location") as! String
        //cell.textLabel?.text = "Dummy Data"
        
        return cell
    }

    //row on click listener
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let job = jobs[indexPath.row]
        print(job.value(forKey: "title") as! String)
        //var bundle : Bundle?
/*
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "JobViewController") as! JobViewController
        navigationController?.pushViewController(destination, animated: true)
 */
        let title = job.title as String!
        performSegue(withIdentifier: "segue", sender: job)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let jobViewController = segue.destination as! JobViewController
        jobViewController.job = sender as! Job
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
