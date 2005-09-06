From: michael chang <thenewme91@gmail.com>
Subject: Re: File as a directory - back to predicates
Date: Tue, 6 Sep 2005 16:39:53 -0400
Message-ID: <b14e81f00509061339eec9969@mail.gmail.com>
References: <ff80108405082323511225c1f6@mail.gmail.com>
	 <22495652651-BeMail@AlexDualP3>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <22495652651-BeMail@AlexDualP3>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

On 9/5/05, Alexander G. M. Smith <agmsmith@rogers.com> wrote:

> michael chang wrote on Fri, 2 Sep 2005 11:57:20 -0400:
> > Could it end up being a user-space/high-level library?  Manually
> > implementing this as it is will have sucky performance anyways.  The
> > idea would be to discourage it's use unless it's necessary, at least
> > on older FSes.  Then the API wouldn't get adopted, however.
>=20
> Sounds like LibFerris.  http://witme.sourceforge.net/libferris.web/  If e=
veryone
> uses it, fine.  But to get everyone to use it, it's better if the functio=
nality
> is in the file system.  Then metadata queries can be used by common tools=
, like
> "ls", "grep" or even "cd".

All the better, I suppose.  Assuming the stubborns at kernel lists
allow you to put it in. =3D.=3D"

Still, it's easier if it's done in the next devel cycle for them...
assuming there *IS* a next cycle (that could be quite a ways off,
which is the problem for Reiser4 AFAIK).

Do the linux kernel lists allow a "notice-for-intent-of-filesystem(or
feature)-inclusion-proposal" and then let you attach a preliminary
patch, before the required patch?  That might have been useful,
although I'm rather fond of Namesys's policies for submission and
stuffs.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
