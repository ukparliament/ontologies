# -*- coding: utf-8 -*-
"""
Created on Mon Nov  6 09:17:58 2023

@author: POLLOCKL
"""

import pandas as pd
import xml.etree.ElementTree as ET
import os

types = ["Bills",
         "Church measures",
         "ePetitions",
         "FormalProceeding",
         "Impact assessments",
         "Petitions",
         "Private acts",
         "Public acts"]

path_start = "C:/solr/solr_data/"

for filetype in types:
    files2scan = [ x for x in os.listdir(path_start) if x.find(filetype) == 0 ]

    dfs_out = []
        
    for f in files2scan:
        
        tree = ET.parse(path_start + f)
        root = tree.getroot()
        result = root.find("result")
        item_list = pd.read_xml(ET.tostring(result))
        document_list = []
        
        for child in result:
            
            # store this object's attributes
            this_document_dict = {}
          
            for obj in child:
                
                # store this attribute's values
                this_attribute_dict = {
                    "int": None,
                    "string": None,
                    "date": None,
                    "bool": None
                    }
               
                # look for data types
                if obj.find("str") is not None:
                    this_attribute_dict["string"] = [x.text for x in obj.findall("str")]
                else:
                    del this_attribute_dict["string"]
                    
                if obj.find("date") is not None:
                    this_attribute_dict["date"] = [x.text for x in obj.findall("date")]
                else:
                    del this_attribute_dict["date"]
                    
                if obj.find("bool") is not None:
                    this_attribute_dict["bool"] = [x.text for x in obj.findall("bool")]
                else:
                     del this_attribute_dict["bool"]
                
                if obj.find("int") is not None:
                    this_attribute_dict["int"] = [x.text for x in obj.findall("int")]
                else:
                     del this_attribute_dict["int"]
        
                # store a list of the values for each datatype in dictionary
               # this_document_dict[obj.attrib["name"]] = this_attribute_dict
               
               # i'll never understand dict_key objects
                if len(this_attribute_dict) > 0:
                   data_out = list(this_attribute_dict.values())[0]
                else:
                   data_out = list(this_attribute_dict.values())
                   
                this_document_dict[obj.attrib["name"]] = data_out
            
            # collect this document
            document_list.append(this_document_dict)
                
        # flatten
        df = pd.DataFrame(document_list)
        dfs_out.append(df)
        
    df = pd.concat(dfs_out)
    # non null entries
    counts = df.count()
    counts = pd.DataFrame(counts, columns = ["Count"])
    counts["Occurrence frequency"] = counts["Count"] / df.shape[0]  * 100
    
    # formating
    counts.style.format({"Occurrence frequency": '{:,.2f}'.format })
        
    counts["DocumentType"] = filetype
    counts.index.name = "Attribute"
    counts.to_csv(filetype + ".csv")
    
    #number of elements in attributes; null counted as 0
    lengths = df.applymap(lambda x : 0 if type(x) == float else len(x))
    lengths.to_csv(filetype + "_raw.csv")
    

    
