import csv
import json

MODELS_FILE_PATH = '/home/evan/projects/Mountain-Madness-2023/mountain_rate/assets/data/models.json'
DATA_FILE_PATH = '/home/evan/projects/Mountain-Madness-2023/mountain_rate/assets/data/mountain_data.csv'

def writer():
    data = []
    
    with open(DATA_FILE_PATH, encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        for row in reader:
            data.append(row)
            
    with open(MODELS_FILE_PATH, 'w', encoding='utf-8') as f:
        f.write(json.dumps(data, indent=4))

writer()