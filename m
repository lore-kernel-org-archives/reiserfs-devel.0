From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck will take 28 years
Date: Sun, 2 Mar 2003 14:10:43 +0300
Message-ID: <200303021410.43400.vitaly@namesys.com>
References: <3E603282.4000001@friendfinderinc.com> <20030301230445.GA3088@mrball.net> <3E616603.70709@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E616603.70709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 02 March 2003 05:01, Hans Reiser wrote:
> Todd Lyons wrote:
> >-----BEGIN PGP SIGNED MESSAGE-----
> >Hash: SHA1
> >
> >Marc Rotzow wanted us to know:
> >>945 GB Usable space
> >
> >Our 500 GB partition took 8 hours to do in a rebuild-tree.  We didn't
> >have that many files though.  I don't know if that affects things.
> >- --
> >Blue skies...	Todd 	Public key: http://www.mrball.net/todd.asc
> ><cbsmith> Damn, I have to figure out a way to keep my connection up. :-(
> ><scandal> cbsmith: would that be like viagra for TCP?
> >Linux kernel 2.4.19-16mdk   4 users,  load average: 0.00, 0.00, 0.00
> >-----BEGIN PGP SIGNATURE-----
> >Version: GnuPG v1.0.7 (GNU/Linux)
> >Comment: http://www.mrball.net/todd.asc
> >
> >iD8DBQE+YTyNIBT1264ScBURAh7HAJ4jg9IiKHE9Xk7VLaFs8BJmDOVGPACcCcSt
> >KbpNQLxJSupSueuVEzZRifo=
> >=qN+C
> >-----END PGP SIGNATURE-----
>
> It affects things a lot.  Vitaly needs to rewrite the oid tracking code,
> because each oid added means a memory shift of the entire oid map.  This
> is a fundamentally flawed algorithm for filesystem with a lot of files,
> and it is the reason for his slowdown.

And I am working on it now.

-- 

Thanks,
Vitaly Fertman
