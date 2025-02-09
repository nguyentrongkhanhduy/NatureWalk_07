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
            description: """
                Embark on a captivating journey through history with a guided walk around the world-famous Stonehenge, a prehistoric marvel that has puzzled historians and archaeologists for centuries. This iconic stone circle, constructed over 4,500 years ago, continues to inspire awe and speculation about its true purpose. Was it an ancient astronomical observatory, a religious temple, or a sacred burial ground? On this immersive tour, you'll explore these fascinating questions while uncovering the latest archaeological discoveries. Led by an expert guide, you'll learn about the monument's precise alignment with the summer and winter solstices, its connection to Druidic rituals, and the engineering feats of its Neolithic builders. As you traverse the rolling hills of Salisbury Plain, you'll be transported back in time to an era of mystery, spirituality, and ingenuity.

                Beyond the towering stones, this tour takes you to lesser-known yet equally intriguing sites in the surrounding landscape. Visit ancient burial mounds, where early Britons laid their dead to rest, and marvel at the stunning panoramic views from the Cursus, a Neolithic earthwork older than Stonehenge itself. Along the way, your guide will share captivating tales of ancient customs, lost civilizations, and the myths that have shaped the legend of Stonehenge. Whether you are a history enthusiast, an archaeology lover, or simply someone seeking a tranquil yet profound experience in nature, this walk offers an unparalleled journey through time. The experience concludes with an optional visit to the Stonehenge Visitor Centre, where you can examine rare artifacts, interactive displays, and life-size reconstructions of Neolithic dwellings, providing deeper insight into the lives of the people who built this enduring wonder.
            """,
            rating: 4, // Adjusted based on real-life reviews (Stonehenge is amazing but often crowded)
            host: ("John Doe", "+44 1234 567890"),
            photo: ["stonehenge1", "stonehenge2"],
            price: 1499.99, // Adjusted based on real-world guided tours (~$50-$100 per person)
            isFavourite: true
        ),
        
        // 2️⃣ Machu Picchu Trail, Peru
        NatureWalk(
            id: 2,
            name: "Machu Picchu Inca Trail",
            destination: "Cusco, Peru",
            description: """
                Step into the footsteps of the ancient Incas as you embark on the legendary Inca Trail, one of the world’s most breathtaking trekking routes. This four-day journey takes you through misty cloud forests, rugged Andean peaks, and hidden archaeological wonders, culminating at the awe-inspiring Sun Gate, the grand entrance to the Lost City of the Incas—Machu Picchu. As you ascend the stone-paved paths once walked by Incan priests and messengers, you’ll discover ancient ruins like Runkurakay, Wiñay Wayna, and Sayacmarca, each with a fascinating story about the Incan Empire. Along the way, expert local guides will share insights into the culture, spiritual beliefs, and engineering genius of the Incas, who built this magnificent trail over 500 years ago. You’ll also learn about the rare flora and fauna that thrive in this protected region, from vibrant orchids to elusive spectacled bears.

                The final morning of the trek is an experience like no other—arriving at Machu Picchu before sunrise, witnessing the first golden rays illuminating the mist-covered ruins. Standing at the Sun Gate, you’ll get a panoramic view of the sacred citadel, revealing its intricate terraces, temples, and stone-built wonders. After descending into the ruins, your guide will take you through the most significant sites, including the Temple of the Sun, the Intihuatana stone, and the Royal Tomb. As you explore, you’ll hear tales of how Machu Picchu remained hidden from Spanish conquerors and was rediscovered in 1911. Whether you’re a history enthusiast, an adventure seeker, or a spiritual traveler, this trek offers an unforgettable blend of physical challenge, cultural immersion, and the indescribable magic of standing atop one of the New Seven Wonders of the World.
            """,
            rating: 5, // Adjusted based on real-life visitor reviews (one of the most famous treks in the world)
            host: ("Carlos Mendoza", "+51 987 654 321"),
            photo: ["machupicchu1", "machupicchu2"],
            price: 2999.99, // Adjusted for high-end guided tours with permits, porters, and accommodation
            isFavourite: false
        ),
        
        // 3️⃣ Banff National Park Wildlife Walk, Canada
        NatureWalk(
            id: 3,
            name: "Banff National Park Wildlife Walk",
            destination: "Banff, Canada",
            description: """
                Immerse yourself in the breathtaking wilderness of Banff National Park, Canada's first and most famous national park, nestled in the heart of the majestic Canadian Rockies. This expertly guided wildlife walk takes you through some of the most spectacular landscapes in North America, where towering snow-capped peaks rise above emerald-green glacial lakes and dense alpine forests. As you traverse well-maintained trails, you’ll learn about the park’s unique ecosystem, shaped over millennia by glacial activity and rich biodiversity. Keep your camera ready as you may encounter some of Banff’s most iconic wildlife, including elk, moose, bighorn sheep, and—if you're lucky—the elusive grizzly or black bear. Along the way, your guide will share fascinating insights about the Indigenous Peoples who have called this land home for thousands of years, including the Stoney Nakoda, Blackfoot, and Tsuut’ina nations, whose traditions and deep connection to the land continue to shape Banff’s cultural heritage.

                This nature walk isn’t just about scenery; it’s a journey into the history and conservation of Canada’s vast wilderness. You’ll explore hidden valleys, serene meadows, and ancient glaciers that tell the story of climate change and the evolving landscape of the Rockies. Hear about the delicate balance between human activity and wildlife conservation, and how Banff’s extensive network of wildlife corridors allows animals to migrate safely across the region. Whether you’re an avid photographer, a nature enthusiast, or simply looking for a peaceful retreat into the mountains, this experience promises to leave you with a profound appreciation for Banff’s rugged beauty. At the end of the walk, unwind at a scenic picnic spot overlooking Lake Louise or Moraine Lake, where the turquoise waters reflect the surrounding peaks, offering the perfect ending to a remarkable outdoor adventure.
            """,
            rating: 5, // Adjusted based on real-life visitor reviews (Banff is consistently rated among the world's best national parks)
            host: ("Emma Thompson", "+1 403 555 1234"),
            photo: ["banff1", "banff2"],
            price: 1799.99, // Adjusted based on real guided wildlife tours and premium experiences
            isFavourite: true
        ),
        
        // 4️⃣ Mount Fuji Sunrise Hike, Japan
        NatureWalk(
            id: 4,
            name: "Mount Fuji Sunrise Hike",
            destination: "Yamanashi, Japan",
            description: """
                Experience the magic of Japan’s most iconic peak with an unforgettable overnight trek to the summit of Mount Fuji. Standing at 3,776 meters (12,389 feet), Fuji-san has long been revered in Japanese culture, serving as a symbol of strength, beauty, and spiritual enlightenment. This guided expedition takes you through the well-maintained Yoshida Trail, the most popular route to the summit, with stops at traditional mountain huts offering warm meals and rest along the way. As you ascend, your expert guide will share the deep cultural significance of the mountain, from its role in Shinto and Buddhist beliefs to its centuries-old pilgrimage traditions. The hike is physically demanding but accessible to both experienced climbers and first-timers, making it one of the most rewarding adventures in Japan.

                The true highlight of this trek is reaching the summit before dawn, where you’ll witness an awe-inspiring sunrise, known as Goraikō, or "arrival of light," a moment that has inspired poets and pilgrims for generations. As the first golden rays break through the horizon, illuminating the sea of clouds below, you’ll understand why climbing Mount Fuji is considered a once-in-a-lifetime spiritual journey. After enjoying panoramic views stretching as far as Tokyo on clear days, you’ll have time to explore the crater before beginning the descent. Whether you’re seeking adventure, breathtaking photography, or a deeper connection to Japan’s natural wonders, this guided sunrise hike delivers an unparalleled experience. The journey concludes with an optional soak in a rejuvenating onsen (hot spring), a traditional Japanese way to relax after conquering the country’s most sacred peak.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (amazing but physically demanding and crowded in peak season)
            host: ("Hiroshi Tanaka", "+81 90 1234 5678"),
            photo: ["fuji1", "fuji2"],
            price: 2299.99, // Adjusted for premium guided sunrise hikes with accommodations
            isFavourite: false
        ),
        
        // 5️⃣ Serengeti Safari Walk, Tanzania
        NatureWalk(
            id: 5,
            name: "Serengeti Safari Walk",
            destination: "Serengeti, Tanzania",
            description: """
                Embark on a once-in-a-lifetime adventure through the vast, golden savannas of the Serengeti, one of Africa’s most iconic and wildlife-rich national parks. Unlike traditional vehicle safaris, this exclusive guided walking safari allows you to experience the raw beauty of the Serengeti on foot, immersing you in the sights, sounds, and scents of the African wilderness. Accompanied by highly trained guides and Maasai trackers, you'll venture into remote regions of the park, gaining a deeper understanding of the delicate balance that sustains this incredible ecosystem. As you traverse acacia-dotted plains and hidden riverbanks, you’ll have the rare opportunity to observe wildlife at an intimate level—watching elephants graze just meters away, following the footprints of a lion pride, and witnessing zebras and giraffes move gracefully through their natural habitat.

                Beyond the thrilling wildlife encounters, this walk offers a profound cultural experience as you learn about the ancient traditions of the Maasai people, who have coexisted with Serengeti’s wildlife for centuries. Your guide will share knowledge about medicinal plants, bush survival techniques, and the Maasai’s deep spiritual connection to the land. As the day winds down, you’ll settle at a luxury tented camp, where you can relax under a star-lit sky, listening to the distant roars of lions and the calls of nocturnal creatures. With spectacular sunrises painting the horizon and breathtaking wildlife encounters at every turn, this safari walk delivers an authentic and unforgettable African adventure, offering a perspective of the Serengeti that few travelers ever experience.
            """,
            rating: 5, // Maintained due to overwhelmingly positive real-life reviews
            host: ("David Mwangi", "+255 712 345 678"),
            photo: ["serengeti1", "serengeti2"],
            price: 2899.99, // Adjusted based on premium guided safari walk experiences
            isFavourite: true
        ),
        
        // 6️⃣ Grand Canyon Rim Trail, USA
        NatureWalk(
            id: 6,
            name: "Grand Canyon Rim Trail",
            destination: "Arizona, USA",
            description: """
                Embark on a breathtaking journey along the Grand Canyon Rim Trail, one of the most scenic and accessible hikes in the world. Stretching along the canyon’s South Rim, this trail provides unparalleled panoramic views of the vast, layered rock formations carved over millions of years by the mighty Colorado River. As you walk along the well-maintained path, you'll pass multiple scenic lookout points, including Mather Point, Hopi Point, and Yavapai Observation Station, each offering unique perspectives of the 1-mile-deep chasm below. Along the way, learn about the Grand Canyon’s fascinating geological history, where rock layers dating back nearly 2 billion years tell the story of Earth’s past. Our expert guides will share insights about the park’s diverse ecosystem, from the resilient desert flora clinging to the cliffs to the majestic California condors soaring overhead.

                Beyond its natural beauty, the Grand Canyon holds deep cultural and spiritual significance to Native American tribes, including the Hopi, Navajo, Havasupai, and Hualapai Nations, who have lived in and revered this land for centuries. As you explore, you’ll hear traditional stories and legends passed down through generations, enriching your understanding of the canyon’s sacred role in Indigenous cultures. For those seeking adventure, optional guided excursions can take you on short detours to hidden viewpoints, or even a half-day descent into the canyon for a more immersive experience. Whether you prefer a relaxing sunset walk along the rim or an active day of hiking, this trail offers something for everyone—making it the perfect way to experience one of the world’s most awe-inspiring natural wonders.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (stunning but crowded in peak season)
            host: ("Michael Roberts", "+1 928 555 6789"),
            photo: ["grandcanyon1", "grandcanyon2"],
            price: 1899.99, // Adjusted for premium guided hikes with additional exploration options
            isFavourite: false
        ),
        
        // 7️⃣ Plitvice Lakes National Park Walk, Croatia
        NatureWalk(
            id: 7,
            name: "Plitvice Lakes National Park Walk",
            destination: "Plitvice, Croatia",
            description: """
                Experience the enchanting beauty of Plitvice Lakes National Park, a UNESCO World Heritage Site and one of Europe’s most breathtaking natural wonders. This guided walk takes you along wooden boardwalks and scenic trails, weaving through a fairytale landscape of 16 crystal-clear terraced lakes connected by a network of cascading waterfalls. As you meander through this lush, untouched paradise, you’ll witness the mesmerizing color variations of the water, ranging from deep emerald green to bright turquoise—changing depending on the sunlight and minerals in the lake. The park is home to a rich biodiversity of wildlife, including rare lynxes, wolves, brown bears, and over 160 bird species, making it a true haven for nature lovers. With an expert guide leading the way, you’ll gain insight into the park’s geological formations, its delicate karst landscape, and the unique ecological balance that sustains this breathtaking ecosystem.

                Beyond its natural splendor, Plitvice Lakes carries a deep historical and cultural significance. The region has been inhabited for centuries, with ancient legends speaking of mystical fairies who once guarded the lakes and waterfalls. You’ll learn about the local folklore as you traverse the Upper and Lower Lakes, each offering stunning panoramic viewpoints, tranquil boat rides, and hidden waterfalls waiting to be discovered. Your walk will also include stops at Veliki Slap, the tallest waterfall in Croatia, where you’ll feel the power of cascading water echoing through the canyon. Whether you’re admiring the reflective beauty of the lakes or soaking in the serenity of the surrounding forests, this experience is truly a photographer’s dream and an unforgettable journey into one of Croatia’s most cherished national parks.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (stunning but crowded in peak season)
            host: ("Ana Maric", "+385 91 555 1234"),
            photo: ["plitvice1", "plitvice2"],
            price: 1599.99, // Adjusted for premium guided walks with eco-tourism experiences
            isFavourite: true
        ),
        
        // 8️⃣ Patagonia W Trek, Chile
        NatureWalk(
            id: 8,
            name: "Patagonia W Trek",
            destination: "Torres del Paine, Chile",
            description: """
                Embark on the legendary W Trek, a world-renowned multi-day hike through the Torres del Paine National Park in the heart of Chilean Patagonia. This exhilarating journey takes you across glacial valleys, turquoise lakes, dense lenga forests, and towering granite peaks, revealing some of the most dramatic landscapes on the planet. As you hike through the park’s four major highlights—the Base of the Towers, the French Valley, Grey Glacier, and Lake Nordenskjöld—you’ll witness firsthand the sheer force of nature that has shaped this region over millennia. Along the way, spot Patagonia’s unique wildlife, including guanacos, Andean condors, foxes, and even the elusive puma. Expert local guides will accompany you, providing insights into the park’s geological history, conservation efforts, and the indigenous Kawésqar and Tehuelche peoples who once inhabited these lands.

                This trek is not just about stunning scenery—it’s an adventure that pushes your limits and rewards you with unparalleled beauty. Covering approximately 80 kilometers (50 miles) over 4 to 5 days, the hike features a mix of challenging ascents, suspension bridges over rushing rivers, and panoramic viewpoints overlooking the Southern Ice Field. Each night, rest in cozy eco-lodges or fully serviced campsites, where you can recharge with hearty Patagonian meals under the endless southern sky. Whether you’re gazing at the majestic Cuernos del Paine, walking along the shores of Grey Glacier, or reaching the breathtaking Mirador Las Torres at sunrise, every step of this journey is a testament to the wild, untamed spirit of Patagonia. For adventurers seeking an unforgettable, once-in-a-lifetime experience, the W Trek is a bucket-list-worthy expedition through one of Earth’s last great wildernesses.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (incredible but physically demanding and weather-dependent)
            host: ("Santiago Lopez", "+56 9 8765 4321"),
            photo: ["patagonia1", "patagonia2"],
            price: 3199.99, // Adjusted for premium guided treks with accommodations and logistics
            isFavourite: false
        ),
        
        // 9️⃣ The Dolomites Alpine Walk, Italy
        NatureWalk(
            id: 9,
            name: "The Dolomites Alpine Walk",
            destination: "South Tyrol, Italy",
            description: """
                Experience the breathtaking beauty of the Dolomites, a UNESCO World Heritage Site renowned for its dramatic limestone peaks, alpine meadows, and charming mountain villages. This guided alpine walk takes you along some of the most picturesque trails in South Tyrol, where you’ll marvel at jagged rock formations towering above lush valleys, pass through rolling green pastures, and stop at traditional wooden huts (rifugi) serving homemade Italian cuisine. As you hike through this extraordinary landscape, your expert guide will share the geological history of the Dolomites, explaining how these towering peaks were once coral reefs in an ancient tropical sea over 250 million years ago. Along the way, you’ll discover alpine flora, hidden waterfalls, and panoramic viewpoints that showcase the unique blend of rugged mountain wilderness and serene pastoral beauty that defines this region.

                Beyond its natural wonders, the Dolomites are steeped in history and culture, offering a fascinating glimpse into the traditions of the Ladin people, an ancient alpine community that has preserved its language and customs for centuries. As you walk through idyllic villages and medieval chapels, your guide will recount stories of World War I battles fought in these very mountains, as well as the region’s rich heritage in mountaineering and winter sports. Depending on the season, you may see vibrant wildflowers in summer, golden larch forests in autumn, or snow-covered peaks in winter, each offering a different but equally mesmerizing experience. Whether you're an experienced trekker or a leisurely explorer, this alpine journey through the Dolomites promises unforgettable scenery, cultural immersion, and the pure, crisp air of one of Europe’s most beautiful mountain ranges.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (stunning but can be physically demanding and weather-dependent)
            host: ("Giovanni Rossi", "+39 333 555 6789"),
            photo: ["dolomites1", "dolomites2"],
            price: 2099.99, // Adjusted for premium guided alpine hiking experiences
            isFavourite: true
        ),
        
        // 🔟 Table Mountain Summit Hike, South Africa
        NatureWalk(
            id: 10,
            name: "Table Mountain Summit Hike",
            destination: "Cape Town, South Africa",
            description: """
                Embark on an exhilarating summit hike to Table Mountain, the iconic flat-topped peak that dominates the Cape Town skyline. This guided trek takes you through scenic trails filled with unique flora and fauna, offering breathtaking panoramic views of Cape Town, Robben Island, the Atlantic Ocean, and the Cape Peninsula. As you ascend, your expert guide will introduce you to the remarkable biodiversity of the Cape Floral Kingdom, one of the world’s most diverse ecosystems, home to over 2,200 species of fynbos plants found nowhere else on Earth. Along the way, keep an eye out for rock hyraxes (dassies), sugarbirds, and sunbirds, as well as the occasional peregrine falcon soaring above. The trail varies in difficulty, with options for both casual hikers and experienced adventurers, from the relaxed Platteklip Gorge route to the more challenging India Venster trail for those seeking an adrenaline rush.

                Beyond its natural beauty, Table Mountain holds deep cultural and historical significance. The Khoisan people, indigenous to the region, once considered the mountain sacred, referring to it as Hoerikwaggo, meaning "Mountain in the Sea." Your guide will share fascinating stories about its role in early exploration, colonial history, and conservation efforts. Upon reaching the summit, take in the 360-degree views from over 1,000 meters above sea level, a sight that has inspired travelers for centuries. Enjoy a well-earned break at the mountain-top café, or opt for an aerial descent via the Table Mountain Cableway, offering a spectacular bird’s-eye view of the city. Whether you're here for the thrill of the climb, the incredible biodiversity, or the stunning vistas, this hike is an essential South African adventure that blends nature, history, and unforgettable scenery.
            """,
            rating: 4, // Adjusted based on real-life visitor reviews (stunning but can be crowded and weather-dependent)
            host: ("Lebo Dlamini", "+27 82 555 7890"),
            photo: ["tablemountain1", "tablemountain2"],
            price: 1799.99, // Adjusted for premium guided summit hikes with added experiences
            isFavourite: false
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
