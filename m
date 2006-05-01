From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: quicker mount
Date: Mon, 01 May 2006 16:39:06 -0400
Message-ID: <445671EA.5050305@suse.com>
References: <20060427143635.GA5949@gelma.net> <4450D85E.50109@suse.com> <4450DBDB.5060209@dermichi.com> <4450E63C.5080306@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4450E63C.5080306@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Michael Weissenbacher <webmaster@dermichi.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
> Michael Weissenbacher wrote:
>>> Hi,
>>>> It takes so long to mount since ReiserFS reads all the bitmaps before
>>>> mounting. The larger the file system, the longer it takes.
>>> I wonder why it has to read all of them. Are they stored in RAM after
>>> reading? Otherwise I cannot see why it should be done at all.
> 
> Yes, they're kept in RAM. You can see the debate on this in the list
> archives, but I asked the same questions.
> 
> There is no reason for the bitmaps to be retained in memory, as they're
> more rarely used than other metadata which simply relys on the kernel to
> cache intelligently.
> 
> The patches are written, they just need some debugging. Unfortunately,
> they're kind of on the back burner right now due to other work constraints.

To elaborate, there are places where the bitmap allocation code isn't
allowed to sleep. The existing code doesn't sleep, since all the bitmaps
are cached in memory. Allowing the bitmap blocks to be dropped from the
cache means that sometimes the blocks will need to be re-read, causing a
schedule to occur while the data is read from disk.

It is the schedule itself that causes the problem, not the bitmap block
getting re-read from disk. By backing out the patch that actually loads
the bitmaps dynamically and adding an msleep(30) in the path where the
bitmap blocks are used, I can reproduce the same failure as if the
blocks were loaded dynamically. In both cases it can take anywhere from
a few hours to a few days to trigger on a heavily loaded machine. My
test case has been a rather unrealistic 50-process copy-delete loop from
/usr/include to a test file system sized to create bitmap contention on
a 4 CPU machine with the RAM limited to 128 MB.

At any rate, even with the relative infrequency of the failures, it's
still a regression and I wouldn't consider submitting to mainline
(again) until they've been fixed.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEVnHqLPWxlyuTD7IRAqUUAJ4221Icf42yiDpg8OrZu5wgGYS7xgCcCCao
wnPpE66IkL5UEGv82Ylv1fw=
=bFsD
-----END PGP SIGNATURE-----
