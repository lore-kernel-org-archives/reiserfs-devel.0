From: Vadim <vadim_t@teleline.es>
Subject: Re: vs-5150: search_by_key: invalid format found in block 30690. Fsck?
Date: Mon, 18 Aug 2003 19:28:09 +0200
Message-ID: <200308181928.17516.vadim_t@teleline.es>
References: <200308151939.03324.vadim_t@teleline.es> <200308181000.23244.vadim_t@teleline.es> <20030818133530.GE10536@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030818133530.GE10536@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 18 August 2003 15:35, Oleg Drokin wrote:
> Hello!
>
> On Mon, Aug 18, 2003 at 10:00:16AM +0200, Vadim wrote:
> > Excuse me if this is a stupid question, but hdparm doesn't
> > seem to have any arguments to disable write cache. How do I
> > do that?
>
> hdparm -W0 will do that.
>
*bangs head* It is indeed there... sorry.

> This is not reiserfs' business.
> But the solution called IDE barriers is going to be
> implemented soon (at least in 2.6, there is standalone patch
> that does this in SuSE kernels, too)
Interesting, I'll take a look at that

>
> Bye,
>     Oleg

Thanks a lot for the help, and sorry for the silly questions
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/QQyvvCkUtBccqkoRAjTKAJ4zs0eSmIHPkJwxy9WOrh9BrHEJgACeL3ZX
9jRl/8cn1dfEsjmTE2k66HI=
=DHis
-----END PGP SIGNATURE-----

