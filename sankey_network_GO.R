library(networkD3)

nodes = data.frame("names" =c("Biological Processes",
                              "Cellular Components", 
                              "Molecular Functions", "Functions",
                              "Biosynthetic process", "Transport", "Response to stress",
           "Signal transduction",
           "Organelle", 
           "Nucleus",
           "Cytoplasm", 
           "Ion binding",
           "DNA binding", 
           "RNA binding"
           ))   #this defines the name of the nodes used 

links = as.data.frame(matrix(c(
  0, 4, 33384,
  0, 5, 20604,   #column one is the node from which you make the network (let's call this the main node)
  0, 6 ,14018,    #column two is the target node (e.g node 0 will connet to node 6 in this example)
  0, 7, 15251,    #column three is the value of the target node (which will sum into the main node)
  1, 8, 70774,
  1, 9, 41152, 
  1, 10, 28658, 
  2, 11, 56550,
  2, 12, 28351, 
  2, 13,11484), 
  byrow = TRUE, ncol = 3))
  

names(links) = c("source", "target", "value")
sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "names",
              fontSize= 35, nodeWidth = 30)


# for some reason cannot save this an image
