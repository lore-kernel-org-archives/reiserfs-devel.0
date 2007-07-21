From: Edward Shishkin <edward@namesys.com>
Subject: Reiser4 for 2.6.22
Date: Sat, 21 Jul 2007 23:19:18 +0400
Message-ID: <46A25C36.1060005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Hello everyone.

The corporative Namesys server doesn't work,
and I don't know how much time it will be in such
state. So I have put the patch in this place:
http://chichkin_i.zelnet.ru/namesys/index.html 
<http://chichkin_i.zelnet.ru/namesys/index.html>

The list of changes since reiser4-for-2.6.21:

1) Common changes:
   . Reduce number of typedefs from 289 to 248
   . Remove unused file plugin/file/invert.c

2) unix-file plugin fixups:
   . Fixed bug in extent2tail conversion.
       Bug description:
       when converting partially converted file
       (with flag REISER4_PART_MIXED installed)
       reiser4_cut_tree() starts to cut old metatada
       from wrong offset. Result is data corruption
       when booting after system crash, power loss,
       etc.
   . Update hint when reading tails (failed assertion
     nikita-19891 reported by Jake Maciejewski,
     Ingo Bormuth)
   . Protect page (via incrementing page count) from
     being reclaimed when looking for extent pointer
     in unix-file specific readpages filler (oops reported
     by Zan Lynx).

3) cryptcompress file plugin fixups:
   . Fix a race (reproducible by fsx + sync(1))
     between checkin page cluster operations:
     serialize them via special per-inode checkin_mutex
     (usual i_mutex is not suitable for this purpose,
     as ->writepages() also calls checkin_page_cluster();

   . Add comments for checkin/checkout technique for
     synchronization of primary and secondary caches
     with proof of correctness;

   . Fix missed right neighbor when updating disk
     clusters by handle_pos_on_leaf() during squalloc
     (should use upper levels to get expected non-connected
     neighbor);

   . Resolve a race between read and truncate (when read
     finds partially truncated and, hence, unrecoverable
     disk cluster) via keeping a track of leftmost
     truncated disk clusters in cryptcompress-specific
     part of inode;

   . Update comments;

   . Rename badly sounding function names;

   . Fix coding style;

Thanks,
Edward.
