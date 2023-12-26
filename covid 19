import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
#import modin.pandas as pd
#import dask.dataframe as dd

#df = pd.read_csv('2021-12.csv')
#df1=dd.read_csv('2021-12.csv')
df = pd.read_csv('2021-12.csv',low_memory=False)

df

df.info()

df.columns

print(df.columns.tolist())

df_1_10_columns=df.iloc[:,0:10]
df_11_20_columns=df.iloc[:,11:21]

print(df_1_10_columns)
print(df_11_20_columns)

zip=df_11_20_columns.iloc[:,[1]]

zip

zip.nunique()

zip.isnull().sum()

zip.dropna()

# Assuming df is your DataFrame and 'ZipCode' is the column you're interested in
zip_column = zip['A3']  # Replace 'A3' with the actual column name

# Get the counts of each unique value in the 'ZipCode' column
zip_code_counts = zip_column.value_counts()

# Filter to include only those with counts greater than 1
repeated_zips = zip_code_counts[zip_code_counts > 390]

# Get the list of repeated zip codes
list_of_repeated_zips = repeated_zips.index.tolist()

# Print the result
print(f"The list of zip codes repeated multiple times: {list_of_repeated_zips}")


# Assuming df is your DataFrame and 'A3' is the column you're interested in
selected_zips = [90210.0]

# Create a boolean mask for rows with the selected zip codes
mask = df['A3'].isin(selected_zips)

# Use the mask to filter the DataFrame
selected_rows = df[mask]

# Print the result
print(selected_rows)


selected_rows.isnull().sum()

selected_rows['A3'].value_counts()

selected_rows.columns

selected_rows_1_10_columns=selected_rows.iloc[:,0:10]
selected_rows_11_20_columns=selected_rows.iloc[:,10:20]
selected_rows_20_30_columns=selected_rows.iloc[:,20:30]
selected_rows_30_40_columns=selected_rows.iloc[:,30:40]
selected_rows_40_50_columns=selected_rows.iloc[:,40:50]
selected_rows_50_60_columns=selected_rows.iloc[:,50:60]
selected_rows_60_70_columns=selected_rows.iloc[:,60:70]
selected_rows_70_80_columns=selected_rows.iloc[:,70:80]
selected_rows_80_90_columns=selected_rows.iloc[:,80:90]
selected_rows_90_100_columns=selected_rows.iloc[:,90:100]
selected_rows_100_110_columns=selected_rows.iloc[:,100:110]
selected_rows_110_120_columns=selected_rows.iloc[:,110:120]
selected_rows_120_130_columns=selected_rows.iloc[:,120:130]
selected_rows_130_140_columns=selected_rows.iloc[:,130:140]
selected_rows_140_150_columns=selected_rows.iloc[:,140:150]
selected_rows_150_160_columns=selected_rows.iloc[:,150:160]
selected_rows_160_170_columns=selected_rows.iloc[:,160:170]

print(selected_rows_1_10_columns.shape)
print(selected_rows_11_20_columns.shape)
print(selected_rows_20_30_columns.shape)
print(selected_rows_30_40_columns.shape)
print(selected_rows_40_50_columns.shape)
print(selected_rows_50_60_columns.shape)
print(selected_rows_60_70_columns.shape)
print(selected_rows_70_80_columns.shape)
print(selected_rows_80_90_columns.shape)
print(selected_rows_90_100_columns.shape)
print(selected_rows_100_110_columns.shape)
print(selected_rows_110_120_columns.shape)
print(selected_rows_120_130_columns.shape)
print(selected_rows_130_140_columns.shape)
print(selected_rows_140_150_columns.shape)
print(selected_rows_150_160_columns.shape)
print(selected_rows_160_170_columns.shape)

print(selected_rows_1_10_columns.isnull().sum())
print(selected_rows_11_20_columns.isnull().sum())
print(selected_rows_20_30_columns.isnull().sum())
print(selected_rows_30_40_columns.isnull().sum())
print(selected_rows_40_50_columns.isnull().sum())
print(selected_rows_50_60_columns.isnull().sum())
print(selected_rows_60_70_columns.isnull().sum())
print(selected_rows_70_80_columns.isnull().sum())
print(selected_rows_80_90_columns.isnull().sum())
print(selected_rows_90_100_columns.isnull().sum())
print(selected_rows_100_110_columns.isnull().sum())
print(selected_rows_110_120_columns.isnull().sum())
print(selected_rows_120_130_columns.isnull().sum())
print(selected_rows_130_140_columns.isnull().sum())
print(selected_rows_140_150_columns.isnull().sum())
print(selected_rows_150_160_columns.isnull().sum())
print(selected_rows_160_170_columns.isnull().sum())

selected_rows_1_10_columns

selected_rows_1_10_columns.isnull().sum()

#dropping columns
selected_rows_1_10_columns=selected_rows_1_10_columns.drop('A2b',axis=1)

#filling mean,median,mode
#mean_value = selected_rows_1_10_columns['A1_1'].mean()
#selected_rows_1_10_columns['A1_1'] = selected_rows_1_10_columns['A1_1'].fillna(mean_value)

#median_value = selected_rows_1_10_columns['A1_1'].median()
#selected_rows_1_10_columns['A1_1'] = selected_rows_1_10_columns['A1_1'].fillna(median_value)

mode_value = selected_rows_1_10_columns['A1_1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_1_10_columns['A1_1'] = selected_rows_1_10_columns['A1_1'].fillna(mode_value)

mode_value = selected_rows_1_10_columns['A1_2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_1_10_columns['A1_2'] = selected_rows_1_10_columns['A1_2'].fillna(mode_value)

mode_value = selected_rows_1_10_columns['A1_3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_1_10_columns['A1_3'] = selected_rows_1_10_columns['A1_3'].fillna(mode_value)

mode_value = selected_rows_1_10_columns['A1_4'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_1_10_columns['A1_4'] = selected_rows_1_10_columns['A1_4'].fillna(mode_value)

mode_value = selected_rows_1_10_columns['A1_5'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_1_10_columns['A1_5'] = selected_rows_1_10_columns['A1_5'].fillna(mode_value)

selected_rows_1_10_columns['A2'] = selected_rows_1_10_columns['A2'].fillna(0)

mode_value = selected_rows_1_10_columns['A5_1'].mode()[0]
selected_rows_1_10_columns['A5_1'] = selected_rows_1_10_columns['A5_1'].fillna(mode_value)


selected_rows_11_20_columns

selected_rows_11_20_columns.isnull().sum()

#dropping columns
selected_rows_11_20_columns=selected_rows_11_20_columns.drop('A3b',axis=1)

mode_value = selected_rows_11_20_columns['A4'].mode()[0]  # Mode may return multiple values, so take the first one
#selected_rows_11_20_columns['A4'] = selected_rows_11_20_columns['A4'].fillna(mode_value)
print(mode_value)


#filling mean,median,mode
#mean_value = selected_rows_1_10_columns['A1_1'].mean()
#selected_rows_1_10_columns['A1_1'] = selected_rows_1_10_columns['A1_1'].fillna(mean_value)

#median_value = selected_rows_1_10_columns['A1_1'].median()
#selected_rows_1_10_columns['A1_1'] = selected_rows_1_10_columns['A1_1'].fillna(median_value)

mode_value = selected_rows_11_20_columns['A5_2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_11_20_columns['A5_2'] = selected_rows_11_20_columns['A5_2'].fillna(mode_value)

mode_value = selected_rows_11_20_columns['A5_3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_11_20_columns['A5_3'] = selected_rows_11_20_columns['A5_3'].fillna(mode_value)

selected_rows_11_20_columns['A4'] = selected_rows_11_20_columns['A4'].fillna(0)

mode_value = selected_rows_11_20_columns['B2'].mode()[0]
selected_rows_11_20_columns['B2'] = selected_rows_11_20_columns['B2'].fillna(mode_value)
print(mode_value)

selected_rows_11_20_columns['B2_14_TEXT'] = selected_rows_11_20_columns['B2_14_TEXT'].fillna(0)

mode_value = selected_rows_11_20_columns['B2b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_11_20_columns['B2b'] = selected_rows_11_20_columns['B2b'].fillna(mode_value)

mode_value = selected_rows_11_20_columns['B2c'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_11_20_columns['B2c'] = selected_rows_11_20_columns['B2c'].fillna(mode_value)

selected_rows_11_20_columns['B2c_14_TEXT'] = selected_rows_11_20_columns['B2c_14_TEXT'].fillna(0)

selected_rows_20_30_columns

selected_rows_20_30_columns.isnull().sum()

#dropping columns
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B3',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B4',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B5',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B6',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B7',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B8',axis=1)


mode_value = selected_rows_20_30_columns['B10'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_20_30_columns['B10'] = selected_rows_20_30_columns['B10'].fillna(mode_value)
print(mode_value)

selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B10a',axis=1)
selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B10b',axis=1)

selected_rows_20_30_columns=selected_rows_20_30_columns.drop('B12',axis=1)

selected_rows_30_40_columns

selected_rows_30_40_columns.isnull().sum()

selected_rows_30_40_columns=selected_rows_30_40_columns.drop('B12a',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('B11',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C2',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C3',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C4',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C5',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C6',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C7',axis=1)
selected_rows_30_40_columns=selected_rows_30_40_columns.drop('C8_1',axis=1)

mode_value = selected_rows_30_40_columns['C1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_30_40_columns['C1'] = selected_rows_30_40_columns['C1'].fillna(mode_value)
print(mode_value)

selected_rows_40_50_columns

selected_rows_40_50_columns.isnull().sum()

selected_rows_40_50_columns = selected_rows_40_50_columns.dropna(axis=1)

selected_rows_50_60_columns

selected_rows_50_60_columns.isnull().sum()

selected_rows_50_60_columns=selected_rows_50_60_columns.drop('C13a',axis=1)
selected_rows_50_60_columns=selected_rows_50_60_columns.drop('C14',axis=1)
selected_rows_50_60_columns=selected_rows_50_60_columns.drop('D3',axis=1)
selected_rows_50_60_columns=selected_rows_50_60_columns.drop('D4',axis=1)
selected_rows_50_60_columns=selected_rows_50_60_columns.drop('D5',axis=1)

mode_value = selected_rows_50_60_columns['C15'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_50_60_columns['C15'] = selected_rows_50_60_columns['C15'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_50_60_columns['D1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_50_60_columns['D1'] = selected_rows_50_60_columns['D1'].fillna(mode_value)
print(mode_value)

selected_rows_50_60_columns['D1_4_TEXT'] = selected_rows_50_60_columns['D1_4_TEXT'].fillna(0)

mode_value = selected_rows_50_60_columns['D1b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_50_60_columns['D1b'] = selected_rows_50_60_columns['D1b'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_50_60_columns['D2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_50_60_columns['D2'] = selected_rows_50_60_columns['D2'].fillna(mode_value)
print(mode_value)

selected_rows_60_70_columns

selected_rows_60_70_columns.isnull().sum()

selected_rows_60_70_columns=selected_rows_60_70_columns.drop('Q36',axis=1)
selected_rows_60_70_columns=selected_rows_60_70_columns.drop('Q40',axis=1)

mode_value = selected_rows_60_70_columns['D8'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['D8'] = selected_rows_60_70_columns['D8'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['D9'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['D9'] = selected_rows_60_70_columns['D9'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q64'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q64'] = selected_rows_60_70_columns['Q64'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q65'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q65'] = selected_rows_60_70_columns['Q65'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q66'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q66'] = selected_rows_60_70_columns['Q66'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q67'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q67'] = selected_rows_60_70_columns['Q67'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q68'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q68'] = selected_rows_60_70_columns['Q68'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_60_70_columns['Q69'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_60_70_columns['Q69'] = selected_rows_60_70_columns['Q69'].fillna(mode_value)
print(mode_value)

selected_rows_70_80_columns

selected_rows_70_80_columns.isnull().sum()

mode_value = selected_rows_70_80_columns['Q70'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q70'] = selected_rows_70_80_columns['Q70'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q71'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q71'] = selected_rows_70_80_columns['Q71'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q72'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q72'] = selected_rows_70_80_columns['Q72'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q73'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q73'] = selected_rows_70_80_columns['Q73'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q74'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q74'] = selected_rows_70_80_columns['Q74'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q75'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q75'] = selected_rows_70_80_columns['Q75'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q76'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q76'] = selected_rows_70_80_columns['Q76'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q77'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q77'] = selected_rows_70_80_columns['Q77'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q78'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q78'] = selected_rows_70_80_columns['Q78'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_70_80_columns['Q79'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_70_80_columns['Q79'] = selected_rows_70_80_columns['Q79'].fillna(mode_value)
print(mode_value)

selected_rows_80_90_columns

selected_rows_80_90_columns.isnull().sum()

selected_rows_80_90_columns=selected_rows_80_90_columns.drop('C16',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('C17',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E1_1',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E1_2',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E1_3',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E1_4',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E2_1',axis=1)
selected_rows_80_90_columns=selected_rows_80_90_columns.drop('E2_2',axis=1)

mode_value = selected_rows_80_90_columns['Q80'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_80_90_columns['Q80'] = selected_rows_80_90_columns['Q80'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_80_90_columns['D10'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_80_90_columns['D10'] = selected_rows_80_90_columns['D10'].fillna(mode_value)
print(mode_value)

selected_rows_90_100_columns

selected_rows_90_100_columns.isnull().sum()

selected_rows_90_100_columns=selected_rows_90_100_columns.drop('E3',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V2',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V3',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V4_1',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V4_2',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V4_3',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V4_4',axis=1)
selected_rows_90_100_columns=selected_rows_90_100_columns.drop('V4_5',axis=1)

mode_value = selected_rows_90_100_columns['V1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_90_100_columns['V1'] = selected_rows_90_100_columns['V1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_90_100_columns['V9'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_90_100_columns['V9'] = selected_rows_90_100_columns['V9'].fillna(mode_value)
print(mode_value)

selected_rows_100_110_columns

selected_rows_100_110_columns.isnull().sum()

selected_rows_100_110_columns=selected_rows_100_110_columns.drop('C17a',axis=1)
selected_rows_100_110_columns=selected_rows_100_110_columns.drop('V2a',axis=1)
selected_rows_100_110_columns=selected_rows_100_110_columns.drop('V5d',axis=1)
selected_rows_100_110_columns=selected_rows_100_110_columns.drop('C6a',axis=1)

mode_value = selected_rows_100_110_columns['C14a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['C14a'] = selected_rows_100_110_columns['C14a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_100_110_columns['V5a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['V5a'] = selected_rows_100_110_columns['V5a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_100_110_columns['V5b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['V5b'] = selected_rows_100_110_columns['V5b'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_100_110_columns['V5c'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['V5c'] = selected_rows_100_110_columns['V5c'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_100_110_columns['V6'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['V6'] = selected_rows_100_110_columns['V6'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_100_110_columns['D11'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_100_110_columns['D11'] = selected_rows_100_110_columns['D11'].fillna(mode_value)
print(mode_value)

selected_rows_110_120_columns

selected_rows_110_120_columns.isnull().sum()

selected_rows_110_120_columns=selected_rows_110_120_columns.drop('C8a_1',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('C8a_2',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('C8a_3',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('V11',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('V12',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('V13',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('V14_1',axis=1)
selected_rows_110_120_columns=selected_rows_110_120_columns.drop('V14_2',axis=1)

mode_value = selected_rows_110_120_columns['C13b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_110_120_columns['C13b'] = selected_rows_110_120_columns['C13b'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_110_120_columns['C13c'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_110_120_columns['C13c'] = selected_rows_110_120_columns['C13c'].fillna(mode_value)
print(mode_value)

selected_rows_120_130_columns

selected_rows_120_130_columns.isnull().sum()

selected_rows_120_130_columns=selected_rows_120_130_columns.drop('B13',axis=1)
selected_rows_120_130_columns=selected_rows_120_130_columns.drop('E4',axis=1)

mode_value = selected_rows_120_130_columns['B10c'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['B10c'] = selected_rows_120_130_columns['B10c'].fillna(mode_value)
print(mode_value)

#mode_value = selected_rows_120_130_columns['B13'].mode()[0]  # Mode may return multiple values, so take the first one
#selected_rows_120_130_columns['B13'] = selected_rows_120_130_columns['B13'].fillna(mode_value)
#print(mode_value)

mode_value = selected_rows_120_130_columns['C18a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['C18a'] = selected_rows_120_130_columns['C18a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['C18b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['C18b'] = selected_rows_120_130_columns['C18b'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['C7a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['C7a'] = selected_rows_120_130_columns['C7a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['D12'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['D12'] = selected_rows_120_130_columns['D12'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['G1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['G1'] = selected_rows_120_130_columns['G1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['G2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['G2'] = selected_rows_120_130_columns['G2'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_120_130_columns['G3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_120_130_columns['G3'] = selected_rows_120_130_columns['G3'].fillna(mode_value)
print(mode_value)

selected_rows_130_140_columns

selected_rows_130_140_columns.isnull().sum()

selected_rows_130_140_columns=selected_rows_130_140_columns.drop('I1',axis=1)
selected_rows_130_140_columns=selected_rows_130_140_columns.drop('I2',axis=1)

mode_value = selected_rows_130_140_columns['H1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['H1'] = selected_rows_130_140_columns['H1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['H2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['H2'] = selected_rows_130_140_columns['H2'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['H3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['H3'] = selected_rows_130_140_columns['H3'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['I3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['I3'] = selected_rows_130_140_columns['I3'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['I4'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['I4'] = selected_rows_130_140_columns['I4'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['I5'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['I5'] = selected_rows_130_140_columns['I5'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['I6_1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['I6_1'] = selected_rows_130_140_columns['I6_1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_130_140_columns['I6_2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_130_140_columns['I6_2'] = selected_rows_130_140_columns['I6_2'].fillna(mode_value)
print(mode_value)

selected_rows_140_150_columns

selected_rows_140_150_columns.isnull().sum()

selected_rows_140_150_columns=selected_rows_140_150_columns.drop('I6_4',axis=1)
selected_rows_140_150_columns=selected_rows_140_150_columns.drop('I6_5',axis=1)
selected_rows_140_150_columns=selected_rows_140_150_columns.drop('I6_6',axis=1)
selected_rows_140_150_columns=selected_rows_140_150_columns.drop('I6_7',axis=1)
selected_rows_140_150_columns=selected_rows_140_150_columns.drop('I6_8',axis=1)

mode_value = selected_rows_140_150_columns['I6_3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_140_150_columns['I6_3'] = selected_rows_140_150_columns['I6_3'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_140_150_columns['I7'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_140_150_columns['I7'] = selected_rows_140_150_columns['I7'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_140_150_columns['K1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_140_150_columns['K1'] = selected_rows_140_150_columns['K1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_140_150_columns['K2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_140_150_columns['K2'] = selected_rows_140_150_columns['K2'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_140_150_columns['V11a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_140_150_columns['V11a'] = selected_rows_140_150_columns['V11a'].fillna(mode_value)
print(mode_value)

selected_rows_150_160_columns

selected_rows_150_160_columns.isnull().sum()

selected_rows_150_160_columns=selected_rows_150_160_columns.drop('V15a',axis=1)
selected_rows_150_160_columns=selected_rows_150_160_columns.drop('V1alt',axis=1)
selected_rows_150_160_columns=selected_rows_150_160_columns.drop('V15c',axis=1)
#selected_rows_150_160_columns=selected_rows_150_160_columns.drop('V1alt',axis=1)

mode_value = selected_rows_150_160_columns['V12a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['V12a'] = selected_rows_150_160_columns['V12a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['V15b'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['V15b'] = selected_rows_150_160_columns['V15b'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['V16'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['V16'] = selected_rows_150_160_columns['V16'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['V3a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['V3a'] = selected_rows_150_160_columns['V3a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['B13a'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['B13a'] = selected_rows_150_160_columns['B13a'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['P1'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['P1'] = selected_rows_150_160_columns['P1'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_150_160_columns['P2'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_150_160_columns['P2'] = selected_rows_150_160_columns['P2'].fillna(mode_value)
print(mode_value)

selected_rows_160_170_columns

selected_rows_160_170_columns.isnull().sum()

selected_rows_160_170_columns=selected_rows_160_170_columns.drop('w12_treatment',axis=1)
selected_rows_160_170_columns=selected_rows_160_170_columns.drop('module',axis=1)

mode_value = selected_rows_160_170_columns['P3'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_160_170_columns['P3'] = selected_rows_160_170_columns['P3'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_160_170_columns['P4'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_160_170_columns['P4'] = selected_rows_160_170_columns['P4'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_160_170_columns['P5'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_160_170_columns['P5'] = selected_rows_160_170_columns['P5'].fillna(mode_value)
print(mode_value)

mode_value = selected_rows_160_170_columns['P6'].mode()[0]  # Mode may return multiple values, so take the first one
selected_rows_160_170_columns['P6'] = selected_rows_160_170_columns['P6'].fillna(mode_value)
print(mode_value)

selected_rows_cleaned = pd.concat([selected_rows_1_10_columns,
selected_rows_11_20_columns,
selected_rows_20_30_columns,
selected_rows_30_40_columns,
selected_rows_40_50_columns,
selected_rows_50_60_columns,
selected_rows_60_70_columns,
selected_rows_70_80_columns,
selected_rows_80_90_columns,
selected_rows_90_100_columns,
selected_rows_100_110_columns,
selected_rows_110_120_columns,
selected_rows_120_130_columns,
selected_rows_130_140_columns,
selected_rows_140_150_columns,
selected_rows_150_160_columns,
selected_rows_160_170_columns], axis=1)

selected_rows.columns

selected_rows_cleaned.columns

original_column_names = set(selected_rows.columns)
cleaned_column_names = set(selected_rows_cleaned.columns)

dropped_column_names = original_column_names - cleaned_column_names
print("Dropped Column Names:", list(dropped_column_names))


selected_rows.shape

selected_rows_cleaned.to_csv('selected_rows_cleaned.csv', index=False)


selected_rows_cleaned.shape

selected_rows_cleaned.head()

selected_rows_cleaned.tail()

selected_rows_cleaned.dtypes

selected_rows_cleaned.describe

selected_rows_cleaned.info()

selected_rows_cleaned.isnull()

selected_rows_cleaned.isnull().sum()

selected_rows_cleaned.nunique()

selected_rows_cleaned.info()

selected_rows_cleaned['D1'].isnull().sum()

selected_rows_cleaned['D2'].isnull().sum()

#selected_rows_cleaned['D1'].eq(1).sum()
selected_rows_cleaned['D1'].value_counts()
#selected_rows_cleaned['D1'].mode()
#selected_rows_cleaned['D1'].info()

male_count = (selected_rows_cleaned['D1']==1.0).sum()

male_count

female_count = (selected_rows_cleaned['D1']==2.0).sum()

female_count

selected_rows_cleaned[selected_rows_cleaned['D2'] == 1.0].groupby('D1')['D2'].count()
#selected_rows_cleaned[(selected_rows_cleaned['D1'] == 1.0) & (selected_rows_cleaned['D2'] == 1.0)].groupby('D1')['D2'].count()
#selected_rows_cleaned[(selected_rows_cleaned['D1'] == 1.0) & (selected_rows_cleaned['D2'] == 1.0)].groupby('D1')['D2'].count()


import pandas as pd

# Assuming selected_rows_cleaned is your DataFrame
result = selected_rows_cleaned[selected_rows_cleaned['D2'] == 1.0].groupby('D1')['D2'].count()

# Convert the result to a DataFrame
result_df = pd.DataFrame(result).reset_index()

# Display the results according to the given gender categories
gender_mapping = {
    1: 'Male',
    2: 'Female',
    3: 'Non-binary',
    4: 'Prefer to self-describe',
    5: 'Prefer not to answer'
}

result_df['Gender'] = result_df['D1'].map(gender_mapping)

# Rename the columns for clarity
result_df = result_df.rename(columns={'D2': '18-24 years'})

# Print the resulting DataFrame
print(result_df[['Gender', '18-24 years']])


result_df

import pandas as pd

# Assuming selected_rows_cleaned is your DataFrame
src_18_24 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 1.0].groupby('D1')['D2'].count()
src_25_34 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 2.0].groupby('D1')['D2'].count()
src_35_44 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 3.0].groupby('D1')['D2'].count()
src_45_54 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 4.0].groupby('D1')['D2'].count()
src_55_64 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 5.0].groupby('D1')['D2'].count()
src_65_74 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 6.0].groupby('D1')['D2'].count()
src_greaterthan_75 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 7.0].groupby('D1')['D2'].count()

# Convert the result to a DataFrame
demographics_df = pd.DataFrame([src_18_24, src_25_34, src_35_44, src_45_54, src_55_64, src_65_74, src_greaterthan_75]).T.reset_index()

# Display the results according to the given gender categories
gender_mapping = {
    1: 'Male',
    2: 'Female',
    3: 'Non-binary',
    4: 'Prefer to self-describe',
    5: 'Prefer not to answer'
}
# Fill missing values with 0
demographics_df.fillna(0, inplace=True)


demographics_df['Gender'] = demographics_df['D1'].map(gender_mapping)

# Rename the columns for clarity
demographics_df.columns = ['D1', '18-24 years', '25-34 years', '35-44 years', '45-54 years', '55-64 years', '65-74 years', '>75 years', 'Gender']

# Print the resulting DataFrame
print(demographics_df[['Gender', '18-24 years', '25-34 years', '35-44 years', '45-54 years', '55-64 years', '65-74 years', '>75 years']])


demographics_df

import pandas as pd

# Assuming selected_rows_cleaned is your DataFrame
src_18_24 = selected_rows_cleaned[selected_rows_cleaned['D2'] == 1.0].groupby('D1')['D2'].count()
has_covid = selected_rows_cleaned[(selected_rows_cleaned['D2'] == 1.0)&(selected_rows_cleaned['B10'] == 1.0)].groupby('D1')['B10'].count()
no_covid = selected_rows_cleaned[(selected_rows_cleaned['D2'] == 1.0)&(selected_rows_cleaned['B10'] == 3.0)].groupby('D1')['B10'].count()

# Convert the result to a DataFrame with meaningful column names
demographics_df = pd.DataFrame({
    'D1': src_18_24.index,
    '18-24 years': src_18_24,
    'Has covid': has_covid,
    'No covid': no_covid
})

# Display the results according to the given gender categories
gender_mapping = {
    1: 'Male',
    2: 'Female',
    3: 'Non-binary',
    4: 'Prefer to self-describe',
    5: 'Prefer not to answer'
}

# Fill missing values with 0
demographics_df.fillna(0, inplace=True)

# Convert to integers
demographics_df['Has covid'] = demographics_df['Has covid'].astype(int)
demographics_df['No covid'] = demographics_df['No covid'].astype(int)

demographics_df['Gender'] = demographics_df['D1'].map(gender_mapping)

# Print the resulting DataFrame
covid_status_18_24 = demographics_df[['Gender', '18-24 years', 'Has covid', 'No covid']]
print(covid_status_18_24)


# Example: Create a bar plot to visualize the distribution of vaccination status
sns.countplot(x='V1', data=selected_rows_cleaned)
plt.xlabel('Vaccination Status(1: Yes, 2: No, 3: Not sure )')
plt.ylabel('Count')
plt.title('Distribution of Vaccination Status')
plt.show()

import pandas as pd


v5b_reasons_for_no_getting_vaccinated_df = pd.DataFrame(selected_rows_cleaned)

# Split and stack the values in 'V5b' column
stacked_values = why_prob_wouldnt_want_vaccine_df['V5b'].str.split(',').explode()

# Create a DataFrame with value counts
value_counts_df = pd.DataFrame({'V5b': stacked_values})
value_counts_df['Count'] = value_counts_df.groupby('V5b')['V5b'].transform('count')

# Drop duplicate rows to get unique values
value_counts_df = value_counts_df.drop_duplicates()

# Sort by Count in descending order
value_counts_df = value_counts_df.sort_values(by='Count', ascending=False)

print(value_counts_df)



not_getting_vaccinated=selected_rows_cleaned['V5b'].value_counts()


# Create a DataFrame from the value counts
vaccination_status_df = pd.DataFrame({'V5b': not_getting_vaccinated.index, 'Count': not_getting_vaccinated.values})


vaccination_status_df



# Plot the distribution of vaccination status
plt.figure(figsize=(8, 5))
sns.pointplot(x='V5b',y='Count',data=vaccination_status_df)
plt.xlabel('Reasons for not getting vaccination')
plt.ylabel('Count')
plt.title('Distribution of No-Vaccination Status')
plt.xticks(rotation=90)
plt.show()


import pandas as pd


why_prob_wouldnt_want_vaccine_df = pd.DataFrame(selected_rows_cleaned)

# Split and stack the values in 'V5b' column
stacked_values = why_prob_wouldnt_want_vaccine_df['V5b'].str.split(',').explode()

# Create a DataFrame with value counts
value_counts_df = pd.DataFrame({'V5b': stacked_values})
value_counts_df['Count'] = value_counts_df.groupby('V5b')['V5b'].transform('count')

# Drop duplicate rows to get unique values
value_counts_df = value_counts_df.drop_duplicates()

# Sort by Count in descending order
value_counts_df = value_counts_df.sort_values(by='Count', ascending=False)

print(value_counts_df)





# Plot the distribution of vaccination status
plt.figure(figsize=(8, 5))
sns.barplot(x='V5b',y='Count',data=value_counts_df)
plt.xlabel('Appointment Status (1:yes,2:no)')
plt.ylabel('Count')
plt.title('Appointment Status')
plt.xticks(rotation=90)
plt.show()






appointment_for_vaccine=selected_rows_cleaned['V11a'].value_counts()

# Create a DataFrame from the value counts
appointment_status_df = pd.DataFrame({'V11a': appointment_for_vaccine.index, 'Count': appointment_for_vaccine.values})




# Plot the distribution of vaccination status
plt.figure(figsize=(8, 5))
sns.barplot(x='V11a',y='Count',data=appointment_status_df)
plt.xlabel('Appointment Status (1:yes,2:no)')
plt.ylabel('Count')
plt.title('Appointment Status')
plt.xticks(rotation=90)
plt.show()


Choose_to_get_vaccinated_if_offered=selected_rows_cleaned['V3a'].value_counts()

# Create a DataFrame from the value counts
Choose_to_get_vaccinated_if_offered_df = pd.DataFrame({'V3a': Choose_to_get_vaccinated_if_offered.index, 'Count': Choose_to_get_vaccinated_if_offered.values})




# Plot the distribution of vaccination status
plt.figure(figsize=(10, 5))
sns.barplot(x='V3a',y='Count',data=Choose_to_get_vaccinated_if_offered_df)
plt.xlabel('Choose_to_get_vaccinated_if_offered Status (1:yes def, 2:yes probably, 3:no probably, 4:no def)')
plt.ylabel('Count')
plt.title('Choose_to_get_vaccinated_if_offered Status')
plt.xticks(rotation=90)
plt.show()


why_prob_wouldnt_want_vaccine = selected_rows_cleaned['V5b'].value_counts()

# Create a DataFrame from the value counts, sorted by counts in descending order
why_prob_wouldnt_want_vaccine_df = pd.DataFrame({'V5b': why_prob_wouldnt_want_vaccine.index, 'Count': why_prob_wouldnt_want_vaccine.values})
why_prob_wouldnt_want_vaccine_df = why_prob_wouldnt_want_vaccine_df.sort_values(by='Count', ascending=False).head(10)


why_prob_wouldnt_want_vaccine_df



# Plot the distribution of vaccination status
plt.figure(figsize=(10, 5))
sns.barplot(x='V5b',y='Count',data=why_prob_wouldnt_want_vaccine_df)
plt.xlabel("why_prob_wouldnt_want_vaccine Status: Other (13))")
plt.ylabel('Count')
plt.title('why_prob_wouldnt_want_vaccine Status')
plt.xticks(rotation=90)
plt.show()


selected_rows_cleaned['V5c'].value_counts()

# Analyze COVID-19 test results
test_results_counts = selected_rows_cleaned['B10c'].value_counts()
print("COVID-19 Test Results:")
print(test_results_counts)

# Plot COVID-19 test results
plt.figure(figsize=(8, 5))
sns.countplot(x='B10c', data=selected_rows_cleaned)
plt.title('Distribution of COVID-19 Test Results')
plt.xlabel('Test Result (1: Positive, 2: Negative, 3: Not sure)')
plt.ylabel('Count')
plt.show()






selected_rows_cleaned['D2'].value_counts()

selected_rows_cleaned['B13a']

















































# Assuming df is your DataFrame and 'A3' is the column you're interested in
selected_zips = [90210.0]

# Create a boolean mask for rows with the selected zip codes
mask = df['A3'].isin(selected_zips)

# Use the mask to filter the DataFrame
selected_rows = df[mask]

# Print the result
print(selected_rows)
















selected_rows_11_20_columns['A4'] = selected_rows_11_20_columns['A4'].fillna(0)



selected_rows_160_170_columns

selected_rows_160_170_columns=selected_rows.iloc[:,160:170]

selected_rows_160_170_columns

selected_rows_160_170_columns.fillna(0)

# Drop columns with more than 90% missing values
df_cleaned = selected_rows.dropna(thresh=len(selected_rows) * 0.1, axis=1)

# Fill missing values with the mean for numerical columns
df_cleaned = df_cleaned.fillna(df_cleaned.mean())


df_cleaned

df_A=df.iloc[:,2:7]





df_A.isnull().sum()

df_A.fillna(0)

# Assuming df is your DataFrame
counts_A1_1 = df_A['A1_1'].value_counts()
counts_A1_2 = df_A['A1_2'].value_counts()
counts_A1_3 = df_A['A1_3'].value_counts()
counts_A1_4 = df_A['A1_4'].value_counts()
counts_A1_5 = df_A['A1_5'].value_counts()

# Print the counts
print("Counts for A1_1:\n", counts_A1_1)
print("\nCounts for A1_2:\n", counts_A1_2)
print("\nCounts for A1_3:\n", counts_A1_3)
print("\nCounts for A1_4:\n", counts_A1_4)
print("\nCounts for A1_5:\n", counts_A1_5)

df1

df.describe()

df.isnull().sum()

# Assuming df is your DataFrame
columns_with_nulls = df.columns[df.isnull().sum() == 5000]

print("Columns with 5000 null values:")
print(columns_with_nulls)


df[columns_with_nulls] = df[columns_with_nulls].fillna(0)

df[columns_with_nulls].isnull().sum()

df

df.nunique()

df

# Assuming 'df' is your DataFrame
column_name = '*State*'

if column_name in df1.columns:
    print(f"The column '{column_name}' exists in the DataFrame.")
else:
    print(f"The column '{column_name}' does not exist in the DataFrame.")


df.dtypes

df.describe()

