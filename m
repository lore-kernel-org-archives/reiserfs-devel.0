From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck aborts when rebuilding filesystem tree
Date: Sat, 14 Sep 2002 13:11:54 +0400
Message-ID: <20020914131154.A26797@namesys.com>
References: <87admlk2ri.fsf@zealot.fluidsignal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87admlk2ri.fsf@zealot.fluidsignal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis Bustamante <luferbu@fluidsignal.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Sep 13, 2002 at 04:17:53PM -0500, Luis Bustamante wrote:

> I got my partition table deleted, but I knew the exact size of each
> partition, so I created again the table. But I was unable to mount one
> ReiserFS partition (/home duh!), I got the error "read_super_block:
> can't find a reiserfs file system", so I rebuilded the superblock with

Well, if you only lost partition table, then all superblocks should have been
left intact and after you have restored your partition table (And rebooted)
everything should have been ok.
If not, it means you got some partitins wrong.

> --rebuild-sb option without problems. After that I'm trying to rebuild

That was bad decision, because superblock should be in place if you did
everything correctly.

> the entire filesystem tree using:
> reiserfsck --logfile rebuild.log --rebuild-tree /dev/hda8
> but it aborts with the message "No reiserfs metadata found". I'm able to
> dump the metadata with the command: 
> debugreiserfs -p /dev/hda8 |gzip -c > metadata.gz
> and it's about 33Mb compressed. Any ideas why I can't rebuild the

Hm. 32M is journal size, and if you have some binary garbage in there
that does not compress well, it might explain the size.

> filesystem tree? it seems metadata is still there, if you want I can
> put the dump of debugreiserfs somewhere so you can have a look. I'm
> using reiserfsprogs 3.6.3 (default Debian unstable package) and kernel
> 2.4.18.

Looks like your case is user error, so you should read our terms for such case
at http://namesys.com/support.html

Also double check that you got that partition parameters set correctly.

Bye,
    Oleg
