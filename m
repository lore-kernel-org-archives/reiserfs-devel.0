From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: data logging and kernel 2.4.20
Date: Tue, 6 Jul 2004 10:58:12 +0200
Message-ID: <200407061058.12918.christian.mayrhuber@gmx.net>
References: <200407051213.05033.fjcabello@visual-tools.com> <200407051346.32673.cmayr@iicm.edu> <200407060929.06695.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407060929.06695.fjcabello@visual-tools.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 06 July 2004 09:29, Francisco Javier Cabello Torres wrote:
> > I'd not suggest to use these, those patches are really old and are likely
> > to have bugs.
> > Use ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/
> > and a kernel >= 2.4.25 with them.
> > I have them running on several production systems with a 2.4.26 kernel.
>
> do Suse patches include reiserfs bug fixes?
As far I know the patches for 2.4.xx have not been updated with later bug 
fixes.
Namesys recommends a kernel >= 2.4.24 for reiserfs use.
See http://www.namesys.com/download.html

The data logging patches have been developed along the 2.4.xx
kernel series and the ones for 2.4.25 are the latest and the most stable.

I don't know if these patches work with 2.4.27-rc3, they may interfere with 
a bug fix for mounting reiserfs on Out-Of-Memory conditions.
I can confirm that these patches work reliable on 2.4.26.
(At least on the two intel servers it's used on.)

If I were you I would not use an old kernel like 2.4.20 that has MANY security
holes, especially because you are not bound to some vendor kernel like
red hat or suse.

You can try kernel 2.6.7, too. It comes with data=ordered + xattr/acl + quota 
support per default.
Later kernels than 2.6.7 may get a new block allocator that behaves better
in multiprocess situations and disk-barrier support.

-- 
lg, Chris

