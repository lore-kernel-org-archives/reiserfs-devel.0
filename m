From: "Brian G. Olson" <bgo@cwru.edu>
Subject: Fixing corrupt reiserfs partition when it registers as full
Date: Wed, 4 Jun 2003 18:14:36 -0400
Message-ID: <20030604221436.GA19187@pals.cwru.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Okay, I've got a reiserfs partition that went bad. I'm don't know how,
but for some reason the partition became completely full.  Showing up as
100% full using df -h. However checking all the files on the partition
(using du -shc) it should have been a little more than half full (2.4G
partition), just as I remember df -h showing the last time I checked. So
I unmounted it, and checked with reiserfsck --check.  Sure enough, it
said I had a problem and told me to do use --rebuild-tree.  Okay, I do
that and pass 1 completes. Then on pass 2 it says it wants to add a
bunch of leaves (on the order of 10,000 leaves), but of course the
partition registers as full so it fails. That is where I am currently
stuck. I can't even mount it anymore, mount says it's 'not a directory'. 

I'm currently using reiserfsck version 3.6.6 from the Knoppix v3.2 cd.
Now I'm gonna try to find a newer version to use, but in the mean time,
if anyone has any ideas I'd really appreciate it. Thanks

Brian
