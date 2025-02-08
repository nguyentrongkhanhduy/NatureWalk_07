//
//  NatureWalk.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import Foundation
import Observation

@Observable
class NatureWalkList {
    var list: [NatureWalk] = [
        // 1️⃣ Stonehenge Walk
            NatureWalk(
                id: 1,
                name: "Stonehenge Historical Walk",
                destination: "Wiltshire, England",
                description: "Embark on a captivating journey through history with a guided walk around the world-famous Stonehenge. Discover the secrets behind this prehistoric monument, learn about its alignment with celestial events, and explore the myths and legends that surround it. As you stroll through the ancient landscape, our expert guide will provide fascinating insights into the Neolithic builders who constructed this enigmatic stone circle over 4,000 years ago. This immersive experience includes stops at nearby burial mounds, scenic viewpoints, and the chance to witness the breathtaking beauty of the Salisbury Plain. Whether you're a history enthusiast or simply looking for a peaceful nature walk, this tour offers a perfect blend of education and adventure.",
                rating: 5,
                host: ("John Doe", "+44 1234 567890"),
                photo: ["stonehenge1", "stonehenge2"],
                price: 119.99,
                isFavourite: true
            ),

            // 2️⃣ Machu Picchu Trail, Peru
            NatureWalk(
                id: 2,
                name: "Machu Picchu Inca Trail",
                destination: "Cusco, Peru",
                description: "Step into the footsteps of the ancient Incas as you embark on the legendary Inca Trail to Machu Picchu. This breathtaking hike takes you through misty cloud forests, stunning Andean landscapes, and ancient ruins before reaching the world-renowned Lost City of the Incas. Led by expert local guides, this trek offers a once-in-a-lifetime opportunity to explore the rich history and natural beauty of Peru. Along the way, experience traditional Quechua culture, breathtaking mountain passes, and panoramic views that make this journey unforgettable.",
                rating: 5,
                host: ("Carlos Mendoza", "+51 987 654 321"),
                photo: ["machupicchu1", "machupicchu2"],
                price: 179.99,
                isFavourite: false
            ),

            // 3️⃣ Banff National Park Wildlife Walk, Canada
            NatureWalk(
                id: 3,
                name: "Banff National Park Wildlife Walk",
                destination: "Banff, Canada",
                description: "Immerse yourself in the pristine wilderness of Banff National Park with this guided nature walk through the heart of the Canadian Rockies. Discover breathtaking landscapes, from crystal-clear glacial lakes to towering mountain peaks, while spotting local wildlife such as elk, deer, and even bears. Learn about the region’s rich Indigenous history, unique ecosystems, and conservation efforts. This relaxing yet adventurous walk is perfect for nature lovers looking to experience Canada’s rugged beauty firsthand.",
                rating: 4,
                host: ("Emma Thompson", "+1 403 555 1234"),
                photo: ["banff1", "banff2"],
                price: 149.99,
                isFavourite: true
            ),

            // 4️⃣ Mount Fuji Sunrise Hike, Japan
            NatureWalk(
                id: 4,
                name: "Mount Fuji Sunrise Hike",
                destination: "Yamanashi, Japan",
                description: "Experience the magic of Japan’s most iconic peak with a guided hike to the summit of Mount Fuji. This overnight trek allows you to witness a breathtaking sunrise from the summit, an experience deeply rooted in Japanese tradition. Traverse volcanic landscapes, mountain huts, and scenic trails while learning about Fuji’s cultural and spiritual significance. Whether you're an experienced hiker or a first-timer, this adventure offers stunning panoramic views and an unforgettable sense of achievement.",
                rating: 5,
                host: ("Hiroshi Tanaka", "+81 90 1234 5678"),
                photo: ["fuji1", "fuji2"],
                price: 169.99,
                isFavourite: false
            ),

            // 5️⃣ Serengeti Safari Walk, Tanzania
            NatureWalk(
                id: 5,
                name: "Serengeti Safari Walk",
                destination: "Serengeti, Tanzania",
                description: "Embark on a thrilling guided walking safari in the heart of the Serengeti, where you can witness Africa’s incredible wildlife up close. This immersive experience allows you to explore the vast savannas on foot, accompanied by expert guides who share insights into the ecosystem, animal behavior, and Maasai culture. Encounter majestic lions, elephants, giraffes, and zebras in their natural habitat while enjoying the raw beauty of one of the world’s most famous national parks.",
                rating: 5,
                host: ("David Mwangi", "+255 712 345 678"),
                photo: ["serengeti1", "serengeti2"],
                price: 199.99,
                isFavourite: true
            )
    ]
}

struct NatureWalk: Identifiable, Equatable {
    static func == (lhs: NatureWalk, rhs: NatureWalk) -> Bool {
        return lhs.id == rhs.id
    }

    var id: Int
    var name: String
    var destination: String
    var description: String
    var rating: Int
    var host: (String, String)
    var photo: [String]
    var price: Double
    var isFavourite: Bool = false
}
