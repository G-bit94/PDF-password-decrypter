## PDF password decrypter

### Overview

This is a bash script that removes password protection from encrypted PDF files on Windows. Based on [zvyn/pdf-decrypt](https://github.com/zvyn/pdf-decrypt) but modified to work with Git Bash and Windows file paths.

### Prerequisites

- Git Bash
- [QPDF](https://github.com/qpdf/qpdf) installed and accessible in, say, `C:\Program Files\qpdf 11.10.1\bin\`

### Installation

1. Download script or clone the repo

2. Navigate to the script download directory
 
3. Make the script executable:
   ```bash
   chmod +x pdf-decrypt.sh
   ```

### Usage

To decrypt a PDF, run the following command in Git Bash:

```bash
./pdf-decrypt.sh /c/Users/<YourUsername>/Downloads/encrypted.pdf
```

Replace `/c/Users/<YourUsername>/Downloads/encrypted.pdf` with the actual path to your PDF file.

You'll be prompted to enter the password for the encrypted PDF. Once entered, the script will permanently remove the password protection and overwrite the original file.

Thanks [Zvyn](https://github.com/zvyn)!
