import Foundation

public struct BaseParam: Codable {
    public let value: Int
    public let sheet: String
    public let row_id: Int
    public let fields: BaseParamFields
    
    
    public struct BaseParamFields: Codable {
        public let BraceletPercent: Int
        public let ChestHeadLegsFeetPercent: Int
        public let ChestHeadPercent: Int
        public let ChestLegsFeetPercent: Int
        public let ChestLegsGlovesPercent: Int
        public let ChestPercent: Int
        public let Description: String
        public let EarringPercent: Int
        public let FeetPercent: Int
        public let HandsPercent: Int
        public let HeadChestHandsLegsFeetPercent: Int
        public let HeadPercent: Int
        public let LegsFeetPercent: Int
        public let MeldParam: [Int]
        public let Name: String
        public let NecklacePercent: Int
        public let OffHandPercent: Int
        public let OneHandWeaponPercent: Int
        public let OrderPriority: Int
        public let PacketIndex: Int
        public let RingPercent: Int
        public let TwoHandWeaponPercent: Int
        public let UnderArmorPercent: Int
        //        public let Unknown0: Int
        //        public let Unknown1: Int
        //        public let Unknown2: Bool
        public let WaistPercent: Int
    }
}
