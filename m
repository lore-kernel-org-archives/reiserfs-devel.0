From: Edward Shishkin <edward@namesys.com>
Subject: Basic interface for key management in reiser4 (DRAFT)
Date: Wed, 17 Aug 2005 18:50:44 +0400
Message-ID: <43034EC4.9040906@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

  Hello everyone.

  Here is a description of a simple optional interface to import and 
propagate
cipher keys. This interface will be available via compile-time option
ENABLE_COMMON_CRYPTO_STAT which adds some fields to in-memory structures 
reiser4
superblock and reiser4-specific part of inode.
  The common idea is to make possible to attach a key to any object 
(directory,
regular file, etc..) that is supposed to work with (there is a special 
pointer
in reiser4-specific part of inode when this option is on), and propagate 
it down
(root is up) through the semantic tree via its inheriting from parent 
objects).
In spite of its simplicity there can be various obscured issues, so all 
comments
are welcome.

NOTE: This interface is over linux crypto-api.

  I should remind that encryption and compression in reiser4 are 
performed in
flush time for a special kind of reiser4 regular files (cryptcompress 
files).
Currently only directories and cryptcompress regular files interact with
cipher keys.


                        I. Object cipher keyid


  Each regular cryptcompress file should have a keyid (32-bit or greater 
word)
which is created by reiser4 digest plugin and supposed to be stored in disk
stat-data. The keyid exists because of 2 reasons:
1. It is used for key identification: even if cipher key is not loaded, user
   can check the object keyid (for example by using a pseudo-file 
interface) and
   use it to find an appropriate cipher key (which is located in mind or
   somewhere on removable area).
2. It is used to not allow users load wrong keys, because writing to a 
file with
   wrong key loaded leads to data corruption (it is harmfully not for the
   filesystem, but for user)

  Keyid is created by the pair "key-passphrase", where "key" is a string 
which
is required by cipher algorithm and participates in cipher transforms, and
"passphrase" is any private string. Both key and passphrase should be 
specified
by user). Keyid is created by the following steps:

1. encrypting the passphrase by the key;
2. creating a big digest of the result by stable hash function (sha256, 
etc..)
3. having first N bits of the big digest as resulted keyid.

Q: Is it safe to use only 32 bit for keyid?
A: Having a 32-keyid does not allow to reveal a cipher key as the big digest
   was created by safe operations. If you want to avoid collisions in key
   identification add a new digest plugin that will create a greater keyid.


                     II. Importing a cipher key


  First of all a cipher key should be imported to the kernel and uploaded to
some object. We will use to say that key is attached to the object A 
meaning this
initial importing and uploading to A.

  One of the possible ways to attach a cipher key to an object is to 
implement
it via a ->write() method of special new keyload pseudo file 
(PSEUDO_KEYLOAD_ID)
of this object. It means accepting and parsing a pair "key-passphrase", then
allocating and filling the following structure:

typedef struct crypto_stat {
       __u8 *keyid;          /* keyid */
         int keyid_size;     /* keyid size */
       ...
       __u32 *key;           /* cipher key wrapped by
                                struct crypto_tfm 
(include/linux/crypto.h) */
       ...
       int keyload_count;
} crypto_stat_t;


        III. Packing/extracting crypto stat-data of the object

  The crypto-stat of directory inode is not saved on disk.
When writing inode of (cryptcompress) regular file, keysize and keyid 
are saved
on disk in special reiser4 CRYPTO_STAT stat-data extension.
When reading inode of regular file the ->present() method of this stat-data
allocates and fills the crypto-stat, but without cipher key loaded 
(there are
only keysize and keyid). Such incomplete crypto-stat can be used only to
observe crypto-specific attributes of the file (for example by ->read() 
method
of its keyload pseudo-file).


                   IV. Propagating a cipher key


Some definitions:

To load a specified crypto-stat to the object means to keep a pointer to 
this
structure in reiser4-specific part of inode and increment a keyload_count.

To unload a crypto-stat of the object means to decrement keyload_count 
and free
the structure if this count became zero.

NOTE: All load/unload operations are protected by special per-superblock
semaphore.

Propagating a cipher key is going as inheriting the crypto-stat from 
parent to
child via special methods of reiser4 file plugin:

1. Inheriting during open()   is implemented via ->open();
2. Inheriting during create() is implemented via ->adjust_to_parent();
3. Inheriting during lookup() is implemented via ->bind().

  All those methods try to inherit crypto-stat from parent. If 
inheritance is
possible, the old crypto-stat of the object is unloaded (if any) and new one
is loaded. If the child is a directory, the inheritance is always possible.
If the child is a cryptcomperss file inheritance is possible only if 
this child
does not have a crypto-stat (file just created) or its keyid and other
attributes (except a cipher key) coincide with the attributes of parent
directory.
  So if you wanna open/create a file one should attach a key to any existing
member of its pathname. For example, in order to create 
"/mnt/mydir/myfile" one
may attach a key either to "/mnt", or to "/mnt/mydir". In the first case 
it is
possible that "/mnt/mydir" is in the cache already, so it is necessary 
also to
open it for carrying out the key. Key can be attached to existing
(cryptcompress) regular file if it does not have a cipher key loaded 
(also it
should have in its plugin_set non-trivial cipher transform plugin 
installed).


                    V. Eliminating a cipher key


Eliminating is possible only as a result of unloading a crypto-stat that 
is used
by nobody (keyload_count became zero). Eliminating can occur when
1. inheriting a crypto-stat (old crypto-stat is unloaded);
2. evicting from memory unused inode (its crypto stat is unloaded by
   ->destroy_inode() method of file plugin).


                  VI. Opening a cryptcompress file


plugin->open() tries to inherit a crypto-stat from parent, then 
evaluates the
expression (crypto_stat loaded => cipher key loaded). If it is not true, 
EINVAL
will be returned.


                 VII. An example of possible scenario (DRAFT):

#pwd
/mnt
#mkdir mydir
#echo -e "crc\0" > mydir/..../plugin/regular
#cat mydir/..../plugin/regular
1 cryptcompress Cryptcompress regular plugin
#cat mydir/..../plugin/compression
0 lzo1 lzo1 compression transform
#cat mydir/..../plugin/digest
1 sha256-32 sha256-32 digest transform
#cat mydir/..../plugin/crypto
0 none absence of crypto transform
#echo -e "blowfish\0" > mydir/..../plugin/crypto

#touch mydir/myfile
Unable to create file
#cat mydir/..../keyload
No key loaded

#echo -e "08e19c2d91bbc14f06af9ec61e68\0" > mydir/..../keyload
          ^^----------------^^^^^^^^^^
       keysize     key      passphrase

#cat mydir/..../keyload
keyid32: f56ef868
loaded 8-byte key for Blowfish cipher algo

#echo "Hello World" > mydir/myfile
#cd /
#umount /mnt
#mount /dev/hdb5 /mnt
#cat /mnt/mydir/myfile
Unable to open file
#cat /mnt/mydir/myfile/..../keyload
keyid32: f56ef868
No key loaded

#echo -e "08e19c2d91bbc14f06af9ec61e68\0" > /mnt/mydir/..../keyload
#cat /mnt/mydir/myfile
Hello World


                       VIII. Thats all


Thanks,
Edward.
