From: Baldur Norddahl <bbn@clansoft.dk>
Subject: Re: reiserfsck --rebuild-tree bug (loops forever)
Date: 21 Mar 2003 14:15:13 +0100
Message-ID: <1048252512.9237.25.camel@dawn.clansoft.dk>
References: <1048239084.9237.9.camel@dawn.clansoft.dk>
	 <20030321103709.6c52f46d.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030321103709.6c52f46d.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Hi,

3.6.5 asked me to run --rebuild-sb and then --rebuild-tree. That worked,
and the filesystem is repaired.

Oleg Drokin suggested that I might be running a version that was not
compiled on the same server. I was actually using the version that
debian provided for me.

The namesys.com web site is still advertizing 3.6.4 as the latest
version, maybe that should be corrected.

Thanks,

Baldur

On Fri, 2003-03-21 at 10:37, Philippe Gramoull=E9 wrote:
> Hi,
>=20
> 3.6.4 is not the latest reiserfsck version.
>=20
> 3.6.5 [1] is the latest and several bugs have been fixed since.
>=20
> Could you please retry with reiserfsck 3.6.5 ?
>=20
> Thanks,
>=20
> Philippe
>=20
> [1] Reiserfprogs : ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-=
3.6.5.tar.gz
>=20
>=20
> On 21 Mar 2003 10:31:24 +0100
> Baldur Norddahl <bbn@clansoft.dk> wrote:
>=20
>   | dawn:~# reiserfsck -V
>   |  <--------reiserfsck 3.6.4, 2002-------->
--=20
Baldur Norddahl <bbn@clansoft.dk>

