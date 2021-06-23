
shinyServer(function(input, output, session) {
  output$preImage <- renderImage({
    filename <- normalizePath(file.path('./www',
                                        paste(input$mealinput, '.jpeg', sep='')))
    
    list(src = filename,
         alt = input$mealinput)
    
  }, deleteFile = FALSE)
  
  output$preImage2 <- renderImage({
    filename <- normalizePath(file.path('./www',
                                        paste(input$drinkinput, '.jpeg', sep='')))
    
    list(src = filename,
         alt = input$drinkinput)
    
  }, deleteFile = FALSE)
  
  output$text <- renderText({
    if (input$mealinput == "Fish")
    {text <- "Pan-seared Salmon Fish, served with mashed potato, green beans and chilli."}
    
    else if (input$mealinput == "Chicken")
    {text <- "Hainanese rice topped with sliced roasted chicken and signature chilli sauce.
              Allergens info: Gluten, soy."}
    
    else if (input$mealinput == "Vegetarian")
    {text <- "Pumpkin rice, served with vegetarian honey soy chicken alongside capsicum, carrots, broccoli and sesame seeds."}
    
  })
  
  #pull the number from database we made: fish
  counterfish <-  dbGetQuery(
    conn = db,
    statement = 
      'SELECT stock1
  FROM stocks
  WHERE meal1 = "fish"')
  
  #make counter out of it with the if else conditions
  
  fish_counter <- reactiveValues(count = counterfish)
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"  & fish_counter$count==0)
    {
      session$sendCustomMessage(type = 'testmessage',
                                message = 'No more stock for fish, please choose a different menu.')
      
      
    }
    if(input$mealchoice=="Chicken"){
      fish_counter$count <- fish_counter$count}
    if(input$mealchoice=="Vegetarian"){
      fish_counter$count <- fish_counter$count}
  })

  
  observeEvent(input$mealinput, {
    
    if (input$mealinput=="Fish")
    {
    output$my_audio <-renderUI(get_audio_tag("salmon.mp3"))
    
    }
    
    else if (input$mealinput=="Chicken")
    {
      output$my_audio <-renderUI(get_audio_tag("hainanese.mp3"))
      
    }
    
    else if (input$mealinput=="Vegetarian")
    {
      output$my_audio <-renderUI(get_audio_tag("pumpkin.mp3"))
      
    }
    
    
    })
  
  observeEvent(input$mealchoice, {
    
    if (input$mealchoice=="Fish")
    {
      output$my_audiomeal <-renderUI(get_audio_tag("fish.mp3"))
      
    }
    
    else if (input$mealchoice=="Chicken")
    {
      output$my_audiomeal <-renderUI(get_audio_tag("chicken.mp3"))
      
    }
    
    else if (input$mealchoice=="Vegetarian")
    {
      output$my_audiomeal <-renderUI(get_audio_tag("vegetarian.mp3"))
      
    }
    
    
  })
  
  observeEvent(input$drinkchoice, {
    
    if (input$drinkchoice=="Water")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("water.mp3"))
      
    }
    
    else if (input$drinkchoice=="Coca-Cola")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("coca-cola.mp3"))
      
    }
    
    else if (input$drinkchoice=="Beer")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("beer.mp3"))
      
    }
    
    else if (input$drinkchoice=="Wine")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("wine.mp3"))
      
    }
    
    else if (input$drinkchoice=="Orange Juice")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("orange juice.mp3"))
      
    }
    
    else if (input$drinkchoice=="Apple Juice")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("apple juice.mp3"))
      
    }
    
    else if (input$drinkchoice=="Champagne")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("champagne.mp3"))
      
    }
    
    else if (input$drinkchoice=="Tea")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("tea.mp3"))
      
    }
    
    else if (input$drinkchoice=="Coffee")
    {
      output$my_audiodrink <-renderUI(get_audio_tag("coffee.mp3"))
      
    }
    
  })
  
  observeEvent(input$submit, {
    
    if (input$drinkchoice=="Water")
    {sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
    
    sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Water", seatno = "32C")
    conn = db
    dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Coca-Cola")
    {sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
    
    sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Coca-Cola", seatno = "32C")
    conn = db
    dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Beer")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Beer", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Wine")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Wine", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Orange Juice")
    {sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
    
    sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Orange Juice", seatno = "32C")
    conn = db
    dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Apple Juice")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Apple Juice", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Champagne")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Champagne", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Tea")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Tea", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
    else if (input$drinkchoice=="Coffee")
    {
      sqldrink <- "UPDATE meals
      SET drink = ?drink
      WHERE seat = ?seatno"
      
      sqldrink1 <- sqlInterpolate(ANSI(), sqldrink, drink="Coffee", seatno = "32C")
      conn = db
      dbExecute(conn, sqldrink1)
      
    }
    
  })
  
  observeEvent(input$submit, {
    shinyjs::disable("submit")
  }) 
  
  ord <- dbGetQuery(
    conn = db,
    statement = 
      'SELECT ordered
  FROM meals
  WHERE seat = "32C"')
  
  if (ord$ordered == "Ordered")
  {shinyjs::disable("submit")
  }
  
  
  
  #pull the number from database we made: fish
  counterfish <-  dbGetQuery(
    conn = db,
    statement = 
      'SELECT stock1
  FROM stocks
  WHERE meal1 = "fish"')
  
  #make counter out of it with the if else conditions
  
  fish_counter <- reactiveValues(count = counterfish$stock1)
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"  & fish_counter$count>0){
      sql <- "UPDATE stocks
      SET stock1 = ?count
      WHERE meal1 = ?name"
      
      sqlmeal <- "UPDATE meals
      SET food = ?food,
      ordered = ?notord
      WHERE seat = ?seatno"
      
      sql1 <- sqlInterpolate(ANSI(), sql, count = fish_counter$count-1, name = "fish")
      sqlmeal1 <- sqlInterpolate(ANSI(), sqlmeal, food="Fish", notord="Ordered", seatno = "32C")
      conn = db
      dbExecute(conn, sql1)
      dbExecute(conn, sqlmeal1)
      
      session$sendCustomMessage(type = 'testmessage',
                                message = 'Thank you for your submission. We will serve your desired meal shortly.')
    }
    if(input$mealchoice=="Chicken"){
      fish_counter$count <- fish_counter$count}
    if(input$mealchoice=="Vegetarian"){
      fish_counter$count <- fish_counter$count}
  })
  
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"  & fish_counter$count==0)
    {
      session$sendCustomMessage(type = 'testmessage',
                                message = 'No more stock for fish, please choose a different menu.')
      
      
    }
    if(input$mealchoice=="Chicken"){
      fish_counter$count <- fish_counter$count}
    if(input$mealchoice=="Vegetarian"){
      fish_counter$count <- fish_counter$count}
  })

  #pull the number from database we made: chicken
  counterchicken <-  dbGetQuery(
    conn = db,
    statement = 
      'SELECT stock1
  FROM stocks
  WHERE meal1 = "chicken"')
  
  #use it to make a counter for vege
  chicken_counter <- reactiveValues(count = counterchicken$stock1)
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"){
      chicken_counter$count <- chicken_counter$count}
    if(input$mealchoice=="Chicken" & chicken_counter$count==0){
      session$sendCustomMessage(type = 'testmessage',
                                message = 'No more stock for chicken, please choose a different menu.')
      
      
    }
    if(input$mealchoice=="Vegetarian"){
      chicken_counter$count <- chicken_counter$count}
  })
  
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"){
      chicken_counter$count <- chicken_counter$count}
    if(input$mealchoice=="Chicken" & chicken_counter$count>0){
      sql <- "UPDATE stocks
      SET stock1 = ?count
      WHERE meal1 = ?name"
      
      sqlmeal <- "UPDATE meals
      SET food = ?foodname,
      ordered = ?notord
      WHERE seat = ?seatno"
      
      
      sql1 <- sqlInterpolate(ANSI(), sql, count = chicken_counter$count-1, name = "chicken")
      sqlmeal1 <- sqlInterpolate(ANSI(), sqlmeal, foodname="Chicken", notord = "Ordered", seatno = "32C")
      conn = db
      dbExecute(conn, sql1)
      dbExecute(conn, sqlmeal1)

      
      session$sendCustomMessage(type = 'testmessage',
                                message = 'Thank you for your submission. We will serve your desired meal shortly.')}
    if(input$mealchoice=="Vegetarian"){
      chicken_counter$count <- chicken_counter$count}
  })

  #pull the number from database we made: vege
  countervege <-  dbGetQuery(
    conn = db,
    statement = 
      'SELECT stock1
  FROM stocks
  WHERE meal1 = "vegetarian"')
  
  #use it to make a counter for vege
  
  vege_counter <- reactiveValues(count = countervege$stock1)
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"){
      vege_counter$count <- vege_counter$count}
    if(input$mealchoice=="Chicken"){
      vege_counter$count <- vege_counter$count}
    if(input$mealchoice=="Vegetarian" & vege_counter$count==0)
    {
      session$sendCustomMessage(type = 'testmessage',
                                message = 'No more stock for vegetarian, please choose a different menu.')
      
      
    }
  })
  observeEvent(input$submit,{ 
    
    if(input$mealchoice=="Fish"){
      vege_counter$count <- vege_counter$count}
    if(input$mealchoice=="Chicken"){
      vege_counter$count <- vege_counter$count}
    if(input$mealchoice=="Vegetarian" & vege_counter$count>0){
      sql <- "UPDATE stocks
      SET stock1 = ?count
      WHERE meal1 = ?name"
      
      sqlmeal <- "UPDATE meals
      SET food = ?foodname,
      ordered = ?notord
      WHERE seat = ?seatno"
      
      
      sql1 <- sqlInterpolate(ANSI(), sql, count = vege_counter$count-1, name = "vegetarian")
      sqlmeal1 <- sqlInterpolate(ANSI(), sqlmeal, foodname="Vegetarian", notord="Ordered", seatno = "32C")
      conn = db
      dbExecute(conn, sql1)
      dbExecute(conn, sqlmeal1)
      
      session$sendCustomMessage(type = 'testmessage',
                                message = 'Thank you for your submission. We will serve your desired meal shortly.')}
  })
  

  
  output$fishcounter <- renderUI({
    HTML(fish_counter$count)
  })
  
  output$chickencounter <- renderUI({
    HTML(chicken_counter$count)
  })
  
  output$vegecounter <- renderUI({
    HTML(vege_counter$count)
  })
  
  output$fishcounter <- renderValueBox({
    valueBox(
      renderUI({
        HTML(fish_counter$count)
      }), "Stock left for fish", icon = icon("fish"),
      color = "purple"
    )
  })
  
  output$chickencounter <- renderValueBox({
    valueBox(
      renderUI({
        HTML(chicken_counter$count)
      }), "Stock left for chicken", icon = icon("drumstick-bite"),
      color = "yellow"
    )
  })
  
  output$vegecounter <- renderValueBox({
    valueBox(
      renderUI({
        HTML(vege_counter$count)
      }), "Stock left for vegetarian", icon = icon("leaf"),
      color = "green"
    )
  })
  
  
  
  observe(
    {
      if(!isTruthy(input$feedbacktext) || !isTruthy(input$mealtext))
      {
        disable("send")
      }
      else
      {
        enable("send")
      }
    })
  

  
  
  observeEvent(input$send,{ 
    sql <- "INSERT INTO feedbacks (meal, feedback)
      VALUES (?foodname, ?feedbacktext)"
    
    
    
    sqlnew <- sqlInterpolate(ANSI(), sql, foodname = input$mealtext, feedbacktext = input$feedbacktext)
    
    conn = db
    dbExecute(conn, sqlnew)
    
    
    
    
      session$sendCustomMessage(type = 'testmessage',
                                message = 'Thank you for your feedback! We will continue to improve our in-flight meals!')}
  )
  
  
  
}
)