From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: reiserfs corruption through 2.6 crash?
Date: Thu, 11 Mar 2004 12:12:53 +0100
Message-ID: <m3ishb7i2y.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <reiserfs-list-return-17175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


Hi,

I have been using reiserfs with very few problems over the past months.

On March 5th however, my machine went down hard (no power loss though,
just a crash with reboot during regular work) and after reboot logged
vs-5150 vs-13070 problems to console and refused read access ("no
permission") to some files (/var/log/messages for instance) even for
root.

I then ran reiserfsck, as suggested by the kernel, reiserfsck stated I
had to rebuild the tree.

I then ran dd to make a full image of the file system and debugreiserfs
-p to save the meta data, file sizes are:

    compressed   uncompressed  ratio uncompressed_name
     481254364     1610612736  70.1% _dev_vg0_var.dd
       5389086       25223285  78.6% _dev_vg0_var.debugreiserfs_-p

Afterwards, I run reiserfsck and made it rebuild the tree, that seems to
have worked - but unfortunately, my /var/log/messages file came out as
all-zeroes, so the logs below have been recreated by loopback mounting a
copy of the file system on a post-2.6.4-pre3 from BitKeeper.

The kernel at the time of crash was *presumably* a pretty recent BK
version from bk://linux.bkbits.net/linux-2.5 at that time, but might
have been some 2.4 BK - I cannot figure this out as the original log was
lost.

I can provide the debugreiserfs_-p on short notice and will mail the URL
off-list. I you have a GnuPG key pair, please state which GnuPG key ID
I should use to encrypt the image.

relevant reiserfsck --check messages:

block 200005: The number of items (21) is incorrect, should be (20)
 the problem in the internal node occured (200005), whole subtree is skipped
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree

The reiserfs --rebuild-tree log is attached (gzipped).

kernel messages for a loopback mount of a copy of the corrupt file
system are (warning, long lines):

### FROM "mount ..."

found reiserfs format "3.6" with standard journal
Reiserfs journal params: device loop0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (loop0) for (loop0)
Using r5 hash to sort names

### FROM "find /mnt"

is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1329 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1343 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1363 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1383 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1389 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1475 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1488 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1538 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1584 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1623 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1623 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=21, free_space=65525 rdkey 
vs-5150: search_by_key: invalid format found in block 200005. Fsck?
vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [48 1623 0x0 SD]

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95

--=-=-=
Content-Type: application/x-gzip
Content-Disposition: attachment; filename=rebuild.log.gz
Content-Transfer-Encoding: base64
Content-Description: gzipped reiserfsck --rebuild-tree log

H4sICLlHUEAAA3JlYnVpbGQubG9nAL2ZXW/iOhCG7/kVI3pTtAXZ+U7v2E21qrZ0q4aVjlQhFBJT
rEKMEgPb8+uP7fCVEgqcgnNRCRvmzcw847Hdqyv1wFOU54Cg+HRVG4xZ/AYGEo99C90RgXQ2GZAM
2BAoJ5Mcrg3cAJoDTWOWZSTmN5CP2GycwICISdSAJixnSFJhb5gRAvk0isW3Hds27E+smZZfNmdj
jAxIqPzIsncgKc8oyWFBMgKjKB+RBBaUj6Ce2XU10KpdbXuK156Who3qYXM1LCbm02ETI8dDSzfo
mMCL5QF2DLMnpYCL4UXG0lcovI7ZLOXCMzUR8ogHEY/g2jVco+QVcAbXqLFfwXROU/DQrn3vM/vW
afZ9p8K+cKAcO/HFMcv5t6EwksBUjDW2wpkRoRBx0hfJvIUOm1Oh+oJN5LqAxQPoL4IwkIHpSYHl
lLk9fowRDMH9syBpx8pmovZKeD8lf3l/DVZfsl6ESSL2DvVWqy5rQAZig9/KXA+mjKZcgCg1ZETF
cO9GRC7nJErkD18MMKxeCeaMDGZ0nPRzMolSTuO+jNG26IvyQRjzjB5c14N2t11vyHTsfQP1Ailb
jGQ9NGVhZWTC5qeJuVKscxfcX15NlIKnXLsLfzzfP3Xvfz/+b80l3vYS7yoLZcZz+i/ZhRsjc5du
0258DpthmXuIdY8ntjBSSax7XmLdixErfRDGkHeAWPccDEkxy0Ouc4jYs6mJP/ZxwB6WPASse0Fg
TdPD3h5isX80siszlcwqO2eEFvuXorZww3Sw5xzAdv0OXyFpJScED4F7Tj0bu/g4do9QPQSvNHEZ
ej1D5t33q+gVcwY6jt4tM7v0ruyci15lr0zvVm8/w7KrPMGmsCkz/D3Kad4M5carlZNxVZa33+hL
q+JK2VYrvtjXv0WvJNciWZTPSrIV/NGjikqqCdETXr+kGmuKsFFSJakeVbOsqslXq6Q6zC6vamDP
K6uOZlp8NRRNncAO/3RCLYpY5TQhw2g25toWpeJ08RC0n5ohyeYk06NsGQa2lHT3uf0YtrrfH74i
ushEp+nL8/ot4OU1jOgUxQF+7SsStap+sWpiCrBebXPWX48Vr1y0ZZoOGUQDNuOqb/GIjj926Rvx
+yxfdb7+4J0T0bh323YT77lkWAufdItReUlSlWWkVql2Mo/SmCTNgMzJ+ECiZ9MkWlpV4f8QsxMQ
s1QBdwTVdEISGuljWx1EHtqdJ22SWDH9KyGaFJHv2Sq3Qk6oUJbqaQWmEu3QlE6iQySda8lwDK/Y
nv+DsbaEInOzXTymbM6lbGEfqaNWOAvvmgGLZxPxhUhmWB/MqnB/RhPRdrXVrLUsIBHt/I2zqTbl
4trikfAFy970qap9xu/hkMa61gyRWHWB+TNlE32a1vaK8U1bCZu+j2x1HunG46KC2VSW0tfkPzTx
ShMndPKKf3dsdgrVNwiVItU3CJ5VsRVx/EbtP5iwFqPjGgAA
--=-=-=--
