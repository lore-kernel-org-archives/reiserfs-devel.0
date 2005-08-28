From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sun, 28 Aug 2005 17:30:58 -0500
Message-ID: <43123B22.3060707@slaphack.com>
References: <656cfae8050827090370d11864@mail.gmail.com>	 <4310A781.9050607@gmx.net> <656cfae8050827125641d35176@mail.gmail.com>	 <4311FE05.70904@gmx.net> <656cfae805082812174b184fe@mail.gmail.com> <b14e81f0050828143921453c60@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050828143921453c60@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Ronald Moesbergen <ronald.moesbergen@gmail.com>, evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com

michael chang wrote:
> I know this probably doesn't fix your problem, but there's a program
> called QEMU that might perform similar functionality to VMWare; does
> it have the same issues?

Sort of.  And more.

I don't know how fast VMWare is, but qemu is pretty slow, as it does
actual emulation.  There is an addon called "kqemu", which is not GPL
and has no source available, which does stuff to the host kernel to
allow qemu to approach native speeds (by avoiding emulation), but that
seems to be just the CPU -- other devices (disk, network, and so on) are
still emulated.

And, even with the proprietary addon, qemu is probably slower than VMWare.
