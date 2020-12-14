#!/usr/bin/env python3

from panflute import *
import sys
import os

fa_symbols = {
    "location": r"\faHome",
    "phone": r"\faPhoneSquare",
    "email": r"\faEnvelope",
    "linkedin": r"\faLinkedinSquare",
    "github": r"\faGithub",
}

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
    
    commands = []
    title = json.get_metadata('author', 'Joe Bloggs')
    commands.append('\\newcommand\\authorname{' + title + '}')

    contact = json.get_metadata('contact', '')
    info = {}
    for k,v in contact.items():
        val,link = contact[k][:2]
        info[k] = f"\href{{{link}}}{{{fa_symbols[k]} {val}}}"
    
    cv_order = json.get_metadata('order', [])
    cv_info = "\n\n".join([info[k] for k in cv_order])
    cv_info = f"\\newcommand\\infocv{{{cv_info}}}"
    
    cover_info = "\n\hspace{12pt}\n".join([info[k] for k in cv_order])
    cover_info = f"\\newcommand\\infocover{{{cover_info}}}"
    # print(cover_info)
    
    commands.append(cv_info)
    commands.append(cover_info)
    commands = "\n\n".join(commands)
    # print(commands)
    
    ### Split JSON by section (HorizontalRule)
    json_parts = split_json(json)
    
    ### Convert JSON to LaTeX
    tex = [to_latex(elem) for elem in json_parts]
    tex = [commands, *tex] 
    
    ### Save each section to separate .tex file
    for i,doc in enumerate(tex):
        filename = f"part_00{i}.tex"
        with open(filename,'w') as file:
            file.write(doc)
            
    print(f"{markdown_file} parsed into {i+1} latex files")
