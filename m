From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: reiser4 for windows
Date: Tue, 1 Feb 2005 10:59:37 +0100
Message-ID: <200502011059.37435.chrivers@iversen-net.dk>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41ED3B39.2000702@namesys.com> <20050201085234.GV26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050201085234.GV26192@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tuesday 01 February 2005 09:52, Markus T=F6rnqvist wrote:
> On Tue, Jan 18, 2005 at 08:37:13AM -0800, Hans Reiser wrote:
> >>Could reiser4 support case-crushing, so it would be more
> >> "windows-native"?
> >
> >It could, as a plugin.
>
> Reiser4 has a sys interface already, why not add echo 1 > case_crush or
> somesuch? Shouldn't take a long time to code, but it shouldn't be a
> priority and no one would really want it, I guess...

I support your idea, but keep in mind that, to make matters worse, windows=
=20
uses case-insentivity, not case-crushing. This means that the original case=
=20
has to be saved, but the crushed case has to be searched.=20

I don't know if that's easy with a hash function, but it seems mightly slow=
 to=20
me.=20

=2D-=20
Regards,
Christian Iversen
