From: Redeeman <redeeman@metanurb.dk>
Subject: results of my filesystem test, xfs, jfs, ext3 and reiserfs
Date: Mon, 22 Dec 2003 11:46:51 +0100
Message-ID: <1072090011.4349.8.camel@redeeman.linux.dk>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

i decided to make a little test between those filesystems, to test speed
and stability. i will not include the accurate numbers here as i have to
get it together, (my notes are messy :)) but i will tell how it was.

i made a gentoo install and 4 other partitions, with each filesystem,
and made a tar archive of it, copied to the new partitions (jfs fastest
on the copy, then reiserfs, xfs and ext3)
then i unpacked, (reiserfs fastest, jfs, xfs, ext3) and edited fstab,
and grub entries, i tried some different things, start time, stop time,
time after a power failure while reading and writing.

i also tried do emerge sync, where reiserfs was incredibly fast.

on start and stop time reiserfs was second fastest, (matter of ms). and
when i wrote and read the same time, and cut the power, reiserfs was
much slower, i did this twice, and the second time all files on the
reiserfs partition disappeared, where ext3 had to do fsck, but jfs and
xfs just started up with no loss (except the file i was writing to)

any idea why reiserfs does this? i would like to use reiserfs on my
workstation because its ultra fast speed on small files, like on emerge
sync, but i dont like that it isn't capable of power loss :((

reiserfsck could almost fix it, but after a rebuild-tree i still had
lost some libraries which i didn't write to.

-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments


