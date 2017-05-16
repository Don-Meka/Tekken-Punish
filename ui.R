shinyUI(navbarPage("Tekken Punish",
                   tags$head(includeScript("google-analytics.js")),
                   
                   tabPanel("Info",
                            p("Thank you for using my Tekken Punish App. There is a lot of information 
                              to memorize regarding block punishment in Tekken so I made this application 
                              to make the learning process easier. Please let me know what you think of it. 
                              Let me know of any errors or changes that need to be made. I'm also open to 
                              suggestions to improve the app if you have any ideas. I want to work out all 
                              the kinks with this Tag 2 version so that I can make a better one when Tekken 7 
                              comes out."),
                            p("Note: I suggest you you only use this on a desktop or maybe a tablet. It will work on phones,
                              but it isn't optimized and it will look bad. I will see what I can do about that later."),
                            br(),
                            br(),
                            p(strong("Instructions")),
                            p("* Select the character you play as on the left and the opposing character on the right."),
                            p("* Shift the slider to the desired range of 'on block' frames. Only opposing character 
                              attacks with block frames within the range will be displayed. Set the max to -10 to see 
                              only punishable moves. Your character's move list will also adjust to only show attacks 
                              that start up fast enough to punish the opposing character's move list."),
                            p("* Only your character's main punishers will be shown, but you can select 'Other options' 
                              if you want to experiment "),
                            p("* The 'While Standing' option switches between normal standing punishes and punishes from 
                              low attacks or attacks that cause OC (opponent crouch)."),
                            br(),
                            br(),
                            p(strong("Credits & Links")),
                            p("* The frame data used in this app came from", a("rbnorway", href = "http://rbnorway.org/ttt2-frame-data/")), 
                            p("* The character pictures came from", a("Tekken Zaibatsu", href = "http://www.tekkenzaibatsu.com/gallery/gallery.php?gid=ttt2cg&pagenumber=3")),
                            p("* SD Tekken has a great", a("guide", href = "http://sdtekken.com/t5dr/frame-data-guide/"), 
                              "on reading frame data in Tekken. Newer players who are still understanding frame data should read this first"),
                            p("* Shoutouts to Matt Aschendorf for helping me set up this server. I wouldn't have been able to share this without his help."),
                            p("* I'm not charging anything for this, but I set up a donation page if you want to help me keep this server running."),
                            p("-Emeka Nwosu"),
                            p(strong('Email:'), " emekacn@gmail.com.", strong('Twitter:'), a("Don_Meka.", href = "https://twitter.com/Don_Meka")),
                            tags$form(action="https://www.paypal.com/cgi-bin/webscr", method="post", target="_top",
                                      list(
                                        tags$input(type="hidden", name="cmd", value="_s-xclick"),
                                        tags$input(type="hidden", name="hosted_button_id", value="DCCUPD4QR5VD6"),
                                        tags$input(type="image", src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif", border="0", name="submit", title="PayPal - The safer, easier way to pay online!", alt="Donate"),
                                        tags$img(alt="", border="0", src="https://www.paypal.com/en_US/i/scr/pixel.gif", width="1", height="1"))
                                      
                                      
                            )
                            ),
                   
                   tabPanel("Application",
                            fluidPage(
                              fluidRow(column(2,
                                              selectInput("character", 
                                                          label = h3("Select Character"), 
                                                          choices = list("Alex" = "alex", "Alisa" = "alisa", "Ancient Ogre" = "ancient ogre", "Angel" = "angel", "Anna" = "anna", 
                                                                         "Armor King" = "armor king", "Asuka" = "asuka", "Baek" = "baek", "Bob" = "bob", "Bruce" = "bruce", 
                                                                         "Bryan" = "bryan", "Christie" = "christie", "Devil Jin" = "devil jin", "Dr. Bosconovitch" = "dr b", "Dragunov" = "dragunov", 
                                                                         "Eddy" = "eddy", "Feng" = "feng", "Forest Law" = "forest law", "Ganryu" = "ganryu", "Heihachi" = "heihachi", 
                                                                         "Hwoarang" = "hwoarang", "Jack 6" = "jack 6", "Jaycee" = "jaycee", "Jin" = "jin", "Jinpachi" = "jinpachi", 
                                                                         "Jun" = "jun", "Kazuya" = "kazuya", "King" = "king", "Kuma" = "kuma", "Kunimitsu" = "kunimitsu",
                                                                         "Lars" = "lars", "Lee" = "lee", "Lei" = "lei", "Leo" = "leo", "Lili" = "lili", 
                                                                         "Marduk" = "marduk", "Marshall Law" = "marshall law", "Michelle" = "michelle", "Miguel" = "miguel", "Miharu" = "miharu", 
                                                                         "Nina" = "nina", "Panda" = "panda", "Paul" = "paul", "Prototype Jack" = "prototype jack", "Raven" = "raven", 
                                                                         "Roger" = "roger", "Sebastian" = "sebastian", "Slim Bob" = "slim bob", "Steve" = "steve", "Tiger" = "tiger", 
                                                                         "True Ogre" = "true ogre", "Unknown" = "unknown", "Violet" = "violet", "Wang" = "wang", "Xiaoyu" = "xiaoyu", 
                                                                         "Yoshimitsu" = "yoshimitsu", "Zafina" = "zafina"), selected = "alex"),
                                              radioButtons("punish",
                                                                 label = "Punish Type",
                                                                 choices = list("Optimal Punishers" = "yes", "Other Options" = "no"), selected = "yes")
                              ),
                              column(1, offset = 1,
                                     imageOutput("chpic", width = 10, height = 10)),
                              column(4,
                                     sliderInput("opblock", label = h3("Block Frames"),
                                                 min = -40, max = 10, value = c(-40, 10)),
                                     align = "center"),
                              column(1, 
                                     imageOutput("oppic", width = 10, height = 10)),
                              column(2, offset = 1,
                                     selectInput("opponent",
                                                 label = h3("Select Opponent"), 
                                                 choices = list("Alex" = "alex", "Alisa" = "alisa", "Ancient Ogre" = "ancient ogre", "Angel" = "angel", "Anna" = "anna", 
                                                                "Armor King" = "armor king", "Asuka" = "asuka", "Baek" = "baek", "Bob" = "bob", "Bruce" = "bruce", 
                                                                "Bryan" = "bryan", "Christie" = "christie", "Devil Jin" = "devil jin", "Dr. Bosconovitch" = "dr b", "Dragunov" = "dragunov", 
                                                                "Eddy" = "eddy", "Feng" = "feng", "Forest Law" = "forest law", "Ganryu" = "ganryu", "Heihachi" = "heihachi", 
                                                                "Hwoarang" = "hwoarang", "Jack 6" = "jack 6", "Jaycee" = "jaycee", "Jin" = "jin", "Jinpachi" = "jinpachi", 
                                                                "Jun" = "jun", "Kazuya" = "kazuya", "King" = "king", "Kuma" = "kuma", "Kunimitsu" = "kunimitsu",
                                                                "Lars" = "lars", "Lee" = "lee", "Lei" = "lei", "Leo" = "leo", "Lili" = "lili", 
                                                                "Marduk" = "marduk", "Marshall Law" = "marshall law", "Michelle" = "michelle", "Miguel" = "miguel", "Miharu" = "miharu", 
                                                                "Nina" = "nina", "Panda" = "panda", "Paul" = "paul", "Prototype Jack" = "prototype jack", "Raven" = "raven", 
                                                                "Roger" = "roger", "Sebastian" = "sebastian", "Slim Bob" = "slim bob", "Steve" = "steve", "Tiger" = "tiger", 
                                                                "True Ogre" = "true ogre", "Unknown" = "unknown", "Violet" = "violet", "Wang" = "wang", "Xiaoyu" = "xiaoyu", 
                                                                "Yoshimitsu" = "yoshimitsu", "Zafina" = "zafina"), selected = "alex"),
                                     radioButtons("WS",
                                                        label = "While Standing",
                                                        choices = list("Standing Punish" = "stand", "WS Punish" = "crouch"), selected = c("stand")))
                              ),
                              fluidRow(
                                column(6,
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       dataTableOutput("chdata")
                                ),
                                column(6,
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       br(),
                                       dataTableOutput("opdata")
                                )
                              )
                            )
                   )
                            ))