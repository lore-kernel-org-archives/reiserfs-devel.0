From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: 25 Feb 2003 13:11:07 -0500
Message-ID: <b3gbjr$emu$1@satsuki.furryterror.org>
References: <20030220175309.A23616@namesys.com> <b3eose$crj$1@satsuki.furryterror.org> <b3eose$crj$1@satsuki.furryterror.org> <200302251539.10847.vitaly@namesys.com>
Return-path: <reiserfs-list-return-12920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302251539.10847.vitaly@namesys.com>,
Vitaly Fertman  <vitaly@namesys.com> wrote:
>Ok, I could try to remove them faster, if you give me the list of these 
>directories - all those messages in logs, and an account on your computer.

Handing out access to this (proprietary) data is probably not worth
saving 53 hours.  I have pairs of fileservers set up as mirrors of
each other.  They're meant to survive one of the machines falling off the
shelf and breaking all of its disks.  In the best case nobody will notice
the reiserfsck, and in the worst case I'll have to abort the reiserfsck
and live with the dangling direntries for a few more days.  Also, I need
to schedule a test of the automatic failover this month anyway. ;-)

I was hoping for something along the lines of "if you turn off these
parts of the kernel code, it will let unlink() work even if it can't
find an inode."  I'd then boot a kernel modified that way, delete all
the offending files, then switch back to a regular kernel, which could
all be done in a single day.

>Hm, fix-fixable works faster usually. 

It does!  You should see how long --rebuild-tree takes!  ;-)

>It would be not bad to get the metadata 
>of this partition, and to profile it locally. Although, metadata dump will take 
>some time also. If you have this time on one of your mashins, could you run 
>debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2

I did that once many months ago.  It ran out of space after 40 gigabytes
of .bz2 output, and I never tried it again (and this was with the
filesystem about 60% full...now it's 90% full).  It looked like it
had dumped about 30% of the tree data before it died.


-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
