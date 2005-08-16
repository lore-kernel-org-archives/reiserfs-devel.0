From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 and ACLs
Date: Tue, 16 Aug 2005 10:12:46 -0400
Message-ID: <b14e81f00508160712c05c0e@mail.gmail.com>
References: <42FEC9F1.9040709@perkel.com>
	 <17151.17921.996376.693013@gargle.gargle.HOWL>
	 <87k6in5dri.fsf@evinrude.uhoreg.ca>
	 <17152.63727.435377.223362@thebsh.namesys.com>
	 <1124138041.11626.4.camel@localhost>
	 <17152.65201.525419.283987@gargle.gargle.HOWL>
	 <43010157.1030107@perkel.com> <43012440.8020804@slaphack.com>
	 <43012598.7080207@perkel.com> <873bpa659r.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <873bpa659r.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 8/15/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> On Mon, 15 Aug 2005 16:30:32 -0700, Marc Perkel <marc@perkel.com> said:
>=20
> > It seems to me that getting in the Kernel is the most important
> > thing. Then getting it compatible with existing standards. Then you
> > build up the user based (addicts) and then you add the innovative
> > stuff. Otherwise people are going to use Ext3 because it has ACLs and
> > Reiser4 doesn't. That's where I'm at. If it doesn't do ACLs it doesn't
> > work. I need acls.
>=20
> AFAIK, ACLs are separate from xattr.  It's just that Ext3 uses xattr to
> store their ACLs.  So it should be possible to implement ACLs (following
> the same standards) via sys_reiser4.

It is.  That's what reiser4 is doing.  It's just that older xattr
tools don't know how to access the new ACLs access system, (a.k.a.
access ACLs *NOT* via xattrs) and it's not written yet.

> Perhaps someone more knowledgeable
> can confirm (or deny).

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
