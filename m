From: Mike Hodson <mike@mystica.cx>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 11 Feb 2003 15:30:22 -0600
Message-ID: <20030211144144.A5A9.MIKE@mystica.cx>
References: <3E494808.413781E@interface-ag.com> <3E495CC6.8020202@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E495CC6.8020202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

> I have to tell you that if you aren't willing to run fsck for reiserfs 
> in response to disk corruption, but you are willing to switch to a 
> filesystem (ext2) that runs fsck at every boot, I don't have a lot of 
> sympathy.  Vitaly can comment more.
> 
> Hans

I've used ReiserFS in the past, but have also used ext3 on my user's important
data (/home) after a good chunk of one drive was converted to
sparse/null files due to a screwup stemming from no 'badblocks' support
in reiserfs.  Since then, i've used ext3 as well as Reiser but recently
dropped reiser completely. The main reason I hadn't converted to ext3
was a lack of a free harddrive 20+gb in size to copy all my files to.
Unfortunately the filesystem was turning up errors all over the place,
including random sparse files growing out of nowhere, (even my mail
queue) and files that the filesystem could not access (even ls returned
'Permission Denied').  In the time since my first filesystem was nulled
due to a reiserfsck, I hadn't fsck'd the main drive as I feared bad
blocks may be to blame for the filesystem inconsistency. After 4 failed
attempts (kernel panicks) to copy files between old and new drives, I
finally decided to run an fsck.  After fscking with --rebuild-tree, it
found many errors, and corrupt directory entries, and chucked about 150
files into /lost+found/.  Most were from the mail server, owned by
vpopmail.vchkpw, though others were from different websites I run and
some were even from /dev/. But, none of the existing files were made
sparse and I was able to completely copy the remaining files.
After this I completely re-checked the drive with Maxtor's disk tools
disk, and it showed that the drive was 'certified error-free'. After
seeing this, I have come to respect reiserfs even less than after my
/home/ drive got converted to nothing but nulls.

In my years of running ext2 and ext3, I can't see any reason why you
would think they require fscks at every reboot. In the time that I've
ran both ext2/ext3 and reiser, the only times ive had to fsck ext2 was
after unclean unmounting. I've never had to run it on ext3. As for
reiser, I've had to run it a few times, but each time it either
destroyed data or fixed a very large number of errors that a journalled
filesystem should not have.

I guess my point is, If reiserfs can't keep consistency without
requiring periodic fscks, you have no argument making a statement  that
says ext2 is worse as it requires them every boot. Even if your
statement was not false (I know for a fact that ext2 does -not- perform
fscks on every boot, it only will do it after an unclean unmount), you
still would have no basis to say that  ext2 is worse due to the
requirement of periodic fscks. 

In conclusion, I don't think i'll be using your filesystem even as a
testbed for new features, due to poor reliability under everyday
circumstances. In addition, check your facts before making a statement
that insults someone and claims something that is completely untrue.
-- 
Mike Hodson  <mike@mystica.cx>  ICQ: 18145059

