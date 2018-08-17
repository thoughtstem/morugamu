Comments on how to create a new dataset for a Morugamu tile. We followed the tutorial https://towardsdatascience.com/how-to-train-your-own-object-detector-with-tensorflows-object-detector-api-bec72ecfe1d9

1. Take 200+ pictures. 

2. Resize pictures, width 650 pixels. We used https://bulkresizephotos.com/ to resize all pictures at once.

3. Rename all pictures in a convenient way, for example: red_fish_1.jpeg, red_fish_2.jpeg, ...

4. Label your tile on every picture using LabelImg. Use the same label for every picture! You can put your label name, for example "cookie", in the default field in LabelImg. Save labeled pictures as .xml files. Names of .xml files have to be the same as names of corresponding pictures. 

5. Create .csv file using pictures and .xml files. Use https://github.com/datitran/raccoon_dataset as described at the tutorial. Run your .xml through the xml_to_csv.py file in the raccoon_dataset repo. Make sure to edit the code appropriately to get the csv for your own images and xml files, not the raccoon ones.

6. Separate the dataset in groups of ~160 (training dataset) and ~40 (testing dataset) images (separate .xml accordingly). Repeat step 5. to create .csv files for each group. 

7. Edit generate_tfrecord.py script at the raccoon repo: replace raccoon on line 31 with label you used on step 4 when labeling pictures. 

def class_text_to_int(row_label):
    if row_label == 'raccoon':
	
8. Run your test and train .csv files through generate_tfrecord.py as described in the comments at the top of the script. Don't forget to change .csv file names to the actual file names you have.