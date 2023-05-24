From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in flush_old_commits
Date: Wed, 24 May 2023 17:50:03 +0200
Message-ID: <813148798c14a49cbdf0f500fbbbab154929e6ed.camel@huaweicloud.com>
References: <000000000000be039005fc540ed7@google.com>
         <00000000000018faf905fc6d9056@google.com>
         <CAHC9VhTM0a7jnhxpCyonepcfWbnG-OJbbLpjQi68gL2GVnKSRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhTM0a7jnhxpCyonepcfWbnG-OJbbLpjQi68gL2GVnKSRg@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, syzbot <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com>

On Wed, 2023-05-24 at 11:11 -0400, Paul Moore wrote:
> On Wed, May 24, 2023 at 5:59=E2=80=AFAM syzbot
> <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com> wrote:
> > syzbot has bisected this issue to:
> >=20
> > commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> > Author: Roberto Sassu <roberto.sassu@huawei.com>
> > Date:   Fri Mar 31 12:32:18 2023 +0000
> >=20
> >     reiserfs: Add security prefix to xattr name in reiserfs_security_wr=
ite()
> >=20
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11c39639=
280000
> > start commit:   421ca22e3138 Merge tag 'nfs-for-6.4-2' of git://git.lin=
ux-..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13c39639=
280000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15c39639280=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D7d806768305=
5e3f5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D0a684c061589d=
cc30e51
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D143127912=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D12da8605280=
000
> >=20
> > Reported-by: syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com
> > Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in re=
iserfs_security_write()")
> >=20
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>=20
> Roberto, I think we need to resolve this somehow.  As I mentioned
> earlier, I don't believe this to be a fault in your patch, rather that
> patch simply triggered a situation that had not been present before,
> likely because the reiserfs code always failed when writing LSM
> xattrs.  Regardless, we still need to fix the deadlocks that sysbot
> has been reporting.

Hi Paul

ok, I will try.

Roberto

> Has anyone dug into the reiserfs code to try and resolve the deadlock?
>  Considering the state of reiserfs, I'm guessing no one has, and I
> can't blame them; I personally would have a hard time justifying
> significant time spent on reiserfs at this point.  Unless someone has
> any better ideas, I'm wondering if we shouldn't just admit defeat with
> reiserfs and LSM xattrs and disable/remove the reiserfs LSM xattr
> support?  Given the bug that Roberto was fixing with the patch in
> question, it's unlikely this was working anyway.
>=20
> --
> paul-moore.com

