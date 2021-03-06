 get_fb_dataset <- function(){
  require(Rfacebook)
  
  token <- "EAACEdEose0cBAGwjmjEc8mgT0wdmDbRCXHJTbVm4tZB6rZBI9eS5fZCcIRmPFpqfdhZAqGMIDo4PK2V1MNuhpO8VYYk1ou15xDrgsq3ZCSDucHgNLdZBqxTU1yEVFHFHPv1Qn6WPH1NKLFYLZBZCYJ9HCFOfltOceLxHSXOdliqPuni7hDm4jWNjYZCEXSwERyOkZD"
  pages <- c("SKYBrasil", "UniversalPicturesBR")
  
  posts <- getPage(pages[2], token = token, n = 1, reactions = T)
  comments <- getPost(posts$id[1], token = token, n = 20)
  comments <- as.data.frame(comments, stringsAsFactors = F)
  
  return(comments)
  
}

# # install.packages("Rfacebook", dependencies = T)
# # install.packages("xlsx", dependencies = T)
# require(Rfacebook)
# require(xlsx)
# 
# token <- ""
# pages <- c("OiOficial",
#            "vivo",
#            "timbrasil",
#            "paodeacucar",
#            "magazineluiza",
#            "CasasBahia",
#            "atacadaodoseletros",
#            "uberbr",
#            "natura.br",
#            "CarrefourBR")
# #pegar p�ginas
# posts <- getPage(pages[1], token = token, n = 10, reactions = T)
# for(i in 2:length(pages)){
#   posts <- merge(posts, getPage(pages[i], token = token, n = 10, reactions = T), all = T)
# }
# 
# #cria coluna com nome da empresa do post
# comments <- getPost(posts$id[1], token = token, n = 5)
# comments <- comments$comments
# comments$empresa <- "NULL"
# for(i in 2:nrow(posts)){
#   print(i)
#   t <- getPost(posts$id[i], token = token, n = 5)
#   p <- t$post$from_name[1]
#   t <- t$comments
#   if(nrow(t) != 0)
#     t$empresa <- p
#   comments <- merge(comments, t, all = T)
# }
# 
# #avaliar manualmente
# comments$avaliacao <- "NULL"
# for(i in 1:nrow(comments)){
#   print(comments$message[i])
#   print("---------------------------------------------------------------------------")
#   print(paste("EMPRESA: ", comments$empresa[i]))
#   opcao <- scan(nmax = 1)
#   if(opcao == 1)
#     comments$avaliacao[i] <- "reclamacao"
#   else if(opcao==2)
#     comments$avaliacao[i] <- "duvida"
#   else if(opcao==3)
#     comments$avaliacao[i] <- "solucao"
#   else
#     comments$avaliacao[i] <- "neutro"
# }
# 
# #exportar como xlsx
# write.xlsx(comments, "C:/Users/teste/Documents/R/comentarios.xlsx")
# write.xlsx(posts, "C:/Users/teste/Documents/R/posts.xlsx")


