From: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in delete_one_xattr (2)
Date: Mon, 25 Sep 2023 13:14:05 +0300
Message-ID: <CAOQ4uxiRDubLv37ONA+g_ZissLQpdZXoO-442pp=U+-3qQJMzQ@mail.gmail.com>
References: <000000000000964cb905f5e876ff@google.com> <0000000000008a3693060628bb0b@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-unionfs-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695636856; x=1696241656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAIIO8bbHlcK3rCEQBQ1u0uoNoEGwnfHthV/V0CZlE4=;
        b=CUc/ard6OqNMtJG7I6Jgo4NmK16Q/iRCYy4dM2IIbQuS0XtGkq3NMnN17HKZrCa93Y
         1WuOcCKFnJIypNnvhx+UuZM7ynDD+vACsA96yh+eWG51y9+MFqCdmB/ParTxglzhe4kT
         UY+/MoC5n4mrpEzmHTAADOruphTa1buwlf0qA/Vcd7SOdDCEsU+ttQ3EkQ7clbKsLouQ
         XOc1q73HVwXFhFu8ZEpAa6/wUAtvZhb+Hlu/lfZA4FmgVql/e7vtrbIPH7KbyjA1Ybjr
         G248uV4QsbWvAZoz2Od/JxOEfQS3PEKMUWwwZIfBWtbiuSqpH1BaTxoZpP4JbQUtjJOF
         XTRA==
In-Reply-To: <0000000000008a3693060628bb0b@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: syzbot <syzbot+7a278bf8bfa794494110@syzkaller.appspotmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, miklos@szeredi.hu, mszeredi@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>

On Mon, Sep 25, 2023 at 9:04=E2=80=AFAM syzbot
<syzbot+7a278bf8bfa794494110@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit 9df085f3c9a2d4658a9fe323d70c200aa00ede93
> Author: Amir Goldstein <amir73il@gmail.com>
> Date:   Mon Sep 3 06:12:09 2018 +0000
>
>     ovl: relax requirement for non null uuid of lower fs
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1711e75a68=
0000
> start commit:   ac9a78681b92 Linux 6.4-rc1
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1491e75a68=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1091e75a68000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8bc832f563d8b=
f38
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D7a278bf8bfa7944=
94110
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1295e4b8280=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D140af20a28000=
0
>
> Reported-by: syzbot+7a278bf8bfa794494110@syzkaller.appspotmail.com
> Fixes: 9df085f3c9a2 ("ovl: relax requirement for non null uuid of lower f=
s")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

[CC the developers who marked reiserfs for deprecation]

Resierfs AND moving files underneath overlayfs.
Not worth much investigation time IMO.
If I could tell syzbot, ignore this report, I would.

Resierfs deletes xattrs from reiserfs_evict_inode() context,
which seems to be related to the lockdep warning.

Thanks,
Amir.
