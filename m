From: Jussi Judin <jjudin+reiser@iki.fi>
Subject: [BUG] nikita-1481, nikita-717 and nikita-373 here and there
Date: Fri, 23 Jun 2006 02:51:57 +0300
Message-ID: <449B2D1D.9000507@iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I was using some Debian patched 2.6.16 kernel and reiser4-2.6.16-1 patch 
for that and suddenly got the error messages attached. The java program 
in those error messages is doing a huge amount of writes all the time 
and probably in many threads at the same time.

<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 16384
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 32768
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 65536
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 131072
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 262144
<4>reiser4[java(4496)]: traverse_tree (fs/reiser4/search.c:733)[nikita-373]:
WARNING: reiser-2018: Too many iterations. Tree corrupted, or (less 
likely) starvation occurring.: level: 5, lock_level: 2, stop_level: 1 
lock_mode: read, bias: left-slant
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 128
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 256
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 512
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 1024
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 2048
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 4096
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 8192
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 16384
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 32768
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 65536
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 131072
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 262144
<4>reiser4[java(4496)]: traverse_tree (fs/reiser4/search.c:733)[nikita-373]:
WARNING: reiser-2018: Too many iterations. Tree corrupted, or (less 
likely) starvation occurring.: level: 5, lock_level: 2, stop_level: 1 
lock_mode: read, bias: left-slant
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:
WARNING: Too many iterations: 128
<4>reiser4[java(4496)]: traverse_tree 
(fs/reiser4/search.c:700)[nikita-1481]:

After that I upgraded to Debian patched kernel 2.6.16-14 and to reiser4 
patch 2.6.16-4 for that kernel and ran fsck.reiser4. Then I got errors 
like this in kern.log after a while:

WARNING: Error for inode 1731981 (-2)
reiser4[nfsd(3817)]: key_warning 
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 1703086 (-2)
reiser4[nfsd(3818)]: key_warning 
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 1726433 (-2)
reiser4[nfsd(3818)]: key_warning 
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:

The nfsd in question was trying to read the file system and didn't 
succeed in that. It showed file names but no other information for them. 
  I have ran fsck.reiser4 again but haven't done any heavy writing on 
that file system for now.

The version of fsck.reiser4 and other reiser4progs is 1.0.5-1 (the 
version in Debian testing).

  - Jussi Judin
