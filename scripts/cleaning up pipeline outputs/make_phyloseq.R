make_phyloseq <- function(abund_file, tax_file, meta_file, id_column) {
  require(phyloseq)
  require(data.table)
  ### For Testing
  # 
  # abund_file  = "../data/processed/cleaned/mm_16s_hiseqs_abundance_table.csv"
  # tax_file = "../data/processed/cleaned/mm_16s_hiseqs_taxonomy_table.csv"
  # meta_file = "../data/processed/cleaned/mm_16s_hiseqs_metadata_table.csv"
  #  id_column = "sequencing_id"
# functions  
  # clean up abundance table
  
clean_abund <- function(abund){ 
  message("reading abundance file") 
  abund <- fread(abund_file, header = T, sep = ",")
  head(abund)[1:6, 1:10]
  
  message("cleaning abundance")
  
  sample_ids <- as.character(abund$Group)
  abund[ , Group:=NULL]
  otus_ids <- colnames(abund)
  
  abund <- transpose(abund)
  
  # add sample ids as column names
  colnames(abund) <- sample_ids
  
  # add otus as rownames
  rownames(abund) <- otus_ids
  
  OTU     <- otu_table(abund, taxa_are_rows = TRUE)
  return(OTU)
}
  
  # clean up taxonomy
clean_tax <- function(tax){
  message("reading taxonomy file")
  tax   <- fread(tax_file, header = T, sep = ",")
  head(tax)[1:6, 1:6]
  
  message("cleaning taxonomy")
  
  row.names(tax) <- tax$OTU
  tax <- tax[ , (1:2) := NULL ]
  tax <- as.matrix(tax)
  TAX     <- tax_table(tax)
  return(TAX)
}
  # clean up sample table
clean_meta <- function(meta){
  message("reading metadata file")
  meta  <- fread(meta_file, header = T, sep = ",")
  head(meta)[1:6, 1:10]
  
  message("cleaning metadata")
  meta <- as.data.frame(meta)
  row.names(meta) <- meta[[id_column]]
  samples <- sample_data(meta)
  return(samples)
}

  # run functions
  OTU <- clean_abund(abund = abund)

  TAX <- clean_tax(tax = tax)

  samples <- clean_meta(meta = meta)

  # This is the phyloseq object:
  message("making phyloseq")
  
  ps_object <- phyloseq(OTU, TAX, samples)
  return(ps_object)
}