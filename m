From: Chris Mason <mason@suse.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 04 Aug 2004 09:49:59 -0400
Message-ID: <1091627399.4791.22.camel@watt.suse.com>
References: <200406150022.34578.vitaly@namesys.com>
	 <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org>
	 <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com>
	 <20040804095513.GL1284@nysv.org>
	 <20040804144144.2f5fe7b3@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804144144.2f5fe7b3@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Wed, 2004-08-04 at 08:41, Philippe Gramoull=E9 wrote:
> Hello,
>=20
> On Wed, 4 Aug 2004 12:55:13 +0300
> mjt@nysv.org (Markus T=F6rnqvist) wrote:
>=20
>   | >These blocks refers to blocks that were used by files and are now ba=
ckup=20
>   | >super blocks?  These blocks could be critical database files, etc.?
>   |=20
>   | Seems to me like yes, but Reiser4 hasn't launched yet officially, so
>   | I somehow doubt people will have anything too critical on Reiser4.
>   |=20
>   | I'm at least preparing myself to take backups of everything.
>=20
>=20
> I completely agree. I really don't mind having another tens of format dis=
k change, if it make things better
> faster, or cleaner. If people currently use reiser4 in production for mis=
sion critical applications, without any backups,
> well..., let's say that they had a bet and they lost :)
>=20
> As Markus said, Reiser4 hasn't been officially released, so i'm all for f=
ormat disk change if it improves things in the end
> and even if few people might get burnt with that.

If it provides some significant benefit, make the format change now.=20
Whatever gets into the kernel you'll be stuck with ;-)

-chris


