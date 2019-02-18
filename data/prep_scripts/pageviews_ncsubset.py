import pandas as pd

df = pd.read_csv('pageviews_2012.csv', encoding='utf-8')

df = df.drop(['visitors_per_lcc_category', 'visitors_per_lcc_first'], axis=1)
df['loc'] = df['loc'].str.replace(r'[ \[\]]', '')

dfNC = df.loc[(df.region == 'North Carolina')]
dfnc2 = dfNC.sample(144716)
dfnonnc = df.loc[df.region != 'North Carolina']
dfsub = pd.concat([dfnc2, dfnonnc])
dfsub = dfsub.sort_index()

dfsub[['longitude','latitude']] = dfsub['loc'].str.split(',', expand=True)
dfsub = dfsub.drop(['loc'], axis=1)

dfsub['latitude'] = pd.to_numeric(dfsub.latitude)
dfsub['longitude'] = pd.to_numeric(dfsub.longitude)
dfsub['timestamp'] = pd.to_datetime(dfsub.timestamp)

dfsub = dfsub.loc[dfsub.timestamp >= '2012-01-01 00:00:00']

dfsub.to_csv('pageviews_2012_ncsubset_wlatlon.csv', encoding='utf-8', index=False)