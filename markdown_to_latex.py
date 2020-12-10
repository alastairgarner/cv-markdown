#!/usr/bin/env python3

from panflute import *
import sys
import os

def to_latex(json):
    ### Convert json structure to latex
    tex = convert_text(json, input_format='panflute', output_format='latex')
    return tex
    
def split_json(doc):
    first, last = (0,0)
    json_parts = []
    for i, elem in enumerate(doc.content):
        if isinstance(elem, HorizontalRule):
            last = i
            json_parts.append(doc.content[first:last])
            first = last+1
            
    json_parts.append(doc.content[last+1:])
    return json_parts

if __name__ == "__main__":
    ### Load Markdown file
    files = os.listdir(".")
    for file in files:
        if file.endswith('.md'):
            markdown_file = file
            break
    
    with open(markdown_file,'r') as file:
        md = file.read()
        
    ### Convert from Markdown to JSON
    json = convert_text(md,input_format='markdown',standalone=True)
    
    title = json.get_metadata('author', 'Joe Bloggs')
    title = '\\newcommand\\name{' + title + '}'
    
    ### Split JSON by section (HorizontalRule)
    json_parts = split_json(json)
    
    ### Convert JSON to LaTeX
    tex = [to_latex(elem) for elem in json_parts]
    tex = [title,*tex] 
    ### Save each section to separate .tex file
    for i,doc in enumerate(tex):
        filename = f"part_00{i}.tex"
        with open(filename,'w') as file:
            file.write(doc)
            
    print(f"{markdown_file} parsed into {i+1} latex files")
