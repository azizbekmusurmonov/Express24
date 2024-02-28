//
//  OrdersViewModel.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 21/02/24.
//

import Combine
import Foundation

final class OrdersViewModel: ObservableObject {
    
    @Published var orders: [OrdersModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in  // (6) -> Operator
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                   fatalError("yaxshi kemadi")
                }
                return data
            }
            .decode(type: [OrdersModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { model in
                self.orders = model
            } .store(in: &self.cancellables)
    }
}
