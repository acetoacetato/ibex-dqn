import pandas as pd

df = pd.DataFrame({'a': [1,1,1], 'b': [2,2,2]})

df.to_csv('test.csv')
