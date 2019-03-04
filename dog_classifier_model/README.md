# To run model

###### To create the virtual environment on *Mac*
Create a new virtual environment by choosing a Python interpreter and making a ./venv directory to hold it:
    ```sh
    $ virtualenv --system-site-packages -p python3 ./venv
    ```
###### To activate and setup the virtual environment on *Mac*
Activate the virtual environment using a shell-specific command:
    ```sh
    $ source ./venv/bin/activate  # sh, bash, ksh, or zsh
    ```
    When virtualenv is active, your shell prompt is prefixed with (venv).
    
 #### Download files from Stanford Dog Dataset
   - unzip train.zip
   - unzip test.zip
   - unzip labels.csv.zip
   
   
  #### Clean data 
   - Run data processing python code to re-arrange folders by dogs breed name
 
   > python process_data.py .
   
  #### Train model using processed dataset
 - Run the below command to train your model using CNN architectures. By default, below script will download 'Google's inception architecture - 'inception-2015-12-05.tgz'.
 
   > python retrain.py --image_dir=dataset/ --bottleneck_dir=bottleneck/ --how_many_training_steps=500 --output_graph=trained_model/retrained_graph.pb --output_labels=trained_model/retrained_labels.txt --summaries_dir=summaries
   
     
  ## Test model on any image
  - Run the below python script to classify an image.
    > python classify.py \<imagepath>
