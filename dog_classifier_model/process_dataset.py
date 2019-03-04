
import os
import sys
import pandas as pd

def clean_data(root_path,):
    dataset_path = root_path+'/dataset'
    train_data = root_path+'/train/'
    os.makedirs(root_path, exist_ok=True)
    df = pd.read_csv(root_path+'/labels.csv')
    files = os.listdir(train_data)
    print("Organize data using names in labels")
    for file in files:
        folder_name = df.loc[df['id'] == file.split('.')[0],'breed'].values[0]
        os.makedirs(dataset_path+'/'+folder_name, exist_ok=True)
        source = train_data+file
        destination = dataset_path+'/'+folder_name+'/'+file
        os.rename(source, destination)
    print("Dataset directories organized")


def main():
    clean_data(sys.argv[1])

if __name__ == '__main__':
    main()

