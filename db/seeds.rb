puts "Seedings complete!"


User.create([




    {
        name: "Hayden",
        email: "Hayden.net",
        username: "Haybo",
        password: "123"



    },
    {
        name: "Dexter",
        email: "Dexter.gov",
        username: "StinkyFace",
        password: "123"
    }
]

)

























Post.create! ([
    {
        title: "Posting Test",
        author: "By Hayden",
        content: "Tim Duncan is the greatest baskebtall player on the planet"


    }



])

