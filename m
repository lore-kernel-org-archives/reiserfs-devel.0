From: Brian Tinsley <btlists@emageon.com>
Subject: Re: getting UUID and label of a filesystem
Date: Thu, 06 Nov 2003 15:03:54 -0600
Message-ID: <1068152634.2455.37.camel@dragonball>
References: <3FAAB330.5040503@nrao.edu>
	 <1068152277.2556.13.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KlW1PqyV/mW3i3ACJ4Rx"
Return-path: <reiserfs-list-return-15999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068152277.2556.13.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-KlW1PqyV/mW3i3ACJ4Rx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

reiserfstune --label <new label> /dev/xxx

That ought to do it  ;)


On Thu, 2003-11-06 at 14:57, Redeeman wrote:

> now you talk about label, how to change a label?
> 
> On Thu, 2003-11-06 at 21:46, Boyd Waters wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Perhaps this is obvious, but I cannot find a way to print out the UUID
> > or the label of a mounted reiser filesystem, in a manner similar to
> > xfs_admin.
> > 
> > Best way to do this?
> > 
> > On a mounted filesystem?
> > 
> > As non-root user?
> > 
> > Thanks!
> > 
> > ~ - boyd
> > 
> > Boyd Waters
> > http://www.aoc.nrao.edu/~bwaters
> > National Radio Astronomy Observatory
> > Socorro, New Mexico
> > 
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.2.3 (GNU/Linux)
> > Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> > 
> > iD8DBQE/qrMw0is8k1r0QeURAhekAJ9N7Q7USe7Hull5ydP99vdS/uYO2gCgrj0v
> > v5MuJNmUlLEJyYWUaVjqn2M=
> > =J7uc
> > -----END PGP SIGNATURE-----

--=-KlW1PqyV/mW3i3ACJ4Rx--

