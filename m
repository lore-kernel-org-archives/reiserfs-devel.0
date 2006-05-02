From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: quicker mount
Date: Mon, 01 May 2006 23:47:41 -0400
Message-ID: <4456D65D.1050607@suse.com>
References: <20060427143635.GA5949@gelma.net> <4450D85E.50109@suse.com> <4450DBDB.5060209@dermichi.com> <4450E63C.5080306@suse.com> <445671EA.5050305@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <445671EA.5050305@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Michael Weissenbacher <webmaster@dermichi.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
> Jeff Mahoney wrote:
>>> Michael Weissenbacher wrote:
>>>>> Hi,
>>>>>> It takes so long to mount since ReiserFS reads all the bitmaps before
>>>>>> mounting. The larger the file system, the longer it takes.
>>>>> I wonder why it has to read all of them. Are they stored in RAM after
>>>>> reading? Otherwise I cannot see why it should be done at all.
>>> Yes, they're kept in RAM. You can see the debate on this in the list
>>> archives, but I asked the same questions.
>>>
>>> There is no reason for the bitmaps to be retained in memory, as they're
>>> more rarely used than other metadata which simply relys on the kernel to
>>> cache intelligently.
>>>
>>> The patches are written, they just need some debugging. Unfortunately,
>>> they're kind of on the back burner right now due to other work constraints.
> 
> To elaborate, there are places where the bitmap allocation code isn't
> allowed to sleep. The existing code doesn't sleep, since all the bitmaps
> are cached in memory. Allowing the bitmap blocks to be dropped from the
> cache means that sometimes the blocks will need to be re-read, causing a
> schedule to occur while the data is read from disk.
> 
> It is the schedule itself that causes the problem, not the bitmap block
> getting re-read from disk. By backing out the patch that actually loads
> the bitmaps dynamically and adding an msleep(30) in the path where the
> bitmap blocks are used, I can reproduce the same failure as if the
> blocks were loaded dynamically. In both cases it can take anywhere from
> a few hours to a few days to trigger on a heavily loaded machine. My
> test case has been a rather unrealistic 50-process copy-delete loop from
> /usr/include to a test file system sized to create bitmap contention on
> a 4 CPU machine with the RAM limited to 128 MB.
> 
> At any rate, even with the relative infrequency of the failures, it's
> still a regression and I wouldn't consider submitting to mainline
> (again) until they've been fixed.

I'm embarrassed to say that after staring at the code all afternoon, my
analysis was completely wrong. I enabled CONFIG_REISERFS_CHECK to try to
catch where it was failing earlier, and the code panicked immediately
when trying to write to the file system. The error was the same as I was
seeing in tests, just caught earlier.

It turns out that the third patch in the series was flawed and didn't
treat the v3.[56] bitmap 0 specially. Every other bitmap block on the
file system is (blocksize * 8 * bitmap number), except bitmap 0 which is
the block after the superblock. I was mistakenly loading block 0 as the
bitmap block, which is obviously wrong.

This explains why I couldn't seem to find any problems related to
scheduling as well as why the panics always involved block 8211. I'll be
running some overnight stress tests as well as performing a full audit
of the code which was essentially moved around to ensure more of these
stupid bugs didn't sneak in.

I'll post the updated patches tomorrow, but they still have the caveat
that the error handling infrastructure just isn't there yet. I guess
I'll resurrect those next. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEVtZdLPWxlyuTD7IRAhxrAJwIma2pJQ3WkplSftEws8SvlJEfHQCfVh57
ntK3GxhfHRRdeFQwKjTyK04=
=DPQv
-----END PGP SIGNATURE-----
