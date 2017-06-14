//
//  DataCenter.swift
//  Practice0614_DiaryUsingEnum
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

/*
 1월 January 31
 2월 Febuary 28
 3월 March 31
 4월 April 30
 5월 May 31
 6월 June 30
 7월 July 31
 8월 August 31
 9월 September 30
 10월 October 31
 11월 November 30
 12월 December 31
 */

enum Month:String {
    case January, Febuary, March, April, May, June, July, August, September, October, November, December, error
    
}

class DataCenter {
    
    func findMonth(of num:Int) -> Month {
        switch num {
        case 1:
            return Month.January
        case 2:
            return Month.Febuary
        case 3:
            return Month.March
        case 4:
            return Month.April
        case 5:
            return Month.May
        case 6:
            return Month.June
        case 7:
            return Month.July
        case 8:
            return Month.August
        case 9:
            return Month.September
        case 10:
            return Month.October
        case 11:
            return Month.November
        case 12:
            return Month.December
        default:
            return Month.error
        }
    }
    
    func findDate(of month:Month) -> Int {
        switch month {
        case .January:
            return 31
        case .Febuary:
            return 28
        case .March:
            return 31
        case .April:
            return 30
        case .May:
            return 31
        case .June:
            return 30
        case .July:
            return 31
        case .August:
            return 31
        case .September:
            return 30
        case .October:
            return 31
        case .November:
            return 30
        case .December:
            return 31
        case .error:
            return 0
        }
    }

    
    
}
