From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: vs-7000 errors after disks forced online in a RAID5 HW setup
Date: Wed, 19 May 2004 10:21:00 +0400
Message-ID: <1084947659.1431.120.camel@tribesman.namesys.com>
References: <20040519014933.4d9b5d3e@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040519014933.4d9b5d3e@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

On Wed, 2004-05-19 at 03:49, Philippe Gramoull=E9 wrote:
>  Hello,
>=20
> Yesterday, we were hit with a hardware failure that left us with no choic=
e that forcing a failed disk online
> , in a HW RAID5 setup on one of our NFS server.
>=20
> Now, logs are filled with :
>=20
> vs-7000: search_by_entry_key: search_by_key returned item position =3D=3D=
 0<4>zam-7001: io error in reiserfs_find_entry
> vs-7000: search_by_entry_key: search_by_key returned item position =3D=3D=
 0<4>zam-7001: io error in reiserfs_find_entry
> vs-7000: search_by_entry_key: search_by_key returned item position =3D=3D=
 0<4>zam-7001: io error in reiserfs_find_entry
>=20
> etc...
>=20
> Can i skip the reiserfsck --check and do directly a reiserfsck --rebuild-=
tree ?
> (around 470Go of data , 70% of the available space)
>=20

Yes, reiserfsck --check will probably say you to do that

> Thanks,
>=20
> Philippe
>=20

