From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH/URL] reiserfs: reformat code with Lindent
Date: Tue, 12 Jul 2005 19:16:12 -0400
Message-ID: <42D44F3C.6080707@suse.com>
References: <20050712194220.GA28973@locomotive.unixthugs.org> <Pine.LNX.4.58.0507121546160.17536@g5.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0507121546160.17536@g5.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linus Torvalds wrote:
> 
> On Tue, 12 Jul 2005, Jeff Mahoney wrote:
>> This patch contains the result of running scripts/Lindent against
>> fs/reiserfs/*.c and include/linux/reiserfs_*.h.
> 
> That can't be true. It isn't actually following the Lindent rules. It has 
> that braindamaged "put the type on a separate line" thing for function 
> declarations, making a "grep" not show the type. That's very much against 
> the Linux coding style.
> 
> So either your "indent" is broken, or you've used something else than 
> Lindent.
> 
> Also, if it's a pure indentation change with no other changes, I'd almost 
> prefer it as a script, not a patch.  That way it's obvious to everybody 
> that it's just doing indentation.

Sigh. I guess some options in my .indent.pro overrode those in
scripts/Lindent. I just assumed it would do its job.

At any rate, the goal really is only to change the indentation to the
Linux standard, so I'll post a pre-patch to fix up a case where indent
misreads the code and indents a tab stop, as well as the one liner to
reformat.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFC1E88LPWxlyuTD7IRAt6iAJ4lLRdo8Pm9FLMRSKR2EnNX9JO6ogCgiTFG
kCkCafDtbstfWigkN8m/9U8=
=p+20
-----END PGP SIGNATURE-----
