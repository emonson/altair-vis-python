import pandas as pd
lcc = pd.read_excel('pageviews_2012_subset.xlsx', sheet_name='LCC_categories')
lcc
pg = pd.read_csv('pageviews_2012_ncsubset_wlatlon.csv')
pv = pd.merge?
pv = pd.mergelcc
lcc
pv = pd.merge(pg,lcc,how='left',on='lcc_first_letter')
pv
pv.headers
pv.header
pv.columns
pv.lcc_category
pv = pv.drop(['lcc_first_letter','lcc_category'], axis=1)
pv
ukcan = pv.loc[(pv.country == 'Canada') or (pv.country == 'United Kingdom')]
ukcan = pv.loc[(pv.country == 'Canada') | (pv.country == 'United Kingdom')]
ukcan
ukcan.country
dur = pv.loc[pv.city == 'Durham']
dur
ukcan
dur2 = dur.sample(5139)
dur2.columns
ukcan.region
ukcan.dtype
ukcan.dtypes
dfsub = pd.concat([ukcan, dur2])
dfsub['timestamp'] = pd.to_datetime(dfsub.timestamp)
dfsub.dtypes
dfsub
dfsub = dfsub.sort_index()
dfsub.to_csv('pageviews_2012_small.csv', encoding='utf-8', index=False)
