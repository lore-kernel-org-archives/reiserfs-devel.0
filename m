From: Noyan Ilmen <Noyan@Ilmen.de>
Subject: dead inode read from disk [1 2 0x0 SD]. This is likely to be race with knfsd. Ignore
Date: Tue, 11 Mar 2003 19:43:43 +0100
Message-ID: <30370000.1047408223@bidolor>
Reply-To: Noyan Ilmen <Noyan@Ilmen.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="==========877300887=========="
Return-path: <reiserfs-list-return-13191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--==========877300887==========
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Ignore - ha ha very funny
Ignore means: can't mount ("no mount dir" or somethimg like that)
I've got 80GB Data lost.

nfs with reiserfs seems to be still buggy and corrupts data.

What happens:
  day 1:
   (syslog)(see attachment 1)
Mar  9 21:31:16 outa kernel: vs-5150: search_by_key: invalid format found in block 7843968. Fsck?
Mar  9 21:31:16 outa kernel: vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [220650 220800 0x0 SD]
Mar  9 21:31:17 outa kernel: vs-5150: search_by_key: invalid format found in block 7843968. Fsck?
Mar  9 21:31:17 outa kernel: vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [220650 220805 0x0 SD]
.
.
.
   (reiserfsck --check)(see attachment 2)
node (7843968) with wrong level (44655) found in the tree (should be 1)
whole subtree skipped
free block count 3902051 mismatches with a correct one 3953043.
on-disk bitmap does not match to the correct one.

eh??? (h=E4???)

   (reiserfsck --fix-fixable)(see attachment 3)
node (7843968) with wrong level (44655) found in the tree (should be 1)
whole subtree skipped
free block count 3902051 mismatches with a correct one 3953043.
on-disk bitmap does not match to the correct one.

eh??? (h=E4???)

this above takes me hours: rtfms, null-info-reiser-docs, net,...
what the hell is "...reiserfsck returns 1 to  indicate..." Do you
think I write functions to eval your return values?

shutdown

day 2:
   can't mount local reiser disk

much more hours

   (reiserfsck --check)(see attachment 4)
bad_stat_data: block 9160, [1 2 0x0 SD (0)], directory SD has bad nlink number
bad_stat_data: block 9160, [2 4 0x0 SD (0)], SD has bad nlink number
.
205300 lines later
.
bad_stat_data: block 22978597, [310954 310965 0x0 SD (0)], SD has bad nlink number
free block count 3902037 mismatches with a correct one 3953043.
on-disk bitmap does not match to the correct one.

   (reiserfsck --rebuild-tree)(see attachment 5/6)
   reed your warnings about your buggy-beta-loose-all-data-software and say "Yes",
   because there wasn't any more to backup. Btw it takes about 3 days to backup
   the 80G with my DDS3 streamer.
####### Pass 0 #######
"r5" got 206443 hits
####### Pass 1 #######
####### Pass 2 #######
are_file_items_correct: convert the indirect item back to direct 208191 208307
####### Pass 3 #########
are_file_items_correct: convert the indirect item back to direct 67929 7778
.
.
.
are_file_items_correct: convert the indirect item back to direct 258907 258912
####### Pass 3a (lost+found pass) #########

takes about 2 hours and I was able to mount the partition.
If there is lost data? I don't know, but it would not be the first time I lost
data with reiserfs.


system-setup:
server with:
 debian sarge
 kernel 2.4.20-686 / ReiserFS version 3.6.25
 reiserfsprogs 3.6.3-1
 nfs-kernel-server 1.0.2-1
 samba 2.2.3a-12

client with:
 debian sarge
 kernel 2.4.19-smp
 nfs-kernel-server 1.0.2-1
 samba 2.2.3a-6

Please don't annoy me with mails.
my only desire is to convert to ext2/3. Spricht hier jemand deutsch?

Noyan
 
--==========877300887==========--

