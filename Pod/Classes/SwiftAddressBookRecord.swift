//
//  SwiftAddressBookRecord.swift
//  Pods
//
//  Created by Socialbit - Tassilo Karge on 09.03.15.
//
//

import Foundation
import AddressBook

@available(iOS, deprecated: 9.0)

//MARK: Wrapper for ABAddressBookRecord

open class SwiftAddressBookRecord {

	open var internalRecord : ABRecord!

	public convenience init?(record : ABRecord?) {
		if let rec = record {
			self.init(record: rec)
		}
		else {
			return nil
		}
	}

	public init(record : ABRecord) {
		self.internalRecord = record
	}

	open var recordID: Int {
		return Int(ABRecordGetRecordID(self.internalRecord))
	}

	open var recordType: SwiftAddressBookRecordType {
		return SwiftAddressBookRecordType(abRecordType: ABRecordGetRecordType(self.internalRecord))
	}
}

extension SwiftAddressBookRecord: Hashable {

	public var hashValue: Int {
		return recordID.hashValue
	}

}

public func == (lhs: SwiftAddressBookRecord, rhs: SwiftAddressBookRecord) -> Bool {
	return lhs.recordID == rhs.recordID
}
