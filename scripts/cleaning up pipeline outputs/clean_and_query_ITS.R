# #### Join ITS pipeline outputs to determine seq success and generate easy summaries
# setwd("~/Desktop/R/CMAIKI_clean_and_query/fungal_ITS/")
# ### file names
# 
# # Miseq run 1
#   miseq1_ITS_map_file   <- "Miseq01/Miseq01_MappingFile.csv"
#   miseq1_ITS_tax_file   <- "Miseq01/consensus_taxonomy.txt"
#   miseq1_ITS_abund_file <- "Miseq01/abundance_table_100.csv"
#     
# # Miseq run 2
#   miseq2_ITS_map_file   <- "Miseq02/Miseq02_MappingFile.csv"
#   miseq2_ITS_tax_file   <- "Miseq02/consensus_taxonomy.txt"
#   miseq2_ITS_abund_file <- "Miseq02/abundance_table_annotated_ID=97.tsv"
#   

# read and clean ITS -----------------------------------------------


  clean_ITS_tables <- function(abundance_file,
                               taxonomy_file,
                               metadata_file,
                               id_column,
                               output_dir,
                               description){  
    

  # Requirements
  require(dplyr)
  require(tidyr)
  
  #### *** Test Case COMMENT OUT UNLESS TESTING ***
    # abundance_file = "inputs/abundance_table_97.csv"
    # taxonomy_file = "inputs/consensus_taxonomy.txt"
    # metadata_file = "inputs/Miseq_01-02-03_mapping_file - Sheet1.csv"
    # description = "miseq010203_ITS"
  # 
  
  ## Read in tables
  # abundance is easy, force rownames (OTUs) into a column 'row.names'
  abund <- read.table( abundance_file, header = T, stringsAsFactors = F,
                       row.names = NULL, sep = ",")
  
  # taxonomy is a ragged table, fill in empties with "NA"
  tax   <- read.table( taxonomy_file, header = T, stringsAsFactors = F,
                       sep = "\t", fill = T,  na.strings = "")
  
  # read in metadata as characters
  fullmeta  <- read.table( metadata_file, header = T, stringsAsFactors = F,
                           colClasses = "character",
                           sep = "," )
  
  
  ## Clean tables
  # taxonomy needs first column to be separated (not needed for new pipeline)
   tax   <- tax %>% separate(OTU_ID, into = c("OTU_ID","Size"), sep = ";size=")

  # abundance needs to have colnames cleaned, first column renamed, and transposed

  abund           <- t(abund)
  colnames(abund) <- abund[1,]
  abund           <- abund[-1,]
  abund           <- as.data.frame(abund, stringsAsFactors = F) %>% mutate(Group = row.names(abund))
  abund           <- abund %>% select(Group, everything())
  abund$Group <- sub("X", "",abund$Group)
  
  # create metadata file for just samples that appear in abund
  meta  <- fullmeta[fullmeta[[id_column]] %in% abund$Group,]
 
  ## Check if joins work:
  # Check abundance and taxonomy have the same OTUs
  if( !all( colnames(abund)[-1] %in% tax$OTU_ID)){ # test
    message("*** WARNING Abundance and taxonomy have different OTUs. Following OTUs are missing from taxonomy:")   # no
    otu_check <- colnames(abund)[-1] %in% tax$OTU_ID
    colnames(abund)[otu_check == F]
    write(colnames(abund)[otu_check == F], stdout())
  }else {
    message("OKAY Abundance and taxonomy have the same OTUs")                 # yes
  }         
  
  # check abundance and metadata have same ids
  if( !all( abund$Group %in% meta[[id_column]])){ # test
    message( "*** WARNING Abundance and Metadata have different samples" )
    write(abund$Group[!(abund$Group %in% meta[[id_column]])], stdout())# no
  } else {
    message( "OKAY Abundance and Metadata have the same samples" )           # yes
  }    # yes
  
  if( !all( fullmeta[[id_column]] %in% abund$Group )){ # test
    message( "*** The following samples were in fullmeta, but not abund" )
    write(fullmeta[[id_column]][!(fullmeta[[id_column]] %in% abund$Group )], stdout(), ncolumns = 5)# no
  } else {
    message( "Abundance and FullMetadata have the same samples" )           # yes
  }    # yes
  # make all tables into a list
  result <- list( abund, tax, meta, fullmeta)
  names(result) <- c("abundance", "taxonomy", "metadata","full_run_metadata")
  
  # Write out all tables as .csv and return a "result" list of tables
   lapply(1:length(result),
           function(x) write.csv(result[[x]],
                                 file = paste(file.path(output_dir),description, names(result[x]), "ITS_table.csv", sep = "_"),
                                 row.names = F))
    # write message
  message(paste("tables written out as csv files starting with ", description, "...", sep = ""))
  return(result)
  
  ################## END
  }
