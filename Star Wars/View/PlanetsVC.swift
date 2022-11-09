//
//  CharactersVC.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import UIKit
import Lottie
import RxSwift

class PlanetsVC: UIViewController {
    
    @IBOutlet private var planetsTableView: UITableView!
    private let disposeBag = DisposeBag()
    
    private let viewModel = PlanetsVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Planets"
        triggerFetchPlanets()
    }
    
    private func triggerFetchPlanets() {
        ActivityIndicator.shared.show(in: view)
        viewModel.fetchPlanets()
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.planetsTableView.reloadData()
            }, onError: { error in
                ActivityIndicator.shared.hide()
                // Show alert
            }).disposed(by: disposeBag)
    }
    
    private func triggerFetchPlanets(for index: Int) {
        self.routeToPlanetDetails(for: index)
        
   
    }

    private func routeToPlanetDetails(for index: Int) {
        let model = viewModel.dataModel(for: index)
        guard let view = ViewFactory.createDetailView(for: model) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
}

extension PlanetsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? TableCell {
            cell.configurateTheCell(viewModel.planets![indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.planets != nil ? viewModel.planets!.count : 0
    }
}

extension PlanetsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        triggerFetchPlanets(for: indexPath.row)
    }
}
