From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 14 Nov 2002 11:32:51 -0500
Message-ID: <1037291572.287.277.camel@tiny>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
	<1037219001.21957.151.camel@tiny> 
	<20021114170409.5f9b9108.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021114170409.5f9b9108.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com, jack@ucw.cz

On Thu, 2002-11-14 at 11:04, Philippe Gramoull=E9 wrote:
> On 13 Nov 2002 15:23:21 -0500
> Chris Mason <mason@suse.com> wrote:
>=20
>   |  >=20
>   |  > BTW, should i apply the patch posted on LKML ?
>   |  > Subject:2.[45] fixes for design locking bug in wait_on_page/wait_o=
n_buffer/get_request_wait
>   | =20
>   |  No, wait for that fix to get into a kernel before using it.  There m=
ight
>   |  still be small modifications, and andrea might find a few other plac=
es
>   |  in the kernel with similar races.
>   | =20
>   |  The bug results in io stalls, and the machines that do see them stal=
l
>   |  for between 10 minutes and an hour.  If you needed the patch you wou=
ld
>   |  have already been complaining ;-)=20
>=20
> Well, now that you mention this, i may also have it on my bug squash list=
 :o)
> When we feed some files to a MySQL server ( 4 way box, lots of threads), =
sometimes the
> box does nothing , pretty much like andrea described it , so it may be th=
at.

Ok, that does sound like the stalling bug, especially since you've got 4
cpus.  You can make it much less likely to trigger by lowering the
threshold for where bdflush jumps in, but andrea's final patch should
show up shortly.

>   | =20
>   |  Jan and I will get an updated quota patch asap,
>=20
> This is just great :o) Do you have a rough idea when it will be
> available ? couple days ? couple weeks ?

Now that I've looked at it, I think the only reject is that parisc-32
already has one hunk applied, and x86-64 needs to have quotav2 support
added.  Neither one affects i386, but I'll do some tests here.  Jan, am
I missing something?

>=20
>=20
>   |  and I'll have my
>   |  attempted fix for the transaction overflow ready for you against tha=
t
>   |  set of patches in a few hours.
>=20
> I already got your fixed and but it on 4 or 5 production boxes that trigg=
ered the bug.
>=20
> So far,it's been running fine :o) but without quotas ;o))

Ok, it survived heavier load here overnight.

-chris

