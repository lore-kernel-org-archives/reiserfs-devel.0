From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Problem with the latest auto snapshot
Date: Sat, 12 Jun 2004 21:31:25 +0200
Message-ID: <200406122131.25974.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_No1yA/eAaQoJzxU"
Return-path: <reiserfs-list-return-19157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_No1yA/eAaQoJzxU
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

i have some problems with the latest auto snapshot against 2.6.7-rc3-mm1 
(2004.06.11-19.36).

After some few disk operation a process try to access some data on the 
partition, and hung forever. I got the following log entries:

Jun 12 20:51:40 sonne kernel:reiser4[emerge(6603)]: create_child_common 
(fs/reiser4/plugin/dir/dir.c:519)[nikita-2219]:
Jun 12 20:51:40 sonne kernel: WARNING: Failed to initialize dir for 88794: -17
Jun 12 20:51:40 sonne kernel: reiser4[emerge(6603)]: rem_entry_cde 
(fs/reiser4/plugin/item/cde.c:1038)[nikita-2628]:
Jun 12 20:51:40 sonne kernel: WARNING: Dir is broke: 88794: 0
Jun 12 20:51:40 sonne kernel: reiser4[emerge(6603)]: done_hashed 
(fs/reiser4/plugin/dir/hashed_dir.c:173)[nikita-2252]:
Jun 12 20:51:40 sonne kernel: WARNING: Cannot remove dot of 88794: -5
Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: create_child_common 
(fs/reiser4/plugin/dir/dir.c:519)[nikita-2219]:
Jun 12 20:52:27 sonne kernel: WARNING: Failed to initialize dir for 88795: -17
Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: rem_entry_cde 
(fs/reiser4/plugin/item/cde.c:1038)[nikita-2628]:
Jun 12 20:52:27 sonne kernel: WARNING: Dir is broke: 88795: 0
Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: done_hashed 
(fs/reiser4/plugin/dir/hashed_dir.c:173)[nikita-2252]:
Jun 12 20:52:27 sonne kernel: WARNING: Cannot remove dot of 88795: -5
Jun 12 20:52:53 sonne kernel: reiser4[sync(6634)]: kill_hook_internal 
(fs/reiser4/plugin/item/internal.c:343)[nikita-1223]:
Jun 12 20:52:53 sonne kernel: WARNING: Cowardly refuse to remove link to 
non-empty node
Jun 12 20:53:03 sonne kernel: reiser4[rm(6725)]: cbk_level_lookup 
(fs/reiser4/search.c:1025)[vs-3533]
Jun 12 20:53:03 sonne kernel: WARNING: Keys are inconsistent. Fsck?
Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
(fs/reiser4/search.c:747)[nikita-1481]:
Jun 12 20:53:05 sonne kernel: WARNING: Too many iterations: 128
Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
(fs/reiser4/search.c:747)[nikita-1481]:
Jun 12 20:53:05 sonne kernel: WARNING: Too many iterations: 256
Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
(fs/reiser4/search.c:747)[nikita-1481]:
...
Jun 12 20:56:57 sonne kernel: WARNING: Too many iterations: 33554432
*****************

I could not kill the process, a reboot was needed.

After the  fsck run with build-fs i got new errors:

reiser4[install(7105)]: cbk_level_lookup (fs/reiser4/search.c:1025)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[install(7105)]: done_hashed (fs/reiser4/plugin/dir/hashed_dir.c:173)
[nikita-2252]:WARNING: Cannot remove dot of 88837: -5
....

Any operation on the fs fail with a input/ output error. I try to fix this 
with fsck, but it found no errors. I attached the output from the first fsck 
runs.
I'll rebuild the partition tomorow, and give it another try..

Best regards,

Henning




--Boundary-00=_No1yA/eAaQoJzxU
Content-Type: application/x-gzip;
  name="fsck.out.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="fsck.out.gz"

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

--Boundary-00=_No1yA/eAaQoJzxU--
