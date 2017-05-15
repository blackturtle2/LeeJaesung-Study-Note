//: Playground - noun: a place where people can play

import UIKit

//1. inch to cm, cm to inch (2개)
func inchTocm(inch num:Double) -> Double{
    return (num*2.54)
}
func cmToinch(cm num:Double) -> Double{
    return (num/2.54)
}
print(inchTocm(inch: 1))
print(cmToinch(cm: 1))



//2. m2 to 평, 평 to  m2 (2개)
func m2ToPyeong(meter num:Double) -> Double{
    return (num*0.3025)
}
func pyeongTom2(pyeong num:Double) -> Double{
    return (num*3.30579)
}
print(m2ToPyeong(meter: 1))
print(pyeongTom2(pyeong: 1))



//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
func fahrenheitToCelsius(fa num:Double) -> Double{
    return ((num*1.8)+32)
}
func celsiusToFahrenheit(ce num:Double) -> Double{
    return ((num-32)/1.8)
}
print(fahrenheitToCelsius(fa: 1))
print(celsiusToFahrenheit(ce: 1))



//4. 데이터량 (KB to MB, MB to GB) (2개)
func makeMbOf(kb num:Double) -> Double{
    return num*0.001
}
func makeGbOf(mb num:Double) -> Double{
    return num*0.001
}
print(makeMbOf(kb: 2000))
print(makeGbOf(mb: 1000))



//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 11320 >> 4400초
func makeSecondOf(hhmmss num:Int) -> Double{
    var result:Double = 0
    let vHH:Int = num/10000*60*60
    let vMM:Int = (num%10000)/100*60
    let vSS:Double = Double(num).truncatingRemainder(dividingBy: 100)
    
    result = Double(vHH + vMM) + vSS
    
    return result
}
print(makeSecondOf(hhmmss: 11320)) // = 4400
