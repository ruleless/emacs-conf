# What it is

An Emacs interface to encrypt and decrypt files with `openssl`.

# Installation

1. Download the elisp file
2. Add to your .emacs file:

<pre>
 (add-to-list 'load-path "DIR WHERE TODOTXT-MODE LIVES")
 (require 'openssl-rw)
</pre>

# Disclaimers

**Alpha stage, with little testing.  Make sure you backup your important data!**

Notice also that the function disables Emacs auto-save features on the file
being read.

# Usage

* `M-x openssl-write-file` encrypts the current buffer and saves it to disk
* `M-x openssl-find-file` opens an encrypted file

You can then start working on the file.  When you save, the buffer is encypted
first.  This is done by associating a hook, which automatically encrypts the
buffer before saving it to file. (You can `M-x undo` to undo the encryption
and keep working on the current buffer.)

The algorithm used is aes-256-ecb.  It will be made configurable in future
releases.

To automatically decrypt a file with find-file put the following code
in your .emacs file.  It binds the decryption function to files with
the ".enc" suffix:

<pre>
  (add-hook 'find-file-hook 
    (lambda ()
      (if (string= "enc" (file-name-extension (buffer-file-name)))
          (openssl-decrypt-and-hook-current-buffer))))
</pre>

Alternatively you can try:

<pre>
    M-x find-file
    M-x openssl-decrypt-and-hook-current-buffer
</pre>

(Careful with other hooks you might have associated to `find-file`, however.
If the decryption fails, it might be due to Emacs choosing an encoding system.

# Licence

MIT

# Todo

* Make the encryption algorithm configurable

