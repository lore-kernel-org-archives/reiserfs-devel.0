From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Wed, 21 Apr 2004 11:56:37 +0400
Message-ID: <1082534197.27499.46.camel@tribesman.namesys.com>
References: <1081698647.5514.3.camel@redeeman.linux.dk>
	 <407971B8.9090202@fbsd.za.net> <20040419233248.GA11539@mrball.net>
	 <4085D1AD.40401@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Upv7z8hoEJCU3i/m1nlS"
Return-path: <reiserfs-list-return-18100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4085D1AD.40401@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Todd Lyons <todd@mrball.net>, reiserfs-list@namesys.com

--=-Upv7z8hoEJCU3i/m1nlS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Wed, 2004-04-21 at 05:43, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Todd Lyons wrote:
> | aquadog wanted us to know:
> |
> |
> |>>I'm having the exact same problem. Doing a gentoo stage1 install,
> |>>and it fails on glibc every time. Exact same configuraiton on reiser3
> |>>partition and it works no problem.
> 
> Not sure if I just missed this message before, but I get the same issue.
> ~ If I take a more complete gentoo installation, I get more errors. It
> seems to me the most fundamental errors (causing all the others) are as
> follows:
> 
> file is missing:   maybe the file got lost.  Maybe it got truncated to 0
> length.  Maybe it was just the way I tarred it up before, but I found
> /bin/X to be of mode 0000, length 0.  Later on, either X finally merged
> properly (I don't think so) or it magically fixed itself, but the file
> magically appeared and worked.  (This email comes from Mozilla
> Thunderbird on that box.)
> 
> make runs in an infinite loop.  I can't figure this out at all.  It
> happens with glibc and quite a few other things.  It appears to be
> running several 'gcc' commands somewhat faster than usual, only it runs
> them, exits the directory, enters the exact same directory, runs the
> exact same commands again.  Noticed this problem because 'make'
> processes usually don't use 100% cpu and/or 15 hours of cpu time on
> modern (1.7 ghz) boxes, even for glibc.
> 

This bug is fixed. Would you please tyr with the attached patch?


> The filesystem appears rock solid, except things don't compile, and I
> don't like 'metas'.  After watching (and boldly and stupidly
> participating) in the 'metas' thread, '...' looks cool, but I'd accept
> anything that won't hurt my backups.  (Ok, my brother cleverly keeps his
> pr0n stash in a file called '...' in his home, but he'll just have to
> explain to me exactly which files got clobbered when I untar it onto the
> next release of v4.)
> 
> I am going to test this on xfs for a bit, see if it compiles properly.
> If it does, I'm sitting out until the next snapshot.
> 
> Speaking of which,  when is the next snapshot? 

We want to fix few problems which are both hard to hit and to fix.
Then snapshot will be issued.

>  Or where can I get the
> best-working copy?  I've seen a few patches float through this list, but
> I can't possibly keep track of them all.  I at least want a patch to let
> me compile things again!
> 
> I should add a few more points before I forget it -- v4 is nice on my
> laptop, but now I want encryption.  Should I try to write/find an
> encryption plugin, or use cryptoloop/dm-crypto?
> 
I do not think that cryptoplugin is in working state already. Also I
think that now it is not easy to write it without being familar with
reiser4 internals.

> In general, with a finished v4 and quotas (or even size limits on
> directories, could this be a plugin?), is there still a logical reason
> to put things on separate partitions?  

IMHO, this remains a matter of user preferences and tasks a machine is
performing.

> I can only think of these reasons
> right now:
> 
> size:  when /var fills up, you can't log.  When /tmp fills up, certain
> programs stop working.  When /usr fills up, you can't install new
> programs.  When /home fills up, users can't create new files.  These
> should not happen all at once, and should not happen just because
> someone made a huge amount of /tmp files.  However, most users aren't
> that paranoid, and the ones who are would probably rather create
> something more flexible than even lvm + resizefs + lots of tiny
> partitions.  Some sort of quota, per-directory rather than per-user,
> would accomplish the same thing, although per-user quotas are more than
> enough for most things anyway.
> 
> setuid hardlinks:  if the user has write access to anywhere on a
> partition with setuid root programs, they can create their own personal
> hardlinked copy of the file, and when a vulnerability is discovered and
> the original is unlinked, they still have their copy, still with the
> setuid bit.  The best trick here is to patch package managers (and maybe
> make, too) to change a file's mode to 0000, then forceably remove it.
> The permissions are shared across hardlinks, so the malicious user is
> left with a pointless file.  The alternative is to shred the file before
> delete, which has performance problems, and is still risky -- the user
> gets to run a null or random file as root.
> 
> fragmentation:  /tmp changes much, much faster than /usr.  This is part
> of why you see Windows getting so fragmented -- rapid creation and
> deletion of temporary files left parts of the disk looking like Swiss
> Cheese, and then the user went to install a program...  With a decent
> amount of RAM and reiser4, the filesystem can be intelligent enough
> about writing the data that most data wouldn't be very fragmented on a
> first write -- and then there's the repacker.  Also, a lot of temporary
> files (if not most) are so small and so transient that they may never
> touch the disk on reiser4, while they'd wreak havok on ext3.
> 
> isolation:  if there's a bad block or a kernel crash/bug or any number
> of doomsday scenarios and one filesystem is blown away, if that
> filesystem is /tmp, you're fine.  If that filesystem is /usr, you'll be
> down for awhile, and if it's /home, you may have lost some crucial data.
> ~ However, reiser3, ext3, and xfs all seem so stable (and reiser4 looks
> like it will be as stable) that no software bug is going to clobber your
> entire filesystem, and with reiser4's atomicness, a crash won't even
> corrupt anything (it'll just lose the data it'd lose anyway).  Also, if
> the disk is bad, I'd buy a new one, and by the time the disk is bad or
> something's so wrong that a superblock gets clobbered, I should have
> backups anyway.
> 
> having a huge number of files:  if I remember correctly, reiser4
> supports ~2^64 files.  That's 18446744073709551616!  If you have more
> than that, I hope you work for a big enough organization that you can
> afford to pay some hacker to extend that to 2^128.  If that cripples
> performance, you can buy more performance.  Personally, I still can't
> grasp that number -- counting every file on my system, I ended up with
> only ~250000 last I checked.
> 
> Am I missing something important here?  Or should I go with the newbie's
> partitioning scheme (hda1 is boot, hda2 is /, hda3 is swap)?
> 
> 
> 
> 
> Disclaimer:  If anything I say is offensive or inappropriate, tell me
> about it.  If you aren't offensive in how you point it out, I might be
> more careful in the future.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBQIXRrHgHNmZLgCUhAQK5LBAAla82/D+4OKdjY4pwJ9zJKvRpf7b5OXjY
> U7Up9LvnImcvLV+NscXKJJcwaYDeY/PxxtgOG+OYzMJIf87/qFgFb3aMM5M2h+rN
> pSjkmv4e4xV9MaJSskLV03jJYRO7yRwY6FTI6QRkJFhJAkav8aQgTePbZnqnriRs
> AxBgZsnNa6EuuhQZxniTxi6L58SP6cGyW9Y8efvy3L8E/xNKcmIhPgY59yrNxaFp
> 8FaQNXcK/TgcTbVQpIBJw4B/PIWISi5f/5CNqnZOITvKTCM09wRMQgrteYo16sD1
> G7TYNGFYfpgoJsUE/nj69iHTWQET4WLSPF+X3dPsDXluaJ+9FuDe0d+BTAA+1fXI
> Ek4mXe7hkhOBMJsCMSsY318BNVUuWKxd+Vk13XrdEIuhYg2zJvozGEFd2miRAZdS
> 8MXjWBuQ/6zL0P9Qz5JfceKS/1o2ixfbWJxudfRX3PbWnKjbMU7WYn9Zr5+4tfus
> MUx3j/hv5WgMbn6OIGshUXKNjGMNB9yJZ8c4a8E29MD9UeN4Lgk8fQMONWAr2gBN
> gk/k5JrxGADwl0lNj3Agifthicj3TDEitdfbUgqnlLq3Zm848uGFnQ4qJQYHdeBH
> Sxa73aDVUyhRyekm0fLTQk65Gv+sdATveOmkZ4o+8KzzKt+8KKlu6EgVuzM9NjB0
> ZIbvPeXytxw=
> =dNFn
> -----END PGP SIGNATURE-----
> 

--=-Upv7z8hoEJCU3i/m1nlS
Content-Disposition: attachment; filename=tail.c.diff
Content-Type: text/plain; name=tail.c.diff; charset=CP1251
Content-Transfer-Encoding: 7bit

--- tail.c~	2004-04-13 18:18:52.000000000 +0400
+++ tail.c	2004-04-13 18:20:14.000000000 +0400
@@ -463,12 +463,18 @@
 	}
 
 	inode = mapping->host;
-	if (get_key_offset(&f->key) > inode->i_size)
+	if (get_key_offset(&f->key) > inode->i_size) {
+		assert("vs-1649", f->user == 1);
 		INODE_SET_FIELD(inode, i_size, get_key_offset(&f->key));
-	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
-	result = reiser4_update_sd(inode);
-	if (result)
-		return result;
+	}
+	if (f->user != 0) {
+		/* this was writing data from user space. Update timestamps, therefore. Othrewise, this is tail
+		   conversion where we should not update timestamps */
+		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+		result = reiser4_update_sd(inode);
+		if (result)
+			return result;
+	}
 
 	/* FIXME-VS: this is temporary: the problem is that bdp takes inodes
 	   from sb's dirty list and it looks like nobody puts there inodes of

--=-Upv7z8hoEJCU3i/m1nlS--

