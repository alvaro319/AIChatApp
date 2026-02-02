//
//  AvatarModel.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 1/28/26.
//

import Foundation

/*
 Structs by default are sendable
 Structs are sendable because of how they are managed in memory
 They are value types

 We use 'let' here for all variables because we want to restrict when these
 variables will be modified.
 We don't want anyone to update an avatar model object from outside the struct

 This is an immutable struct
 All the data in this struct are let constants
 The data model inside is not going to change, it is immutable
 We are not going to allow any data to be mutated outside the struct

 */
struct AvatarModel: Hashable {

    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    // author who created this avatarId
    let authorId: String?
    let dateCreated: Date?

    // Handy Tip! Triple click init below and then hit Ctrl-M to get each parameter
    // on a different line

    // setting optionals to nil means we don't need to supply a value when initializing
    // an AvatarModel object
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }

    // usage:
    // let avatar = AvatarModel(avatarId: name: characterOption: characterAction, characterLocation, profileImageName,
    //                              authorId: dateCreatedP:)
    // avatar.characterDescription
    //
    // For example, see ExploreView where the subtitle parameter is passed into
    // the HeroCellView using the avatar.characterDescription
    var characterDescription: String {
        return AvatarDescriptionBuilder(avatar: self).characterDescription
    }

    // static variables (no instance required to use them)
    static var mock: AvatarModel {
        mocks[0]
    }

    // static variables (no instance required to use them)
    static var mocks: [AvatarModel] {
        [
            AvatarModel(avatarId: UUID().uuidString, name: "Alpha", characterOption: .alien,
                        characterAction: .smiling, characterLocation: .park,
                        profileImageName: Constants.randomImageString, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Beta", characterOption: .dog,
                        characterAction: .eating, characterLocation: .forest,
                        profileImageName: Constants.randomImageString, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Gamma", characterOption: .cat,
                        characterAction: .drinking, characterLocation: .museum,
                        profileImageName: Constants.randomImageString, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Delta", characterOption: .woman,
                        characterAction: .shopping, characterLocation: .park,
                        profileImageName: Constants.randomImageString, authorId: UUID().uuidString, dateCreated: .now)
        ]
    }
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation

    init(
        characterOption: CharacterOption,
        characterAction: CharacterAction,
        characterLocation: CharacterLocation
    ) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }

    // if we initialize AvatarDescriptionBuilder with an avatar,
    // set the defaults by using .default for each of the
    // enums... that is, CharacterOption, CharacterAction, and
    // CharacterLocation
    // See the definition of each enum to find out the default
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }

    var characterDescription: String {
        // return is implied
        "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)."
    }
}

// Categories
// makes each case an actual string,
// for example case man would be a string of: "man"
enum CharacterOption: String {
    case man, woman, alien, dog, cat

    // let's createa  default value for CharacterOption
    static var `default`: Self {
        .man
    }
}

enum CharacterAction: String {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing,
    fighting, crying

    // let's createa  default value for CharacterAction
    static var `default`: Self {
        .smiling
    }
}

enum CharacterLocation: String {
    case park, mall, museum, city, desert, forest, space

    // let's createa  default value for CharacterLocation
    static var `default`: Self {
        .park
    }
}
