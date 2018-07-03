library(tidyverse)

read.my.csv = function(f, ...) {
  read.csv(f) %>%
    mutate(Brand = as.factor(gsub(" .+$","",Processor)),
           Model = as.factor(
             gsub("[0-9]","",gsub("( |-).*$", "", gsub("^(Intel|AMD) ","",Processor)))
             )) %>%
    na.omit()
}

cpu = read.my.csv("CPUs.csv") %>%
  merge(read.my.csv("CPUs single.csv")) %>% 
  na.omit()


# ggplot(aes(CPU.Mark.Single, Price,colour=CPU.Mark,group=Brand), data=cpu) + geom_point()


cpu.lm = lm(log(Price)~CPU.Mark*CPU.Mark.Single + Brand+Model, data=cpu)

summary(cpu.lm)

cpu = cpu %>% mutate(
  Predict = exp(predict(cpu.lm)),
  Difference = Price - Predict
)

good = cpu %>% filter(#Difference < 
                      CPU.Mark.Single > 1700,
                      CPU.Mark > 10000,
                      Price < 200) %>% arrange(Difference)




good %>%
  mutate(Price = scales::dollar(round(Price)),
         Predict = scales::dollar(round(Predict)))
write.csv(good, "good.csv")
