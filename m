From: luferbu@fluidsignal.com (Luis Bustamante)
Subject: Re: reiserfsck aborts when rebuilding filesystem
 tree
Date: Sat, 14 Sep 2002 18:31:49 -0500
Message-ID: <87sn0ci1wa.fsf@zealot.fluidsignal.net>
References: <87admlk2ri.fsf@zealot.fluidsignal.net>
	<20020914131154.A26797@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020914131154.A26797@namesys.com> (Oleg Drokin's message of
 "Sat, 14 Sep 2002 13:11:54 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Hi Oleg!

>>>>> "Oleg" == Oleg Drokin <green@namesys.com> writes:
    Oleg> On Fri, Sep 13, 2002 at 04:17:53PM -0500, Luis Bustamante wrote:

    >> I got my partition table deleted, but I knew the exact size of
    >> each partition, so I created again the table. But I was unable
    >> to mount one ReiserFS partition (/home duh!), I got the error
    >> "read_super_block: can't find a reiserfs file system", so I
    >> rebuilded the superblock with

    Oleg> Well, if you only lost partition table, then all superblocks
    Oleg> should have been left intact and after you have restored
    Oleg> your partition table (And rebooted) everything should have
    Oleg> been ok.  If not, it means you got some partitins wrong.


    All my ext3 and other ReiserFS partitions worked after I created
them, but not my 8GB home, values should be fine, the partition after
and before the bad partition worked without errors. Weird :/

    
    >> --rebuild-sb option without problems. After that I'm trying to
    >> rebuild

    Oleg> That was bad decision, because superblock should be in place
    Oleg> if you did everything correctly.


    :( I had to do it because it wasn't unable to mount the partition,
superblock was just bad (I grep'ed the first lines of the partition,
and it didn't even had a ReIsEr2Fs magic string as should have all
ReiserFS partitions, iirc).


    >> the entire filesystem tree using: reiserfsck --logfile
    >> rebuild.log --rebuild-tree /dev/hda8 but it aborts with the
    >> message "No reiserfs metadata found". I'm able to dump the
    >> metadata with the command: debugreiserfs -p /dev/hda8 |gzip -c
    >> > metadata.gz and it's about 33Mb compressed. Any ideas why I
    >> can't rebuild the

    Oleg> Hm. 32M is journal size, and if you have some binary garbage
    Oleg> in there that does not compress well, it might explain the
    Oleg> size.


    Duh, in fact it is 32M, I misread the `du' output :)


    >> filesystem tree? it seems metadata is still there, if you want
    >> I can put the dump of debugreiserfs somewhere so you can have a
    >> look. I'm using reiserfsprogs 3.6.3 (default Debian unstable
    >> package) and kernel 2.4.18.

    Oleg> Looks like your case is user error, so you should read our
    Oleg> terms for such case at http://namesys.com/support.html

    
    I'll do it right now, thanks for your help.

    Cheers,

-- 
Luis Bustamante                mailto:luferbu@fluidsignal.com
CSO, Fluidsignal Group    http://www.fluidsignal.com/~luferbu

