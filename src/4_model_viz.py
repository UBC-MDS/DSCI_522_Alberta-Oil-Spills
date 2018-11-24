# 4_model_viz.py
# Huijue Chen, Nov. 22, 2018
#
# This script creates graph to visualize the Alberta Oil Spills fitted model.
# It reads the model 'finalized_model.sav' as input, outputs graph image to PDF
# It takes an input file path, and an output file path as the variable arguments.

import pickle
import graphviz
import pandas as pd
from sklearn import tree
import argparse

def get_args():

    parser = argparse.ArgumentParser()
    parser.add_argument('input_file', help='Data file path')
    parser.add_argument('output_path', help='Output file path')
    args = parser.parse_args()

    return args.input_file, args.output_path

def main():

    # Get command line arguments
    input_file_path, output_file_path = get_args()

    # 1. Model Importing
    model = pickle.load(open(input_file_path + 'finalized_model.sav', 'rb'))
    features = pd.read_csv(input_file_path+'feature_compare.csv')
    feature_cols= list(features)[1:]

    # 2. Graph drawing and exporting
    def save_and_show_decision_tree(model,
                                    class_names =  ['Target 0', 'Target 1'],
                                    save_file_prefix = output_file_path+'oil_spills_model', **kwargs):
        """
        Saves the decision tree model as a pdf
        """
        dot_data = tree.export_graphviz(model, out_file=None,
                                 feature_names=feature_cols,
                                 class_names=class_names,
                                 filled=True, rounded=True,
                                 special_characters=True, **kwargs)

        graph = graphviz.Source(dot_data)
        graph.render(save_file_prefix)
        return graph

    graph = save_and_show_decision_tree(model)
if __name__ == "__main__":
    main()
