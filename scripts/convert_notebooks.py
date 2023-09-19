import glob
from nbconvert import MarkdownExporter
from nbconvert.utils.exceptions import ConversionException
import os
import nbformat
import yaml
import sys

# Specify the directory where your Jupyter Notebook files are located
notebook_directory = "_notebooks"

# Specify the destination directory for the converted Markdown files
destination_directory = "_posts"

def error_cleanup(notebook_file):
    # Remove the destination file if it exists
    destination_file = os.path.basename(notebook_file).replace(".ipynb", "_IPYNB_2_.md")
    destination_path = os.path.join(destination_directory, destination_file)
    if os.path.exists(destination_path):
        os.remove(destination_path)

def extract_front_matter(notebook_file, cell):
    front_matter = {}
    
    source = cell.get('source', '')
    if source.startswith('---'):
        # Extract front matter from source
        try:
            front_matter = yaml.safe_load(source.split('---', 2)[1])
        except yaml.YAMLError as e:
            print(f"Error parsing YAML front matter: {e}")
            error_cleanup(notebook_file)
            sys.exit(1)

    return front_matter

# Function to convert the notebook to Markdown with front matter
def convert_notebook_to_markdown_with_front_matter(notebook_file):
    # Load the notebook file
    with open(notebook_file, 'r', encoding='utf-8') as file:
        notebook = nbformat.read(file, as_version=nbformat.NO_CONVERT)
        
        # Extract front matter from the first cell
        front_matter = extract_front_matter(notebook_file, notebook.cells[0])
        
        # Remove the first cell from the notebook
        notebook.cells.pop(0)
        
        # Convert the notebook to Markdown
        exporter = MarkdownExporter()
        markdown, _ = exporter.from_notebook_node(notebook)
        
        # Prepend the front matter to the Markdown content
        front_matter_content = "---\n" + "\n".join(f"{key}: {value}" for key, value in front_matter.items()) + "\n---\n\n"
        markdown_with_front_matter = front_matter_content + markdown
        
        # Generate the destination Markdown file name by replacing the extension
        destination_file = os.path.basename(notebook_file).replace(".ipynb", "_IPYNB_2_.md")

        # Generate the destination path
        destination_path = os.path.join(destination_directory, destination_file)
        
        # Write the converted Markdown file
        with open(destination_path, "w", encoding="utf-8") as file:
            file.write(markdown_with_front_matter)

# Function to convert the Jupyter Notebook files to Markdown
def convert_single_notebook(notebook_file):
    try:
        convert_notebook_to_markdown_with_front_matter(notebook_file)
    except ConversionException as e:
        print(f"Conversion error for {notebook_file}: {str(e)}")
        error_cleanup(notebook_file)
        sys.exit(1)

def convert_notebooks():
    notebook_files = glob.glob(f"{notebook_directory}/*.ipynb")
    
    for notebook_file in notebook_files:
        try:
            convert_single_notebook(notebook_file)
        except ConversionException as e:
            print(f"Conversion error for {notebook_file}: {str(e)}")
            error_cleanup(notebook_file)
            sys.exit(1)

# Call the function to perform conversions when the script is run directly
if __name__ == "__main__":
    convert_notebooks()
