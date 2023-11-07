# -*- coding: utf-8 -*-
"""
Created on Mon Nov  6 14:55:43 2023

@author: POLLOCKL
"""

import pandas as pd
import numpy as np

types = ["Bills",
         "Church measures",
         "ePetitions",
         "FormalProceeding",
         "Impact assessments",
         "Petitions",
         "Private acts",
         "Public acts"]

path_start = "C:/solr/"

for filetype in types:
    
    df = pd.read_csv(path_start + "raw/" + filetype + "_raw.csv").drop(labels = ["Unnamed: 0"], axis = 1)
    binsize = 1
    # estimate max bins we'll need
    df_max_value = df.max().max()
    # generate bin array
    bins = np.arange(0, df_max_value + binsize, binsize, dtype=np.float32)
    
    # find which bin the value belongs in
    a = np.searchsorted(bins, df, side='left')
    # create container array
    c = np.zeros((len(bins), df.columns.size), dtype=np.int32)
    # actually do the counting
    for i in range(df.columns.size):
        np.add.at(c[:, i], a[:, i], 1)
    
    # build a new destination dataframe
    df2 = pd.DataFrame(c[:], columns=df.columns)
    # insert columns to start
    df2.insert(0, 'NumberOfValues', bins[:].astype(int))
    df2.insert(0, "DocumentType", filetype)
    df2.to_csv( path_start + "distribution/" + filetype + "_distribution.csv", index=False)
    
    
