#Leitor de Arquivos

// utils.v
module utils

import os

pub fn read_file(file_path string) ?string {
    content := os.read_file(file_path) ?
    return content
}

