From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sun, 28 Aug 2005 17:39:50 -0400
Message-ID: <b14e81f0050828143921453c60@mail.gmail.com>
References: <656cfae8050827090370d11864@mail.gmail.com>
	 <4310A781.9050607@gmx.net> <656cfae8050827125641d35176@mail.gmail.com>
	 <4311FE05.70904@gmx.net> <656cfae805082812174b184fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <656cfae805082812174b184fe@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald Moesbergen <ronald.moesbergen@gmail.com>
Cc: evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com

I know this probably doesn't fix your problem, but there's a program
called QEMU that might perform similar functionality to VMWare; does
it have the same issues?  Maybe you want to try that, and see if you
have the same problem or not...

On 8/28/05, Ronald Moesbergen <ronald.moesbergen@gmail.com> wrote:
> OK, but the tainting is because the license is different from GPL, not
> because of lack of source code (vmware modules source code is
> available). Anyway, I'll wait for a fix. Let me know if there's
> anything I can do to help.
>=20
> Ronald.
>=20
> On 8/28/05, evilninja <evilninja@gmx.net> wrote:
> > Ronald Moesbergen schrieb:
> > > Well, I just successfully reproduced this without the nvidia module
> > > loaded. The oops looks very similar:
> > [...]
> > >  kernel: Modules linked in: vmnet vmmon
> > >  kernel: CPU:    1
> > >  kernel: EIP:    0060:[lock_object+84/127]    Tainted: P      VLI
> >
> > well, the kernel is still tainted - by the vmware modules. but as Vladi=
mir
> > pointed out, there seem to be vmware related issues in reiser4. so you
> > could wait for the fix or try to reproduce with an untainted kernel (ma=
ybe
> > it's a completly different problem which needs to be fixed).
> >
> > Christian.
> > --
> > BOFH excuse #432:
> >
> > Borg nanites have infested the server
> >
>=20


--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
