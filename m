From: Paul Moore <paul@paul-moore.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in flush_old_commits
Date: Wed, 24 May 2023 11:11:23 -0400
Message-ID: <CAHC9VhTM0a7jnhxpCyonepcfWbnG-OJbbLpjQi68gL2GVnKSRg@mail.gmail.com>
References: <000000000000be039005fc540ed7@google.com> <00000000000018faf905fc6d9056@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684941094; x=1687533094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqqN7STJH2LoGCrwrill0kIUbhodoox7qSOdJoH92o8=;
        b=EFehSwqT4xP3Dsgl9bmiZS3CIEPYx7oE8YP/dagGWOYw22jxpzPgKbLa+z/ZmWlOwX
         sbDUYJK1SF3CUXwmwlypvEibDRI9nS0D2DX+1qVKP8T5GElGdyojL5b5LWCxsc3eJabx
         TAQKujaM7/wvTwHsVvSiJVHxSnfB7NkBNEEEy0m67Z1moTU+gNl374iCNxVEG4RM6sZW
         9VpQVnKwVC9ltwPttucugKAFTxlXCjokxJbv+TppvKl4cWmkpEiNAzPg+S0RLyaHL2T5
         8746YxI3TCs5u9PRcnTlk2UxGUeRQTfCZaRTwVv3wIyHrEIF5SBSX4BfjZzx6oLbdaGJ
         X1Tg==
In-Reply-To: <00000000000018faf905fc6d9056@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-security-module@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, syzbot <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com>

On Wed, May 24, 2023 at 5:59=E2=80=AFAM syzbot
<syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> Author: Roberto Sassu <roberto.sassu@huawei.com>
> Date:   Fri Mar 31 12:32:18 2023 +0000
>
>     reiserfs: Add security prefix to xattr name in reiserfs_security_writ=
e()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11c3963928=
0000
> start commit:   421ca22e3138 Merge tag 'nfs-for-6.4-2' of git://git.linux=
-..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13c3963928=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D15c3963928000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D7d8067683055e=
3f5
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D0a684c061589dcc=
30e51
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D14312791280=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D12da860528000=
0
>
> Reported-by: syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com
> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reis=
erfs_security_write()")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

Roberto, I think we need to resolve this somehow.  As I mentioned
earlier, I don't believe this to be a fault in your patch, rather that
patch simply triggered a situation that had not been present before,
likely because the reiserfs code always failed when writing LSM
xattrs.  Regardless, we still need to fix the deadlocks that sysbot
has been reporting.

Has anyone dug into the reiserfs code to try and resolve the deadlock?
 Considering the state of reiserfs, I'm guessing no one has, and I
can't blame them; I personally would have a hard time justifying
significant time spent on reiserfs at this point.  Unless someone has
any better ideas, I'm wondering if we shouldn't just admit defeat with
reiserfs and LSM xattrs and disable/remove the reiserfs LSM xattr
support?  Given the bug that Roberto was fixing with the patch in
question, it's unlikely this was working anyway.

--
paul-moore.com
