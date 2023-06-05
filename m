From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in flush_old_commits
Date: Mon, 05 Jun 2023 14:42:13 +0200
Message-ID: <6a9f6314f21c5e4dd2960c12626e14c4ce8c8163.camel@huaweicloud.com>
References: <000000000000be039005fc540ed7@google.com>
         <00000000000018faf905fc6d9056@google.com>
         <CAHC9VhTM0a7jnhxpCyonepcfWbnG-OJbbLpjQi68gL2GVnKSRg@mail.gmail.com>
         <813148798c14a49cbdf0f500fbbbab154929e6ed.camel@huaweicloud.com>
         <CAHC9VhRoj3muyD0+pTwpJvCdmzz25C8k8eufWcjc8ZE4e2AOew@mail.gmail.com>
         <58cebdd9318bd4435df6c0cf45318abd3db0fff8.camel@huaweicloud.com>
         <20230530112147.spvyjl7b4ss7re47@quack3>
         <20230605123604.7juo5siuooy2dip2@quack3>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20230605123604.7juo5siuooy2dip2@quack3>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Kara <jack@suse.cz>
Cc: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, syzbot <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com>, Jeff Mahoney <jeffm@suse.com>

On Mon, 2023-06-05 at 14:36 +0200, Jan Kara wrote:
> On Tue 30-05-23 13:21:47, Jan Kara wrote:
> > On Fri 26-05-23 11:45:57, Roberto Sassu wrote:
> > > On Wed, 2023-05-24 at 17:57 -0400, Paul Moore wrote:
> > > > On Wed, May 24, 2023 at 11:50 AM Roberto Sassu
> > > > <roberto.sassu@huaweicloud.com> wrote:
> > > > > On Wed, 2023-05-24 at 11:11 -0400, Paul Moore wrote:
> > > > > > On Wed, May 24, 2023 at 5:59 AM syzbot
> > > > > > <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com> wrote:
> > > > > > > syzbot has bisected this issue to:
> > > > > > > 
> > > > > > > commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> > > > > > > Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > > > Date:   Fri Mar 31 12:32:18 2023 +0000
> > > > > > > 
> > > > > > >     reiserfs: Add security prefix to xattr name in reiserfs_security_write()
> > > > > > > 
> > > > > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c39639280000
> > > > > > > start commit:   421ca22e3138 Merge tag 'nfs-for-6.4-2' of git://git.linux-..
> > > > > > > git tree:       upstream
> > > > > > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=13c39639280000
> > > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=15c39639280000
> > > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
> > > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=0a684c061589dcc30e51
> > > > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14312791280000
> > > > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da8605280000
> > > > > > > 
> > > > > > > Reported-by: syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com
> > > > > > > Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")
> > > > > > > 
> > > > > > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > > > > > 
> > > > > > Roberto, I think we need to resolve this somehow.  As I mentioned
> > > > > > earlier, I don't believe this to be a fault in your patch, rather that
> > > > > > patch simply triggered a situation that had not been present before,
> > > > > > likely because the reiserfs code always failed when writing LSM
> > > > > > xattrs.  Regardless, we still need to fix the deadlocks that sysbot
> > > > > > has been reporting.
> > > > > 
> > > > > Hi Paul
> > > > > 
> > > > > ok, I will try.
> > > > 
> > > > Thanks Roberto.  If it gets to be too challenging, let us know and we
> > > > can look into safely disabling the LSM xattrs for reiserfs, I'll be
> > > > shocked if anyone is successfully using LSM xattrs on reiserfs.
> > > 
> > > Ok, at least I know what happens...
> > > 
> > > + Jan, Jeff
> > > 
> > > I'm focusing on this reproducer, which works 100% of the times:
> > > 
> > > https://syzkaller.appspot.com/text?tag=ReproSyz&x=163079f9280000
> > 
> > Well, the commit d82dcd9e21b ("reiserfs: Add security prefix to xattr name
> > in reiserfs_security_write()") looks obviously broken to me. It does:
> > 
> > char xattr_name[XATTR_NAME_MAX + 1] = XATTR_SECURITY_PREFIX;
> > 
> > Which is not how we can initialize strings in C... ;)
> 
> I'm growing old or what but indeed string assignment in initializers in C
> works fine. It is only the assignment in code that would be problematic.
> I'm sorry for the noise.

Cool, thanks!

It seems the difference with just doing memcpy() is that the compiler
fully initializes the array (256 bytes), instead of copying the
required amount.

Roberto

