From: dimas <dimas000@ya.ru>
Subject: Re: reiserfs + acl corruption
Date: Wed, 31 Mar 2010 18:39:09 +0400
Message-ID: <4BB35E8D.3090309@ya.ru>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marco Gatti <marco.gatti@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

hello, Marco!
i've created 1G partition for this test and made everything like you=20
suggested. setfacl -R -m .... failed on file 150000+ with "no space lef=
t"))
mb will try later with bigger partition

Marco Gatti =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I hope to post in the right place.
> I recently suffered a filesystem corruption with reiserfs in a
> production environment and I was able to reproduce it.
> The corruption started when i played with extended attributes, posix
> acls, with a partition containing hundreds of thousands of files.
> To reproduce the issue test it this way (using bash) in a separate
> disk, partition or virtual disk using loopback:
>=20
> mkfsreiserfs /dev/sdc1
> mount -o acl /dev/sdc1 /mnt
> cd /mnt
> mkdir dir_with_many_files
> touch dir_with_many_files/{1..100000}
> setfacl -R -m u:username:rw dir_with_many_files
> setfacl -R -x u:username dir_with_many_files	(slow responsiveness of
> system during the execution of this command)
> setfacl -R -b dir_with_many_files
>=20
> With a debian lenny standard kernel 2.6.26 (port amd64) these command=
s
> ends succesfully and no corruption occours.
> With a recent kernel, versions 2.6.32.8 - 2.6.32.9 - 2.6.32.10,
> (x86_64) compiled in different ways, from standard configuration to
> optimized versions even with no support for modules i get thousands o=
f
> this kind of message:
>=20
> REISERFS warning (device sdc1): jdm-20002 reiserfs_xattr_get: Invalid
> hash for xattr (system.posix_acl_access) associated with [2 848 0x0
> SD]
>=20
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
