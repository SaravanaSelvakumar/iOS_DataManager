//
//  Endpoint.swift
//  MyCliniQ
//
//  Created by GuruApzzo on 06/09/23.
//

enum EndPoint: String {
    case sendOTP = "v1/auth/send-otp"
    case refreshToken = "v1/auth/refresh-token"
    case verifyOtp =  "v1/auth/verify-otp"
    case createProperty =  "v1/property/create"
    case doctors = "doctors"
    case offers = "offers"
    case fetchFavorite = "favourites"
    case language = "doctors/get-filters"
    case favorite = "favourites/create"
    case appointment = "bookings/create"
    case fetchAppointment = "bookings/customer-appointments"
    case fetchAppointmetDetails = "bookings/get-customer-appointment"
    case razorpay = "razorpay/getPaymentOrderId"
    case createMedicine = "medicines/create"
    case medicines = "medicines"
    case update_remainder = "medicines/update-reminder"
    case delete_remainder = "medicines/delete-one-reminder"
    
    /*================================================================================================================*/
    
    case feedback = "feedbacks/create"
    case review = "reviews/create"
    case fetchReview = "reviews/"
}
