From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: RE: Fwd: reiser4 non-free?
Date: Wed, 5 May 2004 15:56:15 +0200
Message-ID: <20040505135615.GB20527@chepelov.org>
References: <3DF9165145FACB4C96977FF650C1E9040C469F25@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469F25@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Le Tue, May 04, 2004, =C3=A0 01:18:35PM -0600, Burnes, James a =E9crit:

> 4. How about this for a self-referential solution to the problem.  In
> ReiserV4, you could view the ReiserV4 credits by simply looking at the
> credits meta properties in reiser4.o or any other software.  Sounds like
> a good idea for a plugin or default behavior.  The ability to view
> credits like this might make software engineers recommend V4 for this
> reason alone.   ;-)

better yet. Make credits a subdirectory of metas, and put there a
(virtual) file per credit entry. Only "ls" is necessary to view this.
Make the root of the file system include a copy of that virtual
directory under the name "reiser4_credits_virtual_directory".

Even Nautilus users will see it, and will have no trouble reading the
contents should they choose to do so.

Just as with Hans' opera leaflet analogy, if someone wants to glance at
it, they'll know that ABC corporation has been generous. OTOH, I don't
know of an opera that requires you to pick up, read and memorise the
leaflet if you don't want to do it -- North Korean operas don't need to
apply.

	-- Cyrille
=09
--=20
