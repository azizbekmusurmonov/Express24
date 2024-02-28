//
//  MyLocationViewModel.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 26/02/24.
//

import Foundation
import Combine

final class MyLocationViewModel: ObservableObject {
    
    @Published var location: [MyLocationModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchLocation()
    }
    
    func fetchLocation() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in  // (6) -> Operator
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                   fatalError("yaxshi kemadi")
                }
                return data
            }
            .decode(type: [MyLocationModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { model in
                self.location = model
            } .store(in: &self.cancellables)
    }
}
