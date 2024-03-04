//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelInformationPersistence {
    
    func save(parcelInformation: ParcelInformation)
}

struct DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelOrderProcessor {
    
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessorImpl: ParcelOrderProcessor {
    
    private let databaseParcelInformationPersistence: ParcelInformationPersistence
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
}

extension ParcelOrderProcessorImpl {
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
