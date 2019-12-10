install.packages("devtools")
library(devtools)
install_github("samiranghoshroy/HotelAnalysis")
EnsurePackage <- function(x) {
  x <- as.character(x)
  
  if(!require(x,character.only = T)){
    install.packages(pkgs = x,repos = "http://cran.r-project.org")
    require(x,character.only = T)}
}
##Reading csv files
EnsurePackage("data.table")
hyatt_df1<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201402.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                                   174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                                   145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                                   156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                                   215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                                  40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))



#cleaning based on likelihood to recommend
clean_df1<- hyatt_df1[!(hyatt_df1$Likelihood_Recommend_H == ""),]
#cleaning empty spaces in nps type column
clean_df1<- hyatt_df1[!(hyatt_df1$NPS_Type == ""),]
#cleaning based on empty spaces in country_pl column
clean_df1<-clean_df1[!(clean_df1$Country_PL == ""),]
#removing unclean dataset
rm(hyatt_df1)
#repeating same process for all files
hyatt_df2<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201403.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df2<-hyatt_df2[!(hyatt_df2$Likelihood_Recommend_H== ""),]
clean_df2<-hyatt_df2[!(hyatt_df2$NPS_Type== ""),]
clean_df2<-clean_df2[!(clean_df2$Country_PL == ""),]
rm(hyatt_df2)
hyatt_df3<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201404.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df3<-hyatt_df3[!(hyatt_df3$Likelihood_Recommend_H== ""),]
clean_df3<-hyatt_df3[!(hyatt_df3$NPS_Type== ""),]
clean_df3<-clean_df3[!(clean_df3$Country_PL == ""),]
rm(hyatt_df3)
hyatt_df4<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201405.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df4<-hyatt_df4[!(hyatt_df4$Likelihood_Recommend_H== ""),]
clean_df4<-hyatt_df4[!(hyatt_df4$NPS_Type== ""),]
clean_df4<-clean_df4[!(clean_df4$Country_PL == ""),]
rm(hyatt_df4)
hyatt_df5<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201406.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df5<-hyatt_df5[!(hyatt_df5$Likelihood_Recommend_H== ""),]
clean_df5<-hyatt_df5[!(hyatt_df5$NPS_Type== ""),]
clean_df5<-clean_df5[!(clean_df5$Country_PL == ""),]
rm(hyatt_df5)
hyatt_df6<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201407.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df6<-hyatt_df6[!(hyatt_df6$Likelihood_Recommend_H== ""),]
clean_df6<-hyatt_df6[!(hyatt_df6$NPS_Type== ""),]
clean_df6<-clean_df6[!(clean_df6$Country_PL == ""),]
rm(hyatt_df6)
hyatt_df7<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201408.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df7<-hyatt_df7[!(hyatt_df7$Likelihood_Recommend_H== ""),]
clean_df7<-hyatt_df7[!(hyatt_df7$NPS_Type== ""),]
clean_df7<-clean_df7[!(clean_df7$Country_PL == ""),]
rm(hyatt_df7)
hyatt_df8<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201409.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df8<-hyatt_df8[!(hyatt_df8$Likelihood_Recommend_H== ""),]
clean_df8<-hyatt_df8[!(hyatt_df8$NPS_Type== ""),]
clean_df8<-clean_df8[!(clean_df8$Country_PL == ""),]
rm(hyatt_df8)
hyatt_df9<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201410.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                               174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                               145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                               156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                               215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                               40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df9<-hyatt_df9[!(hyatt_df9$Likelihood_Recommend_H== ""),]
clean_df9<-hyatt_df9[!(hyatt_df9$NPS_Type== ""),]
clean_df9<-clean_df9[!(clean_df9$Country_PL == ""),]
rm(hyatt_df9)
hyatt_df10<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201411.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                                174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                                145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                                156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                                215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                                40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))

clean_df10<-hyatt_df10[!(hyatt_df10$Likelihood_Recommend_H== ""),]
clean_df10<-hyatt_df10[!(hyatt_df10$NPS_Type== ""),]
clean_df10<-clean_df10[!(clean_df10$Country_PL == ""),]
rm(hyatt_df10)
hyatt_df11<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201412.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                                174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                                145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                                156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                                215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                                40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))
clean_df11<-hyatt_df11[!(hyatt_df11$Likelihood_Recommend_H== ""),]
clean_df11<-hyatt_df11[!(hyatt_df11$NPS_Type== ""),]
clean_df11<-clean_df11[!(clean_df11$Country_PL == ""),]
rm(hyatt_df11)
hyatt_df12<- fread('C:\\SAM-IM\\IST687\\PROJECT DATA\\IST687-data\\out-201501.csv' , select = c(9 ,46 ,54 ,55 ,56 ,65 ,161 ,162 ,163 ,164 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,
                                                                                                174 ,175 ,176 ,177 ,178 ,184 ,182 ,2 ,32 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,
                                                                                                145 ,13 ,23 ,66 ,77 ,110 ,126 ,127 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,
                                                                                                156 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,
                                                                                                215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,232 ,12 ,21 ,22 ,24 ,
                                                                                                40 ,41 ,59 ,64 ,78 ,83 ,89 ,131 ,132 ,38 ,75 ,76 ,231,105:109))




clean_df12<-hyatt_df12[!(hyatt_df12$Likelihood_Recommend_H== ""),]
clean_df12<-hyatt_df12[!(hyatt_df12$NPS_Type== ""),]
clean_df12<-clean_df12[!(clean_df12$Country_PL == ""),]
rm(hyatt_df12)


#compiling all csv files into one data frame
Hyatt_Bind<-rbind(clean_df1,clean_df2,clean_df3,clean_df4,clean_df5,clean_df6,clean_df7,clean_df8,clean_df9,clean_df10,clean_df11,clean_df12)
#renaming indices of row numbers
rownames(Hyatt_Bind)
#saving dataframe into csv file
write.csv(Hyatt_Bind,file="sam.csv")
#removing individual clean files to free RAM
rm(clean_df1,clean_df2,clean_df3,clean_df4,clean_df5,clean_df6,clean_df7,clean_df8,clean_df9,clean_df10,clean_df11,clean_df12)
#re-reading csv file
final<-fread("sam.csv")
#storing into test variable
hyatt<-final
#sqldf package
EnsurePackage("sqldf")
#taking only observations related to USA
hyatt<-sqldf("select * from hyatt where Country_PL=='United States'")
#taking only observations related to california
hyattcali<-sqldf("select * from hyatt where State_PL=='California'")
#removing original complied data
rm(Hyatt_Bind)

EnsurePackage <- function(x) {
  x <- as.character(x)
  
  if(!require(x,character.only = T)){
    install.packages(pkgs = x,repos = "http://cran.r-project.org")
    require(x,character.only = T)}
}
#categorizing likelihood to recommend into low medium and high
hyattcali$category[hyattcali$Likelihood_Recommend_H<6] <- "low"
hyattcali$category[hyattcali$Likelihood_Recommend_H>6 & hyattcali$Likelihood_Recommend_H < 9] <- "med"
hyattcali$category[hyattcali$Likelihood_Recommend_H>8] <- "high"
Amenity<-hyattcali[,c(4:13,18,19,21:29,31:36,40:42,45:57,76,84,96:106)]
EnsurePackage("ggplot2")
Amenity<-hyattcali
#Laundry Plot
Laundry_Plot <-ggplot(Amenity[Amenity$Laundry_PL!='',], aes(NPS_Type,fill=Laundry_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Laundry Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Laundry_Plot
#Business Center Plot
Business_Plot<-ggplot(Amenity[Amenity$`Business Center_PL`!='',], aes(NPS_Type,fill=`Business Center_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Business Center Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Business_Plot
#Restaurant Plot
Restaurant_Plot<-ggplot(Amenity[Amenity$Restaurant_PL!='',], aes(NPS_Type,fill=Restaurant_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Restaurant Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Restaurant_Plot
#Pool Indoor/Outdoor Plot
Poolin_Plot<-ggplot(Amenity[Amenity$`Pool-Indoor_PL`!='',], aes(NPS_Type,fill=`Pool-Indoor_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Indoor Pool Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Poolin_Plot
Poolout_Plot<-ggplot(Amenity[Amenity$`Pool-Outdoor_PL`!='',], aes(NPS_Type,fill=`Pool-Outdoor_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Outdoor Pool Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Poolout_Plot
#Spa Plot
Spa_Plot<-ggplot(Amenity[Amenity$Spa_PL!='',], aes(NPS_Type,fill=Spa_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Spa Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Spa_Plot
#Shuttle Plot
Shuttle_Plot<-ggplot(Amenity[Amenity$`Shuttle Service_PL`!='',], aes(NPS_Type,fill=`Shuttle Service_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Shuttle Service Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Shuttle_Plot
#Fitness Center Plot
Fitness_Plot<-ggplot(Amenity[Amenity$`Fitness Trainer_PL`!='',], aes(NPS_Type,fill=`Fitness Trainer_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Fitness Trainer Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Fitness_Plot
#Valet Parking Plot
Valet_Plot<-ggplot(Amenity[Amenity$`Valet Parking_PL`!='',], aes(NPS_Type,fill=`Valet Parking_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Valet Parking Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Valet_Plot
#Resort Plot
Resort_Plot<-ggplot(Amenity[Amenity$Resort_PL!='',], aes(NPS_Type,fill=Resort_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Resort Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Resort_Plot
#Corridor Plot
Corridor_Plot<-ggplot(Amenity[Amenity$`Indoor Corridors_PL`!='',], aes(NPS_Type,fill=`Indoor Corridors_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Indoor Corridors Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Corridor_Plot
#Ski Plot
Ski_Plot<-ggplot(Amenity[Amenity$Ski_PL!='',], aes(NPS_Type,fill=Ski_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Ski Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Ski_Plot
#MiniBar Plot
Minibar_Plot<-ggplot(Amenity[Amenity$`Mini-Bar_PL`!='',], aes(NPS_Type,fill=`Mini-Bar_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Mini Bar Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Minibar_Plot
#Suite Plot
Allsuites_Plot<-ggplot(Amenity[Amenity$`All Suites_PL`!='',], aes(NPS_Type,fill=`All Suites_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("All Suites Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Allsuites_Plot
#BellStaff Plot
Bell_Plot<-ggplot(Amenity[Amenity$`Bell Staff_PL`!='',], aes(NPS_Type,fill=`Bell Staff_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Bell Staff Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Bell_Plot
#Boutique Plot
Boutique_Plot<-ggplot(Amenity[Amenity$Boutique_PL!='',], aes(NPS_Type,fill=Boutique_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Boutique Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Boutique_Plot
#Conference Plot
Conference_Plot<-ggplot(Amenity[Amenity$Conference_PL!='',], aes(NPS_Type,fill=Conference_PL))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Conference Room Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Conference_Plot
#DryCleaning Plot
Drycleaning_Plot<-ggplot(Amenity[Amenity$`Dry-Cleaning_PL`!='',], aes(NPS_Type,fill=`Dry-Cleaning_PL`))+scale_fill_manual("legend",values=c("N"="red","Y"="green")) + geom_bar(position="dodge", width = 0.6) + ggtitle("Dry Cleaning Vs NPS Type Count") +labs(x="NPS Type", y="Count") + theme(plot.title = element_text(hjust = 0.5))
Drycleaning_Plot
####continuous bar plots
cont1<- ggplot(data=Amenity, aes(x=as.numeric(Tranquility_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="red") +
  labs(y="LTR",x="Tranquility")
cont1
cont2<- ggplot(data=Amenity, aes(x=as.numeric(Overall_Sat_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="blue") +
  labs(y="LTR",x="Overall Satisfaction")
cont2
cont3<- ggplot(data=Amenity, aes(x=as.numeric(Amenity$Check_In_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="green") +
  labs(y="LTR",x="Check In")
cont3
cont4<- ggplot(data=Amenity, aes(x=as.numeric(Amenity$Staff_Cared_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="yellow") +
  labs(y="LTR",x="Staff Cared")
cont4
cont5<- ggplot(data=Amenity, aes(x=as.numeric(Amenity$Condition_Hotel_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="purple") +
  labs(y="LTR",x="Condition")
cont5
cont6<- ggplot(data=Amenity, aes(x=as.numeric(Amenity$Customer_SVC_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="lightblue") +
  labs(y="LTR",x="Customer Service")
cont6
cont7<- ggplot(data=Amenity, aes(x=as.numeric(Amenity$Internet_Sat_H),y=Likelihood_Recommend_H)) +
  geom_bar(stat="summary",fun.data="mean_se", color="black", fill="orange") +
  labs(y="LTR",x="Internet")
cont7


#Linear Models of LTR vs Metrics
EnsurePackage("lm")
#LTR VS Overall Sat
model1<-lm(formula=Likelihood_Recommend_H~Overall_Sat_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Overall_Sat_H,xlab="Overall Satisfaction",ylab="Likelihood to Recommend",data=Amenity)
abline(model1)
summary(model1)
#0.8032
#LTR vs guest room
model2<-lm(formula=Likelihood_Recommend_H~Guest_Room_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Guest_Room_H,xlab="Guest Room Satisfaction",ylab="Likelihood to Recommend",data=Amenity)
abline(model2)
summary(model2)
#0.5032
#LTR Vs Tranquility
model3<-lm(formula=Likelihood_Recommend_H~Tranquility_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Tranquility_H,xlab="Tranquility",ylab="Likelihood to Recommend",data=Amenity)
abline(model3)
summary(model3)
#LTR Vs Condition Hotel
model4<-lm(formula=Likelihood_Recommend_H~Condition_Hotel_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Condition_Hotel_H,xlab="Hotel Condition",ylab="Likelihood to Recommend",data=Amenity)
abline(model4)
summary(model4)
#0.4488
#LTR VS customer service
model5<-lm(formula=Likelihood_Recommend_H~Customer_SVC_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Customer_SVC_H,xlab="Customer Service",ylab="Likelihood to Recommend",data=Amenity)
abline(model5)
summary(model5)
#0.4715
#LTR Vs Staff_Cared_H
model6<-lm(formula=Likelihood_Recommend_H~Staff_Cared_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Staff_Cared_H,xlab="Staff Cared",ylab="Likelihood to Recommend",data=Amenity)
abline(model6)
summary(model6)
#LTR Vs Internet_Sat_H
model7<-lm(formula=Likelihood_Recommend_H~Internet_Sat_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Internet_Sat_H,xlab="Internet Satisfaction",ylab="Likelihood to Recommend",data=Amenity)
abline(model7)
summary(model7)
#LTR Vs Check_In_H
model8<-lm(formula=Likelihood_Recommend_H~Check_In_H,data=Amenity)
plot(Amenity$Likelihood_Recommend_H~Amenity$Check_In_H,xlab="Check In Metric",ylab="Likelihood to Recommend",data=Amenity)
abline(model8)
summary(model8)
#LTR vs all
model9<-lm(formula=Likelihood_Recommend_H~Check_In_H+Overall_Sat_H+Guest_Room_H+Tranquility_H+Condition_Hotel_H+Customer_SVC_H+Staff_Cared_H,data=Amenity)
summary(model9)

#INTERNET LM MODEL


#Association Rules for factors affecting detractors
EnsurePackage("arules")
EnsurePackage("arulesViz")
EnsurePackage("scales")
aruleset<-Amenity[,c(12,101,25,32,42,108,36,30,98,99,84,96)]
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$Laundry_PL),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$`Business Center_PL`),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$`Pool-Outdoor_PL`),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$NPS_Type),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$POV_H),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$category),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$Restaurant_PL),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$`Valet Parking_PL`),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$`All Suites_PL`),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$`Bell Staff_PL`),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$City_PL),,drop=FALSE] )
aruleset <- droplevels(aruleset[!grepl("^\\s*$", aruleset$Brand_PL),,drop=FALSE] )
t<-as.data.frame(unclass(aruleset))
aruleset<-t
str(aruleset)

#rules
rule1<-apriori(aruleset,parameter=list(support=0.1,confidence=0.7,maxlen=5),appearance=list(rhs=c("NPS_Type=Promoter"),default="lhs"))
plot(rule1)
plot(rule1,method="two-key plot")
plot(rule1, method = "paracoord")
plot(rule1, method = "graph", engine = "htmlwidget")
sortedrule1<-sort(rule1,by="lift",decreasing=TRUE)
dfarules<-as(sortedrule1,"data.frame")
write(sortedrule1,file="arule1.csv",sep=",",quote=TRUE,row.names=FALSE)
#Changing max length to 2 
rule2<-apriori(aruleset,parameter=list(support=0.05,confidence=0.6,maxlen=3),appearance=list(rhs=c("NPS_Type=Promoter"),default="lhs"))
plot(rule2)
plot(rule2,method="two-key plot")
plot(rule2, method = "paracoord")
plot(rule2, method = "graph", engine = "htmlwidget")
sortedrule2<-sort(rule2,by="lift",decreasing=TRUE)
dfarules<-as(sortedrule2,"data.frame")
write(sortedrule2,file="arule2.csv",sep=",",quote=TRUE,row.names=FALSE)
#checking detractors
rule3<-apriori(aruleset,parameter=list(support=0.05,confidence=0.01),appearance=list(rhs=c("NPS_Type=Detractor"),default="lhs"))
plot(rule3)
plot(rule3,method="two-key plot")
plot(rule3, method = "paracoord")
plot(rule3, method = "graph", engine = "htmlwidget")
sortedrule3<-sort(rule3,by="lift",decreasing=TRUE)
dfarules<-as(sortedrule3,"data.frame")
write(sortedrule3,file="arule3.csv",sep=",",quote=TRUE,row.names=FALSE)
#Using the high r-sq variables we create svm models
EnsurePackage("kernlab")
hyattcali$NPS_Type2[hyattcali$Likelihood_Recommend_H<7] <- "Won't Recommend"
hyattcali$NPS_Type2[hyattcali$Likelihood_Recommend_H>7] <- "Will Recommend"
hyatt_svm<-hyattcali[,c(12,101,25,32,42,108,36,30,98,99,84,96,5,7,21,24,33:35,47,48,50)]
hyatt_svm<-hyatt_svm[,c(-4,-5,-6,-11,-12,-9)]
hyatt_svm$NPS_Type2<-hyattcali[,c(109)]


hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Laundry_PL),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$`Business Center_PL`),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$`Pool-Outdoor_PL`),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$NPS_Type2),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Restaurant_PL),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$`Valet Parking_PL`),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$`Bell Staff_PL`),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Likelihood_Recommend_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Guest_Room_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Tranquility_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Condition_Hotel_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Staff_Cared_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Internet_Sat_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$Check_In_H),,drop=FALSE] )
hyatt_svm <- droplevels(hyatt_svm[!grepl("^\\s*$", hyatt_svm$`F&B_Overall_Experience_H`),,drop=FALSE] )

t<-as.data.frame(unclass(hyatt_svm))
hyatt_svm<-t
head(model.matrix(~.,hyatt_svm))
hyatt_svm<-hyatt_svm[,c(-8)]
hyatt_svm$Laundry_PL<- as.data.frame(ifelse(hyatt_svm$Laundry_PL=="Y",1,-1))
hyatt_svm$Business.Center_PL<- as.data.frame(ifelse(hyatt_svm$Business.Center_PL=="Y",1,-1))
hyatt_svm$Pool.Outdoor_PL<- as.data.frame(ifelse(hyatt_svm$Pool.Outdoor_PL=="Y",1,-1))
hyatt_svm$Restaurant_PL<- as.data.frame(ifelse(hyatt_svm$Restaurant_PL=="Y",1,-1))
hyatt_svm$Valet.Parking_PL<- as.data.frame(ifelse(hyatt_svm$Valet.Parking_PL=="Y",1,-1))
hyatt_svm$Bell.Staff_PL<- as.data.frame(ifelse(hyatt_svm$Bell.Staff_PL=="Y",1,-1))
hyatt_svm$Likelihood_Recommend_H<- as.data.frame(ifelse(hyatt_svm$Likelihood_Recommend_H>8,1,-1))
hyatt_svm$NPS_Type2<- as.data.frame(ifelse(hyatt_svm$NPS_Type2=="Will Recommend",1,-1))
hyatt_svm$Guest_Room_H<- as.data.frame(ifelse(hyatt_svm$Guest_Room_H>5,1,-1))
hyatt_svm$Tranquility_H<- as.data.frame(ifelse(hyatt_svm$Tranquility_H>5,1,-1))
hyatt_svm$Condition_Hotel_H<- as.data.frame(ifelse(hyatt_svm$Condition_Hotel_H>5,1,-1))
hyatt_svm$Customer_SVC_H<- as.data.frame(ifelse(hyatt_svm$Customer_SVC_H>5,1,-1))
hyatt_svm$Staff_Cared_H<- as.data.frame(ifelse(hyatt_svm$Staff_Cared_H>5,1,-1))
hyatt_svm$Internet_Sat_H<- as.data.frame(ifelse(hyatt_svm$Internet_Sat_H>5,1,-1))
hyatt_svm$Check_In_H<- as.data.frame(ifelse(hyatt_svm$Check_In_H>5,1,-1))
hyatt_svm$F.B_Overall_Experience_H<- as.data.frame(ifelse(hyatt_svm$F.B_Overall_Experience_H>5,1,-1))
str(hyatt_svm)
unlist(hyatt_svm)
###
hyatt_svm<-hyattcali[,c(108,109,47,48,50,33:35,42,8,21,24,5)]
hyatt_svm<-data.frame(hyatt_svm)
hyatt_svm <- hyatt_svm[Reduce(`&`, lapply(hyatt_svm, function(x) !(is.na(x)|x==""))),]
#latest svm
hyatt_svm<-hyatt_svm[,c(-13)]
hyatt_svm$Internet_Sat_H[hyatt_svm$Internet_Sat_H<6] <- "low"
hyatt_svm$Internet_Sat_H[hyatt_svm$Internet_Sat_H>=6]<-"high"
#
hyatt_svm$Check_In_H[hyatt_svm$Check_In_H<6] <- "low"
hyatt_svm$Check_In_H[hyatt_svm$Check_In_H>=6] <- "high"
#
hyatt_svm$F.B_Overall_Experience_H[hyatt_svm$F.B_Overall_Experience_H<6] <- "low"
hyatt_svm$F.B_Overall_Experience_H[hyatt_svm$F.B_Overall_Experience_H>=6] <- "high"

#
hyatt_svm$Condition_Hotel_H[hyatt_svm$Condition_Hotel_H<6] <- "low"
hyatt_svm$Condition_Hotel_H[hyatt_svm$Condition_Hotel_H>=6] <- "high"

#
hyatt_svm$Customer_SVC_H[hyatt_svm$Customer_SVC_H<8] <- "low"
hyatt_svm$Customer_SVC_H[hyatt_svm$Customer_SVC_H>=8||hyatt_svm$Customer_SVC_H==10] <- "high"

#
hyatt_svm$Staff_Cared_H[hyatt_svm$Staff_Cared_H<8] <- "low"
hyatt_svm$Staff_Cared_H[hyatt_svm$Staff_Cared_H>=8||hyatt_svm$Staff_Cared_H==10] <- "high"

#
hyatt_svm$Overall_Sat_H[hyatt_svm$Overall_Sat_H<8] <- "low"
hyatt_svm$Overall_Sat_H[hyatt_svm$Overall_Sat_H>=8||hyatt_svm$Overall_Sat_H==10] <- "high"

#
hyatt_svm$Guest_Room_H[hyatt_svm$Guest_Room_H<8] <- "low"
hyatt_svm$Guest_Room_H[hyatt_svm$Guest_Room_H>=8||hyatt_svm$Guest_Room_H==10] <- "high"

#
hyatt_svm$Tranquility_H[hyatt_svm$Tranquility_H<8] <- "low"
hyatt_svm$Tranquility_H[hyatt_svm$Tranquility_H>=8||hyatt_svm$Tranquility_H==10] <- "high"
hyatt_svm$category<-as.factor(as.character(hyatt_svm$category))
hyatt_svm$NPS_Type2<-as.factor(as.character(hyatt_svm$NPS_Type2))
hyatt_svm$Internet_Sat_H<-as.factor(as.character(hyatt_svm$Internet_Sat_H))
hyatt_svm$Check_In_H<-as.factor(as.character(hyatt_svm$Check_In_H))
hyatt_svm$F.B_Overall_Experience_H<-as.factor(as.character(hyatt_svm$F.B_Overall_Experience_H))
hyatt_svm$Condition_Hotel_H<-as.factor(as.character(hyatt_svm$Condition_Hotel_H))
hyatt_svm$Customer_SVC_H<-as.factor(as.character(hyatt_svm$Customer_SVC_H))
hyatt_svm$Staff_Cared_H<-as.factor(as.character(hyatt_svm$Staff_Cared_H))
hyatt_svm$POV_H<-as.factor(as.character(hyatt_svm$POV_H))
hyatt_svm$Overall_Sat_H<-as.factor(as.character(hyatt_svm$Overall_Sat_H))
hyatt_svm$Guest_Room_H<-as.factor(as.character(hyatt_svm$Guest_Room_H))
hyatt_svm$Tranquility_H<-as.factor(as.character(hyatt_svm$Tranquility_H))
hyatt_svm$Likelihood_Recommend_H<-as.factor(as.character(hyatt_svm$Likelihood_Recommend_H))

str(hyatt_svm)
rownames(hyatt_svm)<-NULL
randIndex<-sample(1:nrow(hyatt_svm))
rI<-nrow(hyatt_svm)
cutPoint2_3<-floor(2*rI/3)
cutPoint2_3
trainData<-hyatt_svm[randIndex[1:cutPoint2_3],]
testData<-hyatt_svm[randIndex[(cutPoint2_3+1):rI],]
str(trainData)
SVM<-ksvm(category~POV_H,data=trainData,kernel="rbfdot",kpar="automatic",C=5,cross=3,prob.model=TRUE)

SVM
SVMP<-predict(SVM,testData,type="votes")

SVMP
str(SVMP)
testData$category<-as.integer(SVMP)
comp<-data.frame(testData[,13],SVMP[,1])
names(comp)
rmse(comp[,1],comp[,2])
SVMP<-paste(SVMP[1:4965])
as.matrix(SVMP)
cfm <- confusionMatrix(SVMP, testData$category)

###

hyatt_svm$category<-as.character((hyatt_svm$category))
hyatt_svm$NPS_Type2<-as.character((hyatt_svm$NPS_Type2))
hyatt_svm$POV_H<-as.character((hyatt_svm$POV_H))
#
hyatt_svm$category[which(hyatt_svm$category == "high")] <- "1"
hyatt_svm$category[which(hyatt_svm$category == "med")] <- "2"
hyatt_svm$category[which(hyatt_svm$category == "low")] <- "3"
#
hyatt_svm$POV_H[which(hyatt_svm$POV_H == "Combination of both business and leisure")] <- "1"
hyatt_svm$POV_H[which(hyatt_svm$POV_H == "Business")] <- "2"
hyatt_svm$POV_H[which(hyatt_svm$POV_H == "Leisure")] <- "3"
#
hyatt_svm$NPS_Type2[which(hyatt_svm$NPS_Type2 == "Will Recommend")] <- "1"
hyatt_svm$NPS_Type2[which(hyatt_svm$NPS_Type2 == "Won't Recommend")] <- "2"
#
hyatt_svm$category<-as.numeric(hyatt_svm$category)
hyatt_svm$NPS_Type2<-as.numeric(hyatt_svm$NPS_Type2)
hyatt_svm$Internet_Sat_H<-as.numeric(hyatt_svm$Internet_Sat_H)
hyatt_svm$Check_In_H<-as.numeric(hyatt_svm$Check_In_H)
hyatt_svm$F.B_Overall_Experience_H<-as.numeric(hyatt_svm$F.B_Overall_Experience_H)
hyatt_svm$Condition_Hotel_H<-as.numeric(hyatt_svm$Condition_Hotel_H)
hyatt_svm$Customer_SVC_H<-as.numeric(hyatt_svm$Customer_SVC_H)
hyatt_svm$Staff_Cared_H<-as.numeric(hyatt_svm$Staff_Cared_H)
hyatt_svm$POV_H<-as.numeric(hyatt_svm$POV_H)
hyatt_svm$Overall_Sat_H<-as.numeric(hyatt_svm$Overall_Sat_H)
hyatt_svm$Guest_Room_H<-as.numeric(hyatt_svm$Guest_Room_H)
hyatt_svm$Tranquility_H<-as.numeric(hyatt_svm$Tranquility_H)
hyatt_svm$Likelihood_Recommend_H<-as.numeric(hyatt_svm$Likelihood_Recommend_H)
str(hyatt_svm)
#
hyatt_svm1 <- hyatt_svm[sample(nrow(hyatt_svm), 15000), ]
row.names(hyatt_svm1) <- NULL

EnsurePackage("kernlab")
EnsurePackage("Metrics")
EnsurePackage("caret")
EnsurePackage("e1071")
EnsurePackage("data.table")
hyatt_svm <- hyatt_svm[Reduce(`&`, lapply(hyatt_svm1, function(x) !(is.na(x)|x==""))),]
randIndex<-sample(1:nrow(hyatt_svm1))
rI<-14881
cutPoint2_3<-floor(2*rI/3)
cutPoint2_3
trainData<-hyatt_svm1[randIndex[1:cutPoint2_3],]
testData<-hyatt_svm1[randIndex[(cutPoint2_3+1):rI],]
trainData<-trainData[complete.cases(trainData),]
SVM<-ksvm(category~Condition_Hotel_H+Customer_SVC_H+Guest_Room_H+POV_H+Staff_Cared_H,data=trainData,kernel="rbfdot",kpar="automatic",C=5,cross=3,prob.model=TRUE)
SVM
testData<-testData[complete.cases(testData),]

SVMP<-predict(SVM,testData,type="votes")
SVMP

str(SVMP)
comp<-data.frame(testData[,13],SVMP[,1])
names(comp)
rmse(comp[,1],comp[,2])
SVMP<-paste(SVMP[1:4965])
as.matrix(SVMP)
testData$Likelihood_Recommend_H<-as.factor(testData$category)
as.factor(SVMP)
cfm <- confusionMatrix(SVMP, testData$category)

#



###
#making sample set from data

#
##check nps_type na's
lrcategory<-data.frame(tempamenity$Likelihood_Recommend_H,tempamenity$NPS_Type)
which(is.na(lrcategory$tempamenity.NPS_Type))
lrcategory[complete.cases(lrcategory),]
sum(is.na(lrcategory$tempamenity.NPS_Type))

#Check for NA's in likelihood to recommend column
EnsurePackage("sqldf")
sqldf("select count(*) from Hyatt_Bind where Likelihood_Recommend_H=='NA'")
sum(is.na(Hyatt_Bind$Likelihood_Recommend_H))
##FINAL SVM
hyattcali$NPS_Type2[hyattcali$Likelihood_Recommend_H<7] <- "Won't Recommend"
hyattcali$NPS_Type2[hyattcali$Likelihood_Recommend_H>7] <- "Will Recommend"
hyatt_svm<-hyattcali[,c(108,109,47,48,50,33:35,42,8,21,24,5)]
hyatt_svm<-data.frame(hyatt_svm)
hyatt_svm <- hyatt_svm[Reduce(`&`, lapply(hyatt_svm, function(x) !(is.na(x)|x==""))),]
#
#
hyatt_svm$POV_H<-as.factor(hyatt_svm$POV_H)
hyatt_svm$category<-as.factor(hyatt_svm$category)
str(hyatt_svm)
x<-subset(hyatt_svm,select=-category)
y<-hyatt_svm$category
svm_model<-svm(category~.,data=hyatt_svm)
summary(svm_model)
pred<-predict(svm_model,x)
table(pred,y)
ctable <- as.table(matrix(c(21724,0,2,4117), nrow = 2, byrow = TRUE))
fourfoldplot(ctable, color = c("#CC6666", "#99CC99"),
             conf.level = 0, margin = 1, main = "Confusion Matrix")

###
x<-subset(hyatt_svm,select=-POV_H)
y<-hyatt_svm$POV_H
svm_model<-svm(POV_H~.,data=hyatt_svm)
summary(svm_model)
pred<-predict(svm_model,x)
table(pred,y)
ctable <- as.table(matrix(c(7814,5679,4800,6029), nrow = 2, byrow = TRUE))
fourfoldplot(ctable, color = c("#CC6666", "#99CC99"),
             conf.level = 0, margin = 1, main = "Confusion Matrix")
###
hyatt_neural2<-hyattcali[,c(12,101,25,32,42,108,36,30,98,99,84,96,5,7,21,24,33:35,47,48,50)]
hyatt_neural2<-hyatt_neural[,c(-11,-12)]
hyatt_neural2 <- hyatt_neural[Reduce(`&`, lapply(hyatt_neural, function(x) !(is.na(x)|x==""))),]
hyatt_neural2$category[which(hyatt_neural$category == "high")] <- "10"
hyatt_neural2$category[which(hyatt_neural$category == "med")] <- "5"
hyatt_neural2$category[which(hyatt_neural$category == "low")] <- "1"

hyatt_neural2$POV_H[which(hyatt_neural$POV_H == "Combination of both business and leisure")] <- "1"
hyatt_neural2$POV_H[which(hyatt_neural$POV_H == "Business")] <- "2"
hyatt_neural2$POV_H[which(hyatt_neural$POV_H == "Leisure")] <- "3"

hyatt_neural2$NPS_Type[which(hyatt_neural2$NPS_Type == "Promoter")] <- "1"
hyatt_neural2$NPS_Type[which(hyatt_neural2$NPS_Type == "Passive")] <- "2"
hyatt_neural2$NPS_Type[which(hyatt_neural2$NPS_Type == "Detractor")] <- "3"


hyatt_neural2$Laundry_PL<- factor ( with ( hyatt_neural2, ifelse ( ( Laundry_PL=="Y" ), 10 , 1 ) ) )
hyatt_neural2$`Business Center_PL`<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$`Business Center_PL`=="Y" ), 10 , 1 ) ) )
hyatt_neural2$`Pool-Outdoor_PL`<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$`Pool-Outdoor_PL`=="Y" ), 10 , 1 ) ) )
hyatt_neural2$Restaurant_PL<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$Restaurant_PL=="Y" ), 10 , 1 ) ) )
hyatt_neural2$`Valet Parking_PL`<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$`Valet Parking_PL`=="Y" ), 10 , 1 ) ) )
hyatt_neural2$`All Suites_PL`<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$`All Suites_PL`=="Y" ), 10 , 1 ) ) )
hyatt_neural2$`Bell Staff_PL`<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$`Bell Staff_PL`=="Y" ), 10 , 1 ) ) )
hyatt_neural2$Golf_PL<- factor ( with ( hyatt_neural2, ifelse ( ( hyatt_neural2$Golf_PL=="Y" ), 10 , 1 ) ) )


hyatt_neural2 <- mutate_all(hyatt_neural2, function(x) as.numeric(as.character(x)))
na.omit(hyatt_neural2)
samplesize = 0.60 * nrow(hyatt_neural2)
set.seed(80)
index = sample( seq_len ( nrow ( hyatt_neural2 ) ), size = samplesize )

# Create training and test set
datatrain = hyatt_neural2[ index, ]
datatest = hyatt_neural2[ -index, ]
max = apply(hyatt_neural2 , 2 , max)
min = apply(hyatt_neural2, 2 , min)
scaled = as.data.frame(scale(hyatt_neural2, center = min, scale = max - min))
#

str(datatrain)

EnsurePackage("neuralnet")

NN = neuralnet(NPS_Type~POV_H, datatrain, hidden = 3 , linear.output = T )
