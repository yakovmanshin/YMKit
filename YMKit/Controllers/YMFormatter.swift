//
//  YMFormatter.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

public struct YMFormatter {
    
    // No instances of YMFormatter can be initialized.
    private init() { }
    
    /**
     Compose person name components into a single string with the specified style.
     + Even though all parameters have default values, you’re highly advised to specify at least one name component; otherwise, you’ll get an empty string.
     - Parameters:
        - style: See `PersonNameComponentsFormatter.Style`
        - prefix: Dr., Mr., Ms., etc.
        - firstName: Johnatan
        - middleName: Maple
        - nickname: Johnny
        - lastName: Appleseed
        - suffix: Esq., Jr., Ph.D., etc.
    */
    @available(iOS, introduced: 9)
    public static func getPersonNameString(
        withStyle style: PersonNameComponentsFormatter.Style = .default,
        prefix: String? = nil,
        firstName: String? = nil,
        middleName: String? = nil,
        nickname: String? = nil,
        lastName: String? = nil,
        suffix: String? = nil
    ) -> String {
        let nameFormatter = PersonNameComponentsFormatter()
        nameFormatter.style = style
        
        var nameComponents = PersonNameComponents()
        nameComponents.namePrefix = prefix
        nameComponents.givenName = firstName
        nameComponents.middleName = middleName
        nameComponents.nickname = nickname
        nameComponents.familyName = lastName
        nameComponents.nameSuffix = suffix
        
        return nameFormatter.string(from: nameComponents)
    }
    
    /**
     Compose a person’s first name and last name into a single string with the specified style.
     + Although both `firstName` and `lastName` are optional, specify at least one of arguments; otherwise, you’ll get an empty string.
     - Parameters:
        - style: See `PersonNameComponentsFormatter.Style`
        - firstName: Johnatan
        - lastName: Appleseed
    */
    @available(iOS, introduced: 9)
    public static func getPersonNameString(
        withStyle style: PersonNameComponentsFormatter.Style = .default,
        firstName: String? = nil,
        lastName: String? = nil
    ) -> String {
        return getPersonNameString(
            withStyle: style,
            prefix: nil,
            firstName: firstName,
            middleName: nil,
            nickname: nil,
            lastName: lastName,
            suffix: nil
        )
    }
    
}
