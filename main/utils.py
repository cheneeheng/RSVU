import yaml

KEY_FILE_PATH = '_file_path'


def load_yaml(filename):
    with open(filename, 'r') as f:
        return {KEY_FILE_PATH: filename, **yaml.safe_load(f)}


def load_yaml_list(filenames_list):
    return [load_yaml(f) for f in filenames_list]