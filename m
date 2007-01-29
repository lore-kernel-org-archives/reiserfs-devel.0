From: "clara" <seawaves@clara.co.uk>
Subject: reiserfsck --rebuild-tree failure
Date: Mon, 29 Jan 2007 02:50:59 -0000
Message-ID: <000201c74350$85da2820$1500000a@PEACH>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have three drives: one data drive, hdb, with one ext2 partition and two
system drives, hda and hdc, each with swap and two reiserfs partions, one
with root hda3/hdc3 and one with data files hda2/hdc2. I can normally boot
either system from the suse boot menu.

I had a bootfailure of Suse 8.1 on both drives. What seems to be known as a
kernel panic!

I crawled my unknowledgeable way to fsck and reiserfsck (3.6.2) and found
that one partion on one drive came up "NOT clean".

It is the hdc2 data partition that is NOT clean.

I did a --rebuild-tree on that drive and it consistently fails with:
bread: cannot read block #9140832.

I don't care much about anything on that partion but would recover files if
I could. I would be happy if the file using this block was rubbish.

My real problem is not to be able to boot anything. I am not conversant with
linux but I am pretty OK with system concepts. I need to boot the system on
hdc, ignoring the problems on hda and then copy out both hda partitions as
images to files on a USB drive. Any problem blocks should be transferred as
zeros rather than stopping the process with an error. It would be handy to
note the filename of any files with blocks that could not be read. I found a
program called copy-blocks that claims to do this for an ext2 partition
http://lists.debian.org/debian-user/2001/12/msg04697.html

Is there any chance that this will work with reiserfs partition?
Could I then restore this partiton and rerun --rebuild-tree so make the file
system mountable again?

Please can you help with advice or references?

Mike

