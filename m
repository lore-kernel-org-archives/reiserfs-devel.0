From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: 2.6.23-rc8-mm2: BUG near reiserfs_xattr_set
Date: Thu, 27 Sep 2007 12:48:33 -0700
Message-ID: <20070927124833.d2691813.akpm@linux-foundation.org>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org>
	<46FC021F.8060109@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46FC021F.8060109@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Dave Hansen <haveblue@us.ibm.com>

On Thu, 27 Sep 2007 21:18:55 +0200
Laurent Riffard <laurent.riffard@free.fr> wrote:

> Le 27.09.2007 11:22, Andrew Morton a =E9crit :
> > ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.2=
3-rc8/2.6.23-rc8-mm2/
>=20
> I've got this BUG a few seconds after I logged in into Gnome desktop =
:
>=20
> [partially hand copied BUG]
> BUG: unable to handle kernel NULL pointer dereference at virtual addr=
ess 00000000
> printing eip: c016f55e *pde=3D0b8a5067 *pte=3D00000000
> Oops: 0002 [#1] PREEMPT
> ...
> Process beagled...
> ...
> Call Trace:
>  __fput+0x124/0x1a9
>  fput+0x31/0x35
>  reiserfs_xattr_set+0x291/0x2b0 [reiserfs]
>  user_set+0x4c/0x57 [reiserfs]
>  reiserfs_setxattr+0x81/0xf1 [reiserfs]
>  vfs_setxattr+0x7d/0xfa
>  setxattr+0xb9/0xd1
>  sys_lsetxattr+0x4c/0x85
>  sysenter_past_esp+0x57/0x85
>=20
> EIP: mnt_drop_write+0x5b/0x9d
>=20

Hi, Dave!

> It's fully reproducible.
>=20
> /home is mounted with the following options:
>    /dev/mapper/vglinux1-lvhome on /home type reiserfs (rw,noatime,nod=
iratime,user_xattr)
>=20
> This BUG happened with rc8-mm1 too.
> rc6-mm1 works fine.
> I didn't try rc7-mm1.
>=20
> .config attached.
> ~~
> laurent
>=20
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
