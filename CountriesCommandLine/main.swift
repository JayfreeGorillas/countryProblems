//
//  main.swift
//  CountriesCommandLine
//
//  Created by Josfry Barillas on 6/3/22.
//

import Foundation

print("Hello, World!")




let allCountriesString =
"""
Afghanistan
Albania
Algeria
Andorra
Angola
Antigua and Barbuda
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bhutan
Bolivia
Bosnia and Herzegovina
Botswana
Brazil
Brunei
Bulgaria
Burkina Faso
Burundi
Cabo Verde
Cambodia
Cameroon
Canada
Central African Republic
Chad
Chile
China
Colombia
Comoros
Congo
Costa Rica
Côte d’Ivoire
Croatia
Cuba
Cyprus
Czech Republic
Democratic People’s Republic of Korea
Democratic Republic of the Congo
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Eswatini
Ethiopia
Fiji
Finland
France
Gabon
Gambia
Georgia
Germany
Ghana
Greece
Grenada
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
Iran (Islamic Republic of)
Iraq
Ireland
Israel
Italy
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Kuwait
Kyrgyzstan
Lao People’s Democratic Republic
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall Islands
Mauritania
Mauritius
Mexico
Micronesia (Federated States of)
Monaco
Mongolia
Montenegro
Morocco
Mozambique
Myanmar
Namibia
Nauru
Nepal
Netherlands
New Zealand
Nicaragua
Niger
Nigeria
North Macedonia
Norway
Oman
Pakistan
Palau
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Qatar
Republic of Korea
Republic of Moldova
Romania
Russian Federation
Rwanda
Samoa
San Marino
São Tomé and Príncipe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovakia
Slovenia
Solomon Islands
Somalia
South Africa
South Sudan
Spain
Sri Lanka
St. Kitts and Nevis
St. Lucia
St. Vincent and the Grenadines
Sudan
Suriname
Sweden
Switzerland
Syria
Tajikistan
Tanzania
Thailand
Timor-Leste
Togo
Tonga
Trinidad and Tobago
Tunisia
Turkey
Turkmenistan
Tuvalu
Uganda
Ukraine
United Arab Emirates
United Kingdom
United States of America
Uruguay
Uzbekistan
Vanuatu
Venezuela
Vietnam
Yemen
Zambia
Zimbabwe
"""



let allCountries:[String] = allCountriesString.split(separator: "\n").map { String($0) }

func countryBeginningAndEndingWithAVowel(countries: [String]) {
    var countriesWithVowels: [String] = []
    let vowels: [Character] = ["a","e","i","o","u"]
 
    for country in countries {

        let lowerCaseCountry = country.lowercased()
        let firstChar = lowerCaseCountry.first  ?? "-"
        let lastChar =  lowerCaseCountry.last   ?? "-"
        
        if vowels.contains(firstChar) && vowels.contains(lastChar)  {
            countriesWithVowels.append(country)
        }
    
    }
   print(countriesWithVowels)
}
countryBeginningAndEndingWithAVowel(countries: allCountries)
//countryBeginningAndEndingWithAVowel(vowels: vowels)

// countries are more vowels than anything else


func countryWithLotsOfVowels(countries: [String]) {
    // array to hold countries with more vowels than total letters
    var lotsOfVowels: [String] = []
    
    for country in countries {
        
        let vowels: [Character] = ["a","e","i","o","u"]
        let halfOfName: Double = Double(country.count) / 2.0
        var vowelCount: Double = 0
        
        for letter in country.lowercased() {
            if vowels.contains(letter) {
                vowelCount += 1
            }
        }
        if vowelCount > halfOfName {
            lotsOfVowels.append(country)
        }
    }
    
    print(lotsOfVowels)
   
}
//countryWithLotsOfVowels(vowels: vowels)

func sortAndFindShortest(country: [String]) {
    var sortedCountrys = country
    
    
    print(sortedCountrys)
}

func michaelCountryWithShortestName(countries: [String]) -> Void {
    let sortedCountries = countries.sorted(using: KeyPathComparator(\.count))
    
    guard let firstLonger = sortedCountries.firstIndex(where: { country in
        return country.count > sortedCountries.first!.count
    }) else {
        print("No countries")
        return
    }
    
    dump(sortedCountries[sortedCountries.startIndex..<firstLonger])
}

func countryWithShortestName(countries: [String]) {
    var currentSmallest = Int.max
    var shortestCountries = [String]()
    

    for country in countries {

       let currentCountryLength = country.count
        
        guard currentCountryLength <= currentSmallest else {continue}

        if currentCountryLength == currentSmallest {
            shortestCountries.append(country)
        } else {
            currentSmallest = currentCountryLength
            shortestCountries = [country]
        }

    }
   print(shortestCountries)
}

countryWithShortestName(countries: allCountries)
//sortAndFindShortest(country: allCountries)



func countriesWithOneVowel(_ countries: [String])  {
    
    let vowels: [Character] = ["a","e","i","o","u"]
    var countriesWithOneVowel: [String] = []
    
    for country in countries {
        var vowelcount = 0
        var foundVowel: Character = "0"
        
        for letter in country.lowercased() {
     
            if vowels.contains(letter) && letter != foundVowel {
                foundVowel = letter
                vowelcount += 1
            } else if vowelcount > 1 {
                break
            }
        }
        
        if vowelcount == 1 {
            countriesWithOneVowel.append(country)
        }
        
    }
    print(countriesWithOneVowel)
   
}


//countriesWithOneVowel(allCountries)


//            var currentLetter = String(letter)
//
//
//            if letter == country.last && vowelcount == 1 {
//                countriesWithOneVowel.append(country)
//            } else if vowels.contains(currentLetter) {
//                vowelcount += 1
//            }  else if vowelcount >= 2{
//                print("country has too many vowels")
//                break
//
//            }
//
//        }

var test =   ["Guinea", "Guinea-Bissau", "Equatorial Guinea", "Papua New Guinea"]
var testwo = ["Papua New Guinea", "Equatorial Guinea", "Guinea-Bissau", "Guinea"]
var test3 =  ["Guinea-Bissau", "Guinea", "Equatorial Guinea", "Papua New Guinea"]
var test4 =  ["Equatorial Guinea", "Guinea-Bissau", "Guinea", "Papua New Guinea"]

// romania <- oman romania -> oman




func countryContainingAnotherCountry(_ countries: [String]) {
    var countryWithinACountry = [(String,String)]()
    
    var current = 0
    // i want to hold to the first country
    var i = current + 1
    // compare current i
    while i < countries.count + 1 {
        
        if i == countries.count  {
            current += 1
            i = current + 1
        } else if countries[i].contains(countries[current]) || countries[current].contains(countries[i])  {
            
            countryWithinACountry.append(("\(countries[i])", "\(countries[current])"))
        
            i += 1
        } else {
            i += 1
        }


    }
    print(countryWithinACountry)
  
    }

let testArray5 = ["Afghanistan",
                  "Albania",
                  "Algeria",
                  "Andorra",
                  "Angola"]


// lsit of countries
// keep track of first country / count / country next to first country
// compare first country to check if it contains the next country Vice versa
// if i hit my count
    // current += 1
    //
// afghan -> albania || afghan <- albania
    // afgan = current
    // next + 1
// if condition is not true
    // move the next over 1
    // keep the current
    // i = 2
    // current = afghan
/////////////////////////
/// //current        i
// afghan -> algeria || afghan <- algeria
    // afgan = current
    // next + 1
// if condition is not true
// move the next over 1
// keep the current
// i = 3
// current = afghan


let testArray6 = ["Romania","Pakistan","Oman"]


// romania -> paki || romania <- Paki
// romania -> oman || romania <- oman
// romania -> paki romaina -> oman
// paki -> romania paki -> oman
// oman -> romania oman -> paki



//countryContainingAnotherCountry(allCountries)
//countryContainingAnotherCountry(testwo)
//countryContainingAnotherCountry(test)
//countryContainingAnotherCountry(test4)
//countryContainingAnotherCountry(test3)

// if country.contains(subcountry) && subcountry == country {}
func countryWithinCountry(_ countries:[String]) -> [(String,String)] {
    var countryWithCountry = [(String,String)]()
    
    for country in countries {
        print(country)
        
        for subCountry in countries {
            print(subCountry)
            if country.lowercased() == subCountry.lowercased() {
                print("currnt: \(country) sub: \(subCountry)")
            } else if country.lowercased().contains(subCountry.lowercased()) {
                let match = (country, subCountry)
                countryWithCountry.append(match)
            }
        }
        print(countryWithCountry)
        print("\n")
    }
    return countryWithCountry
}
// romania , oman, slovakia
//
//var word = "word"
//print(word)
//var reversedWords = String(word.reversed())
//print(reversedWords)
//print(word.reversed())
//word.reversed()
//print(word)
//reversedWords.append(word)
//print(reversedWords)
//word.reversed()
//print(word)
//reversedWords.append(word)
//print(reversedWords)
////countryWithinCountry(allCountries)

// condense into one if statement

func countryWithsssCountry(_ countries: [String]) {
    
    var countrywithhssssCuntry = [(String,String)]()
    
    for country in countries {
        print(country)
        for subCountry in countries where country.lowercased().contains(subCountry.lowercased()) {
            
            if country != subCountry {
                // false positive because same string
                let match = (country, subCountry)
                countrywithhssssCuntry.append(match)
            }
            

        }
    }
    
    print(countrywithhssssCuntry)
    
}

countryWithsssCountry(allCountries)

// country == subcountry Which means its the same exact country in the list
// country.contains subcountry  Which means country contains every letter in subCountry the same order as country

