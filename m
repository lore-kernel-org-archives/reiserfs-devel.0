From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 13 Nov 2002 15:23:21 -0500
Message-ID: <1037219001.21957.151.camel@tiny>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny> 
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Wed, 2002-11-13 at 13:40, Philippe Gramoull=E9 wrote:
> On 13 Nov 2002 13:14:18 -0500
> Chris Mason <mason@suse.com> wrote:
>=20
>   |  Ok, I was hoping for some confirmation that you've seen the bug fixe=
d
>   |   with the quota code.  Which kernel version + list of patches are yo=
u
>   |   best able to test on?  I'll make you patch against that.
>   | =20
>   |   -chris
>=20
> Unfortunately, we hit the bug again this afternoon :-(
>=20
> We use to have 2.4.19-pre6 with the quota patches from
> ftp.suse.com:/pub/people/mason/patches/reiserfs/quota-2.4/2.4.19
> ( 0xFFFF test removed in sys_quotactl() in fs/dquot.c to support 32 bit U=
IDS)
> and IIRC NFS_ALL patch for 2.4.19
>=20
> Being unable to run the quota anyway with 2.4.19-pre6,as it would make th=
e filer crash, i upgraded to
> 2.4.20rc1 + data-logging patches and mounted the fs witn noatime,nodirati=
me and data=3Djournal

Ok, I'll make a patch against that.

>=20
> Filer is still heavily loaded but runs fine. Problem now is that we don't=
 have quota working anymore
> and this is a _big_ issue as warez lovers do test our systems every singl=
e minute.
>=20
> BTW, should i apply the patch posted on LKML ?
> Subject:2.[45] fixes for design locking bug in wait_on_page/wait_on_buffe=
r/get_request_wait

No, wait for that fix to get into a kernel before using it.  There might
still be small modifications, and andrea might find a few other places
in the kernel with similar races.

The bug results in io stalls, and the machines that do see them stall
for between 10 minutes and an hour.  If you needed the patch you would
have already been complaining ;-)  The races do not cause corruptions or
crashes of any kind.

>=20
> Ideally, i'd like to stay with 2.4.20rc1 thus having working quota.
> I couldn't check closely enough because of being too busy but i think man=
y important patches have been
> set into RC1 (new block allocator, etc..).
> I tried to have a look to merge the quota code with RC1 but unfortunately=
 my knowledge of quota/reiserfs
> prevent me from doing anything but cosmetic merge :o)
>=20
> Let me know what are you plans.

Jan and I will get an updated quota patch asap, and I'll have my
attempted fix for the transaction overflow ready for you against that
set of patches in a few hours.

-chris


