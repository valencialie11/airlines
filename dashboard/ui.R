library(shiny)
library(shinydashboard)

dashboardPage(skin = "blue",
    dashboardHeader(title = "ABC Airlines (Seat 32C)"),
    dashboardSidebar(sidebarMenu(
        
        menuItem("Choose your meal", tabName = "meal", icon = icon("utensils")),
        menuItem("Feedback form", tabName = "feedback", icon = icon("question")))),
    dashboardBody(
        useShinyjs(),
        tabItems(
        tabItem(tabName = 'meal',
                br(),
                img(src = "logo.png", height = 250, width = 1410),
                h1("Please choose your desired meal out of the following choices:"
                , style = "font-family: 'times'", align = 'center'),
                h3("Please take note that bookings are made on a first come first served basis. Should there be a dispute, the ultimate decision will rest upon the flight attendant in charge's discretion.",
                   style = "font-family: 'times'; font-style: italic; color: red;", align = 'center'),
                tags$audio(src = "intro.mp3", type = "audio/mp3", controls = NA),
                
                
                fluidRow(
                box(width = 2, background = "red", height = "120px", selectInput(inputId = "mealinput", label = "Food List", choices = c("Fish", "Vegetarian", "Chicken"), selected = "Fish")),
                box(width = 8, height = "500px", imageOutput(outputId = "preImage"), align = 'center')),
                uiOutput('my_audio'),
                box(width = 13, align = 'center', style = "font-family: 'times'; font-size:25px", textOutput(outputId = "text")),
                fluidRow(
                    box(width = 2, background = "red", height = "120px", selectInput(inputId = "drinkinput", label = "Beverage List", choices = c("Water", "Apple Juice", "Orange Juice", "Tea", "Coffee", "Coca-Cola", "Wine", "Champagne", "Beer"), selected = "Water")),
                    box(width = 8, height = "500px", imageOutput(outputId = "preImage2"), align = 'center')),
                fluidRow(
                    box(width = 6, background = 'blue', radioButtons(inputId = "mealchoice", label = "Please choose your food:", choices = c("Fish", "Vegetarian", "Chicken"),
                                                                    selected = "Fish")),
                    box(width = 6, background = 'blue', radioButtons(inputId = "drinkchoice", label = "Please choose your beverage:", choices = c("Water", "Apple Juice", "Orange Juice", "Tea", "Coffee", "Coca-Cola", "Wine", "Champagne", "Beer"),
                                                                    selected = "Water"))),
                    uiOutput('my_audiomeal'),
                    uiOutput('my_audiodrink'),
                br(),
                fluidRow(
                    box(width = 12, valueBoxOutput("fishcounter"),
                        valueBoxOutput("chickencounter"),
                        valueBoxOutput("vegecounter"))
                ),
                    tags$head(tags$script(src = "message-handler.js")),
                    actionButton("submit", "Submit"),
                    br(),
                    tags$audio(src = "submit.mp3", type = "audio/mp3", controls = NA),
            tags$script(HTML(
                "window.__be = window.__be || {};
                        window.__be.id = '60acaf9c36ee6b0007f14c82';
                        (function() {
                            var be = document.createElement('script'); be.type = 'text/javascript'; be.async = true;
                            be.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.chatbot.com/widget/plugin.js';
                            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(be, s);
                        })();"
                
            ))
        ),
                
        
                
        tabItem(tabName = "feedback",
                br(),
                img(src = "logo.png", height = 250, width = 1410),
                h1("Feedback Form",style = "font-family: 'times'", align = "center"),
                h3("Please take a few moments to fill this feedback form on your in-flight meal. Thank you." ,style = "font-family: 'times'", align = "center"),
                br(),
                br(),
                textInput(inputId = "mealtext", label = "What meal did you eat in this flight today?"),
                textAreaInput(inputId = "feedbacktext", label = "Review of meal:", height = "200px", width = '100%'),
                
                align = 'center',
                
                useShinyjs(),
                actionButton(inputId = "send", label = "Send"),
                br(),
                br(),
                h3("We appreciate every feedback given by passengers and will continue to improve our service.", style = "font-family: 'times'", align = "center"),
                br(),
                br(),
                tags$script(HTML(
                    "window.__be = window.__be || {};
                    window.__be.id = '60c736eed8dc4e0007bdc582';
                    (function() {
                        var be = document.createElement('script'); be.type = 'text/javascript'; be.async = true;
                        be.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.chatbot.com/widget/plugin.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(be, s);
                    })();"
                    )
                )
        )
    )
    
    
    
    
    
    )
    
)


