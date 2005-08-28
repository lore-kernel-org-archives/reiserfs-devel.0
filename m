From: Ronald Moesbergen <ronald.moesbergen@gmail.com>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sun, 28 Aug 2005 21:17:49 +0200
Message-ID: <656cfae805082812174b184fe@mail.gmail.com>
References: <656cfae8050827090370d11864@mail.gmail.com>
	 <4310A781.9050607@gmx.net> <656cfae8050827125641d35176@mail.gmail.com>
	 <4311FE05.70904@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4311FE05.70904@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: evilninja <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

OK, but the tainting is because the license is different from GPL, not
because of lack of source code (vmware modules source code is
available). Anyway, I'll wait for a fix. Let me know if there's
anything I can do to help.

Ronald.

On 8/28/05, evilninja <evilninja@gmx.net> wrote:
> Ronald Moesbergen schrieb:
> > Well, I just successfully reproduced this without the nvidia module
> > loaded. The oops looks very similar:
> [...]
> >  kernel: Modules linked in: vmnet vmmon
> >  kernel: CPU:    1
> >  kernel: EIP:    0060:[lock_object+84/127]    Tainted: P      VLI
>=20
> well, the kernel is still tainted - by the vmware modules. but as Vladimi=
r
> pointed out, there seem to be vmware related issues in reiser4. so you
> could wait for the fix or try to reproduce with an untainted kernel (mayb=
e
> it's a completly different problem which needs to be fixed).
>=20
> Christian.
> --
> BOFH excuse #432:
>=20
> Borg nanites have infested the server
>
