# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Lesson.create(name: "Beginners",
              content: "Beginners Programs are for newer meditators, or anyone who wants a good review of the fundamental building blocks of mindfulness meditation practice.",
              level_id: 1)
Lesson.create(name: "Intermediate",
              content: "The focus of Foundations programs is to help you strengthen and sustain a successful personal mindfulness practice. They assume a working knowledge of mindfulness meditation and are not for brand new beginners. These programs focus on skills for stabilizing attention and awareness, taming the mind, cultivating mindfulness of the body, increasing self-compassion, and developing meditative insight. The aim is for meditation to flourish as an integral and rewarding part of your daily life.",
              level_id: 2)
Lesson.create(name: "Advanced",
              content: "The focus in these programs is deepening meditative insight and mobilizing inner capacities for self-healing and growth so you can take charge of your life with greater effectiveness, clarity, compassion and kindness. Topics include: insight meditation and inquiry (vipassana), increasing self-compassion and loving kindness, learning skills for working with reactive emotions, and learning how to open to others in empathy from a place free of bias and conflict.",
              level_id: 3)

Level.create(name: "Beginners")
Level.create(name: "Intermediate")
Level.create(name: "Advanced")
