From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: vs-8115: get_num_ver: not directory item
Date: Thu, 06 May 2004 14:43:22 +0400
Message-ID: <1083840202.14090.231.camel@tribesman.namesys.com>
References: <20040506114621.1f2805b4@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040506114621.1f2805b4@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

On Thu, 2004-05-06 at 13:46, Philippe Gramoull=E9 wrote:
> Hello,
>=20
> Today after i dist-upgraded my Debian box, i rebuilt the Nvidia module an=
d saw that on screen
> right after:
>=20
> May  6 10:23:38 kernel  kernel: vs-8115: get_num_ver: not directory item
> May  6 10:23:38 kernel  kernel: vs-8115: get_num_ver: not directory item
>=20

I guess that warning became obsolete when Oleg <green@clusterfs.com>
added possibility to insert long indirect items.

>=20
> Kernel is vanilla 2.6.6-rc3. HW is Dell workstation 530MT, SCSI disk, SMP
>=20
> I already had that some weeks ago, with a previous 2.6.6rcX kernel but i =
didn't pay too much attention
> after the latest reiserfsck told me that my fs had 0 corruption. Now that=
 i think of this, it was also after the Nvidia
> installer so maybe this is a good workload to trigger this. ( Nvidia inst=
aller version is 5336 )
>=20
> Checking the archives, i only found a post on 12/26/2001 with reply from =
Oleg saying that it looked like a race and
> he posted a fix. Maybe this is different but hopefully, this isn't causin=
g any corruption.
>=20
> Thanks,
>=20
> Philippe
>=20
> --
>=20
> Philippe Gramoull=E9
> philippe.gramoulle@mmania.com
> Senior System and Network Architect
> Lycos Europe
>=20
>=20
>=20
>=20

