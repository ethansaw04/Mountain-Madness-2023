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
    # print(data )
        # # skip the headers
        # next(reader)
        # # reset models filepath
        # open(MODELS_FILE_PATH, 'w').close()
        
        
        # with open(MODELS_FILE_PATH, mode='a') as m:                
        #     m.write('{"data": [\n')
        #     for row in reader:
                
        #         val = '{\n' + '''
        #         "category": "{0}",
        #         "questions": "{1}",
        #         "answer_one": "{2}",
        #         "answer_two": "{3}",
        #         "answer_three": "{4}",
        #         "tip": "{5}",
        #         "correct_answer": "{6}",
        #         "image": "{7}"          
        #         '''.format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]) + '\n},\n'
        #         m.write(val)
        #     m.write(']}')
        
writer()