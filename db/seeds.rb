User.create!(email: 'misk@gmail.com',
     password: '123456789', name: 'misk', role: 'orgnization')


     Cause.create!(name: "Raise awareness about human trafficking" ,
     description: "Stop human trafficking right away but to start we need to talk about this issue a lot more and not let it gain dust waiting for someone to discover it themselves. We can do this by talking about it more on the news across the world and inform everyone as much as possible.", 
     category:"Human Rights ",
     img: "https://media.graytvinc.com/images/810*455/human+sex+trafficking1.jpg",
     user_id: 1)

     Cause.create(name: "Help provide children a future without war!",
     description: "helps provide high-standard free-of-charge medical and surgical care to civilian victims of war and poverty and promotes a culture of peace, solidarity and respect for human rights.",
     category:"Human Rights " ,
     img: "https://www.savethechildren.org/content/dam/usa/images/lps/2019/hp/goats-girls-ch1258535-rec.jpg/_jcr_content/renditions/original.img.png" ,
     user_id: 1 )

     Cause.create(name: "Empower people to live healthier" , 
     description: "Tackling the obstacles to healthy eating starts with making simple changes in the ways we shop, prepare, and cook our meals. Switching to healthier eating doesn't just happen overnight – it begins with small changes ",
     category:" Health" , 
     img: "https://www.geriatricosyresidenciasancianos.com/wp-content/uploads/geri%C3%A1tricos-madrid-1.png" ,
     user_id: 1)

     Cause.create(name: "Reduce potential cancer-causing ingredient in soda",
     description: "Caramel Coloring, an ingredient that makes your cola brown, may be dangerous to your health.",
     category:"Health" , 
     img:  "https://i.ytimg.com/vi/BRY7htR6IlI/maxresdefault.jpg" ,
     user_id: 1)

     Cause.create(name: "Make everyone aware of the effect plastic pollution" , 
     description: "pollution is a growing worldwide issue; as population increases so 
     does the pollution of our oceans. We must much reduce
     plastic pollution in our oceans or better still end
     all careless littering of plastic." ,
     category:"environment" ,
     img: "https://i.guim.co.uk/img/media/63ff8059e8ed7a58a71b677e71fa7d1dbe8bbb48/0_105_4096_2457/master/4096.jpg?width=1140&quality=45&auto=format&fit=max&dpr=2&s=48c8d0018b168bc51f2bcb1a6916f5b0" ,
     user_id: 1)

     Cause.create(name: "Change the way we dispose of rubbish", 
     description: "Landfill is the disposal of waste by burial. 
     The goal of this is to raise awareness to the issue of landfill
     and the negative effects it has on the earth. 
     This campaign is important because people are generally unaware of how bad this 
     can be for all aspects of the earth.",
     category:"environment" ,
     img:  "https://www.greenjournal.co.uk/wp-content/uploads/2019/08/recycling.jpg" ,
     user_id: 1)

     Cause.create(name: "Bring More Fun and Creative Thought Into the Classroom",
     description: "The main problem in education today is that we're still using 20th century tools and practices while we've already moved into a 21st century environment. " ,
     category:"education" ,
     img: "https://mms.businesswire.com/media/20180327006032/en/648368/5/Everyone_Can_Create_students_03272018_big_og.jpg" ,
     user_id: 1)

     Cause.create(name: "Full, free and fair bankruptcy protections for student loans" ,
     description: "If you are burdened by predatory, exploitative private student loans, or federal student loans, you must sign this petition and spread it to as many people as you possibly can." ,
     category:"education" ,
     img: "https://images.theconversation.com/files/45719/original/y5jydqw4-1396833931.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip" ,
     user_id: 1)
     
     Support.create(cause_id: 4, user_id: 1, title: "Save Turtels", body: "Turtels in the sea are paying the price for dumping our trash into oceans. Me and you should contibute to reduce trash dumping.")
