From: Edward Shushkin <edward@namesys.com>
Subject: Reiser4 crypto-compression design
Date: Tue, 25 Mar 2003 22:52:36 +0300
Sender: edward
Message-ID: <3E80B384.2190B074@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, Pierre Abbat <phma@webjockey.net>

 This is a short report about Reiser4 crypto-compression design.

Reiser4 will provide transparent data compression and encryption so
every desirable crypto and compression algorithm can be easily
built-in due to plugin architecture. 
  Besides standard unix files, reiser4 will support so-called
crypto-compression files.
  Currently we implement the approach when all crypto-compressed files
are stored in tail items (fragments) on disk. The first obvious
advantage of this approach is that it allows to achieve ideal
compression ratio even when we use small clusters ({1,2}*BLOCK_SIZE),
while it is impossible in traditional approach (when we store file in
whole number of blocks. I use the term "traditional", because this
approach is already implemented in ext2 compression port). At the same
time, small clusters provide better random access to the file data. So
we hope to take some benefit by storing compressed data in tails. All
the compression issues for the traditional approach described in the
following paper:
ttp://www.namesys.com/compression.txt
  When user creates a crypto-file, the file system asks for a secret
key and calculates its id (128-bit word) which supposed to be stored
in file's stat-data on disk.
  When user opens crypto-file, the file system asks for a secret key,
checks (by the id) if it is valid, and places a pointer to the
crypto-file info to the reiser4 specific part of inode. This info
includes cpu key words created by special method of the crypto plugin
by the valid secret key.
  Crypro-compression specific reiser4_read() method is well known
generic_file_read(), it calls special reiser4 readpage() method,
which performs "curve" mapping of on-disk clusters (sliced into tail
items) to the page cache by using main reiser4 disk search procedure
and calling decryption and decompression method. So we fill pages by 
decrypted and decompressed data. 
  Crypto-compression specific write_page() method just copies data
from user to the page cache. Its compression and encryption are
performed by reiser4 flush algorithm before it will be written on disk.
So before squeezing, relocation and other common tasks, the flush
algorithm processes appropriate clusters from the page cache, slices
the result into tails (fragments) and inserts it into the main
balanced tree.
  The cluster approach (which is required for compression) is also
useful for encryption purposes: it allows to support various complex
"per cluster" crypto stream modes, which provides more security then 
simple "per crypto-block" encryption (crypto-block means minimal input
data unit accepted by the crypto algorithm).
 Generally, small chunks of data can not get a good compression, so we	
don't try to compress the flow which size <= MIN_SIZE_FOR_COMPRESSION.
The last value supposed to be found experimentally. Also we don't create
compressed format if the compression algorithm detects that flow can not
get a good compression (more precisely, if 

    orig_size - size_after_compression >= crypto_blocksize +
    end-of-cluster_magic_size
).
In all other cases we append at the end of compressed data a special
"aligning" signature which indicates the end of compressed cluster. We
need to align this up to multiple of crypto block size to make
possible encryption. Also by this signature we can restore
original length of the input size for decompression. Also this
signature allows to handle IO_ERROR during read of cluster, etc..

All wishes and suggestions are welcome.
Thanks, 
Edward.
