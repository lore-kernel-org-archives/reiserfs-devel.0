From: Joe Feise <jfeise@feise.com>
Subject: Re: BUG on reiser4_delete_inode
Date: Fri, 05 May 2006 11:32:45 -0700
Message-ID: <20060505183245.5243.qmail@pv105234.reshsg.uci.edu>
References: <445A623F.6090409@free.fr>
            <1146836304.6254.26.camel@tribesman.namesys.com>
            <445B836F.2000702@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <445B836F.2000702@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

The patch doesn't seem to have made it to the list. I have run into the s=
ame=20
problem...=20

 -Joe=20

Laurent Riffard writes:=20

>=20
> Le 05.05.2006 15:38, Vladimir V. Saveliev a =C3=A9crit :
>> Hello=20
>>=20
>> On Thu, 2006-05-04 at 22:21 +0200, Laurent Riffard wrote:
>>> Hello,=20
>>>
>>> I have a small Reiser4 FS (1 GB) which became really unstable since=20
>>> 2.6.17-rc2-mm1. I managed to get a fully reproductible scenario:=20
>>>
>>> sh-3.00# mount /dev/vglinux1/lvkernel2 /mnt/disk=20
>>>
>>> ~$ mv /mnt/disk/linux-2.6-stable/arch/i386/kernel/acpi/boot.c /home/l=
aurent/tmp/
>>> Erreur de segmentation=20
>>>
>>> ------------[ cut here ]------------
>>> kernel BUG at fs/inode.c:251!
>>=20
>> Thanks for the report. The problem is introduced by
>> ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.1=
7-rc2/2.6.17-rc2-mm1/broken-out/radix-tree-direct-data.patch=20
>>=20
>> The attached patch should fix the problem, though.
> =20
> Ok, this bug seems to be fixed.=20
>=20
> Thanks for your quick answer.
> --=20
> laurent=20
>=20
