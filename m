From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 grub patch
Date: Sun, 05 Feb 2006 19:00:30 +0100
Message-ID: <op.s4ihm4ufd4os1z@acer>
References: <200602031237.06515.xxlucas@seznam.cz> <43E568A5.3080401@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43E568A5.3080401@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sun, 05 Feb 2006 03:53:25 +0100, Hans Reiser <reiser@namesys.com> =20
napisa=B3:

> Vitaly, lots of people are having trouble with the grub patch, please
> investigate.  See later email about gcc version also.

I'm running gentoo with reiser4 on /, I tried once grub with r4 patch (it  =

was for a while in portage but was removed), everything was fine, but once =
=20
I tried building openoffice2 from source, it's a whole lot of files and it =
=20
takes forever, when I rebootet my machine with all the source code =20
unpacked grub stoped working, I had to boot with livecd and remove =20
openoffice source files to make it work again. I went back to /boot on =20
ext2.

=A3ukasz Mierzwa
