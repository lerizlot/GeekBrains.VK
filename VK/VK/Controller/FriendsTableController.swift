////
////  FriendsTableController.swift
////  VK
////
////  Created by Lera on 20.06.22.
////
//
//import UIKit
//
//class FriendsTableController: UITableViewController {
//    
//    // MARK: - Life cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//        
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//    
//    // MARK: - Table view data source
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return friends.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
//            
//            preconditionFailure("Error")
//        }
//        
//        // Configure the cell...
//        cell.friendName.text = friends[indexPath.row].name
//        cell.friendImage.image = friends[indexPath.row].image
//        
//        return cell
//    }
//    
//    // MARK: - Segue
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // добавить массив друзей и после этого настроить эту часть кода
//        if segue.identifier == "showPhoto",
//           let destinationVC = segue.destination as? PhotoViewController,
//           let indexPath = tableView.indexPathForSelectedRow {
//            // передаем на контроллер ад
//            destinationVC.photoAlbum = friends[indexPath.row].album
//            let friendName = friends[indexPath.row].name
//            
//            destinationVC.title = friendName
//        }
//    }
//    
//    /*
//     // Override to support conditional editing of the table view.
//     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//     // Return false if you do not want the specified item to be editable.
//     return true
//     }
//     */
//    
//    /*
//     // Override to support editing the table view.
//     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//     if editingStyle == .delete {
//     // Delete the row from the data source
//     tableView.deleteRows(at: [indexPath], with: .fade)
//     } else if editingStyle == .insert {
//     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//     }    
//     }
//     */
//    
//    /*
//     // Override to support rearranging the table view.
//     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//     
//     }
//     */
//    
//    /*
//     // Override to support conditional rearranging of the table view.
//     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//     // Return false if you do not want the item to be re-orderable.
//     return true
//     }
//     */
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
