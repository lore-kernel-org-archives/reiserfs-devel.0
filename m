From: David Masover <ninja@slaphack.com>
Subject: Re: mount issue with kernels >2.6.11
Date: Wed, 07 Sep 2005 09:13:03 -0500
Message-ID: <431EF56F.4050706@slaphack.com>
References: <431EDBF0.3080701@darthvader.us> <87y869yrmu.fsf@barad-dur.minas-morgul.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87y869yrmu.fsf@barad-dur.minas-morgul.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mathieu <matt@minas-morgul.org>
Cc: Yiannis Mavroukakis <jander@darthvader.us>, reiserfs-list@namesys.com

Mathieu wrote:
> Yiannis Mavroukakis <jander@darthvader.us> disait derni=E8rement que :
>=20
>=20
>>Hi,
>>
>>I'm running reiser4 on 2.6.11-mm4 at the moment. I compiled 2.6.13-mm1=20
>>(and subsequently a few more kernel version in-between)  as a=20
>>replacement, only to find out that it blows up in my face when the root=20
>>fs is due to be mounted:
>>
>>VFS: Cannot open root device "801" or unknown-block
>>Unable to mount root fs on unknown-block (8,1)
>=20
>=20
> not a reiser4 error. your kernel does not see your harddrive.

So the first thing to do is, try taking a rescue disk, using its config=20
(/proc/config.gz if you can't find it anywhere else), compiling your=20
kernel for it, and using your kernel on someone else's disk.  A simple=20
disk, like RIP, should work.  That way, you can check if your kernel=20
works, if you can mount reiser4 (maybe on a ramdisk?), and you can try=20
various modules and options to try and find your hard disk.

