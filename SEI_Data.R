###### Data read ######
# http://paletton.com/#uid=53I0+0kohp7ewyfjFs6rnknvZfk
library(readxl)
SEI_Data <- read_excel("SEI_Data.xlsx")
# attach(SEI_Data)

Faculty_Experience <- aggregate(SEI_Data$Mean11, list(SEI_Data$faculty, SEI_Data$experience), mean)
colnames(Faculty_Experience)[colnames(Faculty_Experience) == 'Group.1'] <- 'Faculty'
colnames(Faculty_Experience)[colnames(Faculty_Experience) == 'Group.2'] <- 'Experience'
colnames(Faculty_Experience)[colnames(Faculty_Experience) == 'x'] <- 'Mean11'
Faculty_Experience$Faculty <- as.factor(Faculty_Experience$Faculty)
Faculty_Experience$Experience <- as.factor(Faculty_Experience$Experience)
Faculty_Experience$Mean11 <- as.numeric(Faculty_Experience$Mean11)
Faculty_Experience <- data.frame(Faculty_Experience)

Faculty_Enrollment <- aggregate(SEI_Data$Mean11, list(SEI_Data$faculty, SEI_Data$enrollment), mean)
colnames(Faculty_Enrollment)[colnames(Faculty_Enrollment) == 'Group.1'] <- 'Faculty'
colnames(Faculty_Enrollment)[colnames(Faculty_Enrollment) == 'Group.2'] <- 'Enrollment'
colnames(Faculty_Enrollment)[colnames(Faculty_Enrollment) == 'x'] <- 'Mean11'
Faculty_Enrollment$Faculty <- as.factor(Faculty_Enrollment$Faculty)
Faculty_Enrollment$Enrollment <- as.factor(Faculty_Enrollment$Enrollment)
Faculty_Enrollment$Mean11 <- as.numeric(Faculty_Enrollment$Mean11)
Faculty_Enrollment <- data.frame(Faculty_Enrollment)

Faculty_Gender <- aggregate(SEI_Data$Mean11, list(SEI_Data$faculty, SEI_Data$gender), mean)
colnames(Faculty_Gender)[colnames(Faculty_Gender) == 'Group.1'] <- 'Faculty'
colnames(Faculty_Gender)[colnames(Faculty_Gender) == 'Group.2'] <- 'Gender'
colnames(Faculty_Gender)[colnames(Faculty_Gender) == 'x'] <- 'Mean11'
Faculty_Gender$Faculty <- as.factor(Faculty_Gender$Faculty)
Faculty_Gender$Gender <- as.factor(Faculty_Gender$Gender)
Faculty_Gender$Mean11 <- as.numeric(Faculty_Gender$Mean11)
Faculty_Gender <- data.frame(Faculty_Gender)

###### Descriptive Analysis ######

library(plotly)
plot1 <- plot_ly(x = Faculty_Experience$Faculty, 
                 y = Faculty_Experience$Mean11, 
                 color = Faculty_Experience$Experience,
                 type = 'bar') %>%
                layout(title ='Faculty / Experince vs Mean 11')

plot1

plot2 <- plot_ly(x = Faculty_Enrollment$Faculty,
                 y = Faculty_Enrollment$Mean11, 
                 color = Faculty_Enrollment$Enrollment,
                 type = 'bar') %>%
                layout(title ='Faculty / Enrollment vs Mean 11')

plot2

plot3 <- plot_ly(x = Faculty_Gender$Faculty,
                 y = Faculty_Gender$Mean11, 
                 color = Faculty_Gender$Gender,
                 type = 'bar') %>%
  layout(title ='Faculty / Gender vs Mean 11')

plot3









