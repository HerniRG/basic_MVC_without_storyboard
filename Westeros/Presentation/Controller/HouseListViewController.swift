//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Adrián Silva on 12/9/24.
//

import UIKit

final class HouseListViewController: UITableViewController {
    // MARK: - Table View DataSource
    typealias DataSource = UITableViewDiffableDataSource<Int, House>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, House>
    
    // MARK: - Model
    private let houses: [House] = House.allCases
    // Al declarar una variable como nula, el compilador
    // infiere que su valor inicial es `nil`
    private var dataSource: DataSource?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Registrar la celda custom
        // Registramos la celda que hemos creado de forma personalizada
        tableView.register(
            // Instanciamos el archivo .xib a traves de su numbre
            UINib(nibName: HouseTableViewCell.identifier, bundle: nil),
            // Cada vez que TableView se encuentre este identificador
            // tiene que instanciar el .xib que le especificamos
            forCellReuseIdentifier: HouseTableViewCell.identifier
        )
        
        // 2. Configurar el data source
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, house in
            // Obtenemos una celda reusable y la casteamos a
            // el tipo de celda que queremos representar
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HouseTableViewCell.identifier, 
                for: indexPath
            ) as? HouseTableViewCell else {
                // Si no podemos desempaquetarla
                // retornamos una celda en blanco
                return UITableViewCell()
            }
            cell.configure(with: house)
            return cell
        }
        
        // 3. Añadir el data source al table view
        tableView.dataSource = dataSource
        
        // 4. Crear un snapshot con los objetos a representar
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(houses)
        
        // 5. Aplicar el snapshot al data source para añadir los objetos
        dataSource?.apply(snapshot)
    }
}

extension HouseListViewController {
    override func tableView(
        _ tableView: UITableView, 
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
}
