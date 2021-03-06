//
//  MyGroupsTableController.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class MyGroupsTableController: UITableViewController {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: GroupXibCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: GroupXibCell.reuseIdentifier)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupXibCell.reuseIdentifier,
                                                       for: indexPath) as? GroupXibCell else {
            preconditionFailure("Error")
        }

        cell.groupName.text = groups[indexPath.row].name
        cell.groupImage.image = groups[indexPath.row].image
        
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showGroups",
           let destinationVC = segue.destination as? AllGroupsViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let groupName = groups[indexPath.row].name
            destinationVC.title = groupName
        }
    }
    // unwind segue метод-получатель
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        // получаем ссылку на контроллео, откуда осуществлен переход и индекс выделенной ячейки
        if let sourceVC = segue.source as? AllGroupsViewController,
           let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            // получаем группу по индексу
            let group = sourceVC.allGroups[indexPath.row]
            
            // проверка, если группы нет в списке - она добавляется
            if !groups.contains(where: {$0.name == group.name}) {
                groups.append(group)
                
                // обновляем таблицу
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Header
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если была нажата кнопка удалить, удаляем группу из массива
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            // и удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
