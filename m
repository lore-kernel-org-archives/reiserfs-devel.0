From: Edward Shishkin <edward@namesys.com>
Subject: Handling holes by reiser4 cryptcompress (crc) object plugin
Date: Tue, 08 Feb 2005 18:30:02 +0300
Message-ID: <4208DAFA.5090007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

Hi everyone.
This holes design looks pretty reasonable and Hans asked me to discuss 
in the list about
possible obscured issues.

First, this is a short report about crc-plugin business.
All crc-file operations are going per-cluster. Cluster size is an 
attribute of crc-file
assigned by user as N*PAGE_SIZE (N==1, 2, 4, 8, 16). So each crc-file is 
considered as
a set of chunks and the crc object plugin manages the following objects:
.page cluster of index I (a set of N pages, the first one has index 
I*PAGE_SIZE),
.disk cluster of key K (a set of mergeable items (powered by reiser4 
ctail item plugin),
 the first of which has key K).
Disk clusters contain processed (compressed, encrypted) data, whereas 
page clusters
contain plain text.

The file can contain holes. Currently if we create a hole which occupies 
more then one
cluster, we don't represent it by any items. We use to say that 
appropriate disk cluster
is _fake_ (it doesn't exist neither in memory nor on disk). Partial 
holes are represented
by real disk clusters (a hole is partial if it starts in the cluster 
from non-zero offset).

The crc-specific file_read(), mmap(), etc.. call readpage(), readpages() 
which use to fill
pages by plain text prepared from the data which is contained in the 
appropriate disk cluster,
and if the last one is not found (dc is fake) the pages are filled by 
zeroes. Note we take
care of this to be not found in a good sense: the search routine should 
return NOTFOUND
(not an error).
If we modify a hole page cluster (by crc-specific file_write, mmapped 
write), and the
appropriate disk cluster is fake, then real disk cluster will be 
created. If we truncate
up/down a hole page cluster and the appropriate dc is fake, we don't 
create a real one
(just update stat-data).

Example of possible crc-file evolution (cluster size == 64K):
(Operations/Resulted disk structure)
1. create / disk stat-data (i_size == 0)
2. truncate up to 10G / disk stat-data (i_size == 10G)
3. truncate down to 20M / disk stat-data (i_size == 20M)
4. write 100K from off 70K /disk stat-data (i_size == 20M) + 2 disk 
clusters (key1== 64K, key2 == 128K)
5. truncate down to 100K / disk stat-data (i_size == 100K) + 1 disk 
cluster (key1==64K)
6. truncate down to 50K / disk stat-data (i_size == 50K)
etc...

This design has been encoded and seems to be working on various 
benchmarks which
create intensive hole fragmentation, but ... so all 
questions/suggestions are welcome.

Thanks,
Edward.
