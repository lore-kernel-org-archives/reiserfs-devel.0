From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Current status of Reiser4
Date: Thu, 31 Jan 2008 01:13:32 +0300
Message-ID: <47A0F68C.2040805@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Bartosz Szreder <cfiend@talent.edu.pl>, Matthew <jackdachef@gmail.com>, Dushan Tcholich <dusanc@gmail.com>

           Current status of Reiser4 (Jan 31, 2008).


                  I. Todo for inclusion:


This is an update of the following version:
http://209.85.129.104/search?q=cache:tzvFNZjSsNYJ:pub.namesys.com/Reiser4/ToDo

#10,11: Cleanups. There are 74 pending patches prepared by Dushan:
http://marc.info/?l=reiserfs-devel&r=1&b=200710&w=2
which are supposed to be reviewed by another person and pushed to
the current -mm as a big single patch _before_ the next portion of
cleanups.

#3 There is a pending patch to review/merge:
http://marc.info/?l=reiserfs-devel&m=119316601418489&w=2

#9: I don't see any leaked jref there. Perhaps we need to rewrite this
portion of code to make it more clear.

#1,2,4: Here we need to explain why the pair igrab/iput (igrab in
reiser4_writepage, iput in entd()) won't hummer inode_lock. Actually
we need to pin inode for entd, as inode can be reused, or evicted from
memory at the moment when entd starts to process the request. Entd is
a kernel thread, which performs an "active" response to every memory
pressure notification (writepage). IMHO this is not a good design.
Getting rid of entd would address #1,2,4 automatically (currently I am
working on this).

#5: Here should go detailed comments how do reiser4 respond to memory
pressure notification (writepage, see above). If mainline vm experts
will be unhappy with this, then, I guess, we'll need eflush back, plus
a eflush port for cryptcompress file plugin. Eflush (emergency flush)
is a "passive" response to writepage(), which pushes dirty pages to
temporary location on disk. Eflush code for default (unix-file) plugin
has been dropped ~1.5 years ago in accordance with Hans' direction in
order to stimulate better solutions.

#14 Should be marked as "not done" and needs to be addressed.


                    II. Longterm todo


Here are some technical details for the items listed in this document:
http://lwn.net/Articles/226251  (see Appendix D, 11.2-11.4).

Xattrs support (listed as #12 in the previous todo, but not necessary
for inclusion) would be a serious project which requires only
knowledges of VFS/Reiser4/Reiser4progs internals. I think that xattrs
should be implemented via special reiser4 stat-data extensions.
However, currently reiser4 supports only "solid" stat-data items (an
item is "solid", if it consists of exactly one unit, i.e. can not be
split into two or more mergeable items). It means that amount of
information contained in file's xattrs will be restricted by ~4000
bytes (blocksize - size-of-node-header - size-of-item-header -
size-of-standard-stat-data-extensions (for i_size, i_mtime, i_ctime,
i_mode, etc..)). I don't know if it is enough to integrate reiser4
with Selinux. If not, then we'll need one more stat-data item plugin
to support "not solid" stat-data items.

As per encryption support: current reiser4 kernel module and
reiser4progs are pretty aware about this, so IMHO we just need an
integration with some existing key manager (I would take a look how
things are going in eCryptFS). Also we need a fast IV generator for
chaining cipher modes. I have proposed a simple one based on iv-seed,
which is calculated as object's id (i_ino), but not sure if it is
stable against watermark attack.

ECC-signatures support should be implemented via a new node41 plugin
(i.e. we need to define proper node format and plugin methods that
take into account space for per-node signature storage (for example,
if we use an adler32 checksum as ECC-signature, then we need 4 bytes
per node). Supporting such signatures allows to increase robustness.
Currently reiser4 performs data (not metadata) checksumming for files
managed by cryptcompress file plugin. However, metadata protection is
not a less important feature. I think, that we need something like
Reed-Solomon signatures rather then checksums, because all modern hard
drives already perform checksumming. I believe there are reasonable
GPL's libraries that implement RS-arithmetic which can be interesting
for us.

All reiser4 documentation has been performed as comments in the source
code. Also there are links to some useful stuff:

reiser4 transaction design document:
http://lwn.net/2001/1108/a/reiser4-transaction.php3

whitepaper:
http://209.85.135.104/search?q=cache:EwK-ZBZaSxwJ:www.namesys.com/v4/v4.html

Trees in the Reiser4 Filesystem, Part I,II:
http://www.linuxjournal.com/article/6267
http://www.linuxjournal.com/article/6569

Thanks,
Edward.
