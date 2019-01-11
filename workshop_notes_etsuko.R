#ggplot workshop
#https://genviz.org/module-02-r/0002/03/01/introToggplot2/

# how to change line colors and fill colors together
ggplot() + geom_density(data=variantData, aes(x=tumor_VAF, fill=dataset), alpha=.75, colour="red", adjust=0.5) + scale_fill_manual(values=c("discovery"="peachpuff2", "extension"="moccasin"))


p13 <- ggplot(variantData[variantData$type == "SNP",]) + geom_bar(aes(x=trv_type, fill=tier))
p14 <- p13 + facet_wrap(~reference)+coord_flip()

p31 <- ggplot() + geom_violin(data=variantData,aes(x=Simple_name,y=tumor_VAF)) + 
  theme(axis.text.x=element_text(angle=90,hjust=1)) + 
  xlab("Sample") + ylab("Variant Allele Fraction")  

p32 <- ggplot(data=variantData, aes(x=Simple_name, y=tumor_VAF)) + 
  geom_violin(aes(fill=Simple_name)) + geom_jitter(width=.1, alpha=.5) + 
  theme(axis.text.x=element_text(angle=90, hjust=1), legend.position="none") + 
  xlab("Sample") + ylab("Variant Allele Fraction")

library(plyr)
variantDataCount <- count(variantData, "Simple_name")
variantDataMax <- aggregate(data=variantData, tumor_VAF ~ Simple_name, max)
variantDataMerge <- merge(variantDataMax, variantDataCount)
head(variantDataMerge)

p33 <- ggplot(data=variantData, aes(x=Simple_name, y=tumor_VAF)) + 
  geom_violin(aes(fill=Simple_name)) + geom_jitter(width=.1, alpha=.5) + 
  theme(axis.text.x=element_text(angle=90, hjust=1), legend.position="none") + 
  xlab("Sample") + ylab("Variant Allele Fraction") +
  geom_text(data=variantDataMerge, aes(x=Simple_name, y=tumor_VAF + 5, label=freq)) 


# visualization
setwd('workshop_materials/visualisation/testApp')
getwd()



