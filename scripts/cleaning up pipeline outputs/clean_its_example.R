# Clean ITS data outputs from pipeline and create phyloseq object

abund_its_file <- "../data/raw/sequence/waimea_ITS_v1/Results/abundance_table_100.tsv"
tax_its_file   <- "../data/raw/sequence/waimea_ITS_v1/Results/annotations_sintax_100.tsv"
meta_its_file  <- "../data/processed/interim/combined_prep_sample_metadata_its.csv"


source("../src/clean_and_query_ITS.R")


## clean_its_tables outputs a list of cleaned versions of each dataframe
## 'cleaning' means renaming some columns and generally tidying the pipeline outputs
## sequences are not affected
## names are checked to make sure they agree between all files
## the function writes out each cleaned file as a csv

mm_its <- clean_ITS_tables(
  abundance_file = abund_its_file,
  taxonomy_file = tax_its_file,
  metadata_file = meta_its_file,
  description = "mm_its_hiseqs",
  output_dir = "../data/processed/cleaned",
  id_column = "sequencing_id" # column in metadata that matches sample names in abundance table
)


## pass the cleaned csv files onto the function 'make_phyloseq()

source("../src/make_phyloseq.R")


ITS_phy <- make_phyloseq(abund_file     = "../data/processed/cleaned/mm_its_hiseqs_abundance_table.csv",
                            tax_file    = "../data/processed/cleaned/mm_its_hiseqs_taxonomy_table.csv",
                            meta_file   = "../data/processed/cleaned/mm_its_hiseqs_metadata_table.csv",
                            id_column   = "sequencing_id") # column in metadata that matches sample names in abundance table