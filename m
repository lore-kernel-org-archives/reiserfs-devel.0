From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: software packaging and ReiserFS v4
Date: Fri, 5 Sep 2003 22:18:06 +0200
Message-ID: <20030905201806.GV31864@vestdata.no>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F58D2CD.3050801@mrs.umn.edu> <20030905194413.GA19041@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030905194413.GA19041@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Grant Miner <mine0057@mrs.umn.edu>, Bennett Todd <bet@rahul.net>, reiserfs-list@namesys.com

On Fri, Sep 05, 2003 at 12:44:13PM -0700, Mike Fedyk wrote:
> On Fri, Sep 05, 2003 at 01:15:41PM -0500, Grant Miner wrote:
> > If you are making a packaging system, I recommend you do not allow=20
> > scipts, since they open up a whole can of worms.  (They're impossible t=
o=20
> > invert, introduce security problems, make additional work for GUI=20
> > package managers, and cause too many problems.)
>=20
> What do you replace them with then?

I think if scripts were to be removed from the packaging system you
would have to add a package-feature for every single thing that scripts
are currently used for.=20

If you look through a collection of packages I think you will find that
they typically do things like:
- create users
- start / stop deamons
and so on.

So the package-system would need a way to specify that a user is part of
the package (that would be very easy with a /etc/passwd.d-system) and
that deamons that are part of the package should be started at install
and stopped at uninstall-time.

There are probably dozens of other examples of common operations - and
you would not be able to remove the script-feature unless 99% of what
they are used for is not needed anymore - so it's a complicated task.


--=20
Ragnar Kj=F8rstad
