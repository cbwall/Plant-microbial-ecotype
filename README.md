## Symbiotic fungi alter plant resource allocation independent of water availability
CB Wall<sup>1,2</sup>, K Kajihara<sup>1</sup>, FE Rodriguez<sup>1</sup>, L Vilonen<sup>1</sup>, D Yogi<sup>1</sup>, SIO Swift<sup>1</sup>, NA Hynson<sup>1</sup>  
(2024) _American Journal of Botany_.  

<sup>1</sup>University of Hawai'i at Mānoa  
<sup>2</sup>University of California, San Diego     

<p align="center">
  <img align="center" src="https://github.com/cbwall/Plant-microbial-ecotype/blob/main/output/pictures/git_Rmd_pic.jpg" width="65%" height="60%">
</p>

Our project tested the influence of microbial communities on plant performance and how "home advantages" and environmental pressures alter plant-microbe interactions across a water resource gradient in Waimea Valley on the north shore of O'ahu, Hawai'i. We used the inoculum sources from the natural elevation-precipitation gradient (low, medium, high precipitation soil inocula) in a factorial design experiment where plants were exposed to collected soil inocula and subjected to varying watering regimes. To accompish this, we used axenically cloned model plant system (strawberry, *Fragaria virginiana*) grown in sterile soil, inoculated with soil slurries from each of those sites, and subjected plants to reciprocal water treatments imposed at three levels of watering (dry, moderate, wet) based on the average precipitation of the inoculum source environment.  
  
## File Directory  
The file directory contains folders and scripts (Rmd) to be run in RStudio. The folders house data, output, and raw + polished figures    
   - *Plant.microbial.ecotype.Rproj* = the R project for the analysis, load this first to allow code to run from correct directory in R Studio  
   - *Plant.microbial.ecotype.Rmd* = the scripts and annotated code chunks here will walk through analyses and produce outputs  
   - *Plant.microbial.ecotype.html* = the knit output of the Rmd file. Open this in any browser  
 
### Folders  
  - *data* = contains raw and processed data files  
      - *data/final data_published* = exported data post script processing and editing, used in analyses  
    
  - *figures* = contains raw exported figures from code (main text and Appendix 1)   
  - *output* = contains the *final figures*, *final tables*, *pictures* subfolders  
  - *output/OTU.table* = subfolder with...
       - *otuTAB.all.csv* = Post DADA2 OTU table, with additional treatments not used in publication  
       - *otuTAB.winnow.csv* = SRA data, winnowed to remove treatments excluded from manuscript  
       - **otuTAB.final.csv** = final OTU table with control (pre-experiment) samples removed, used in analyses below

## Metadata
Important data files to generate figures and run models can be found in the *data folder*. The key data files are:  

- **Raw data** : These files contain samples/time points not used in publication (referred to as Inoculum 2 and 3, Time-point "Control").  
    - *strawberries_raw_full_data* = metadata file for all samples/treatments + controls (pre experiment), later subset  
    - *map_loaded_strawberries.txt* = mapping file for all samples/treatments + control timepoint (pre experiment) 
    - *ASV_table_postfiltering.txt* = post DADA2 ASV table, contains treatments "2 and 3" and a "control" timepoint pre-experiement. All 3 not used in publicaton     
    - Full data generated from *ASV_table_postfiltering.txt* *map_loaded_strawberries.txt*: all sample OTU table, pre-winnowing, *output/OTU.tab/otuTAB.all.csv*    
      
- **Post-filtering and data winnowing**: Samples here are those used in the SRA and in downstream analyses, figures    
    - *otuTAB.winnow.csv*: publication data (un-used treatments removed) in SRA data   
    - *output/OTU.tab/**otuTAB.final.csv*** : Final OTU table, with treatments 2 and 3 and control pre-experiment period  
    - *map_loaded_strawberries.txt* = mapping file
    
- **Biomass and mortality** : Samples here are those used in biomass proportion (above/belowground tissue) and mortality  
    - *mortality_data.csv* = data on plant mortality
        - processed and exported in: *data/final data_published/mortality.final* 
    - *data/final data_published/strawberries_final_data* = final data for biomass in treatments/samples used in SRA and manuscript  
    - subset from *strawberries_raw_full_data*, used to make root and shoot specific dataframes    
            - *output/rootsonlywithcontrol_final.csv* Roots only  
            - *output/shootsonlywithcontrol_final.csv*  Shoot only  
      
- **Final published data**: Shortcut  
  The script runs and processed changes to the data, including removing unwanted/unused samples and treatments, reclassifying or renaming factor levels, and subsetting dataframes for specific analyses. These changes are executed in the Rmd file script. However, to "cut to the chase" and view these final data elements, you can access these files in this subfolder:  
    - **data/final published_data/**  
        - *ASV.data_loaded_final.csv* = final OTU table data  
        - *ASV.map_loaded_final.csv* = final OTU mapping file ... representative of *output/OTU.tab/otuTAB.final.csv*   
        - *ASV.tax_loaded_final.csv* = = final OTU table taxonomy   
        - *mortality.final.csv* = final dataframe for mortality  
        - *strawberries_final_data.csv* = final dataframe for biomass  
     
