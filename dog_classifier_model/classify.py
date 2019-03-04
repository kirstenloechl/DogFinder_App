import tensorflow as tf
import sys
import os
import csv

# Disable tensorflow compilation warnings
os.environ['TF_CPP_MIN_LOG_LEVEL']='2'


def classify(image_path):
    label_lines = [line.rstrip() for line
                    in tf.gfile.GFile("trained_model/retrained_labels.txt")]
   
    # Unpersists graph from file
    with tf.gfile.FastGFile("trained_model/retrained_graph.pb", 'rb') as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
        _ = tf.import_graph_def(graph_def, name='')

    with tf.Session() as sess:
             # Read the image_data
            image_data = tf.gfile.FastGFile(image_path, 'rb').read()
            softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')

            predictions = sess.run(softmax_tensor, \
                                   {'DecodeJpeg/contents:0': image_data})

            top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

            for node_id in top_k:
                human_string = label_lines[node_id]
                print("Classified dog from " + image_path + " as a " + human_string)   
                break  

def main():
    classify(sys.argv[1])
    

if __name__ == '__main__':
    main()

