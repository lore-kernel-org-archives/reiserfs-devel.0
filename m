From: Paul Moore <paul@paul-moore.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Fri, 5 May 2023 17:36:24 -0400
Message-ID: <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
References: <0000000000007bedb605f119ed9f@google.com> <00000000000000964605faf87416@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1683322595; x=1685914595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0JfIlTqaeXlyEjv8OL6VI/Norerpq4Zpq5DUaY96vQ=;
        b=HFIJtI/kpmdLq8nRaDpAzU/Clt1/UJxLL8jrzJIQ3nN3zf4fqNv+ZtaSmm9nZ9WSxL
         Fsdmz6Yg244MrJudDafdQdsz6UxENZYEXFzrOoHjOR1sy7cP5A+nj6c8BeRafdgdzmKW
         EXxDU+bc0GuwPIFHgZLrSGRMNZGd68ZC038in7IflWIaQ4+gF9uANMqT/6PCnj4G7msL
         Kp2821yv0nosKv0gQkf2+0iNHig/foynW4QCkBRYd1xWQZdSnHzLEuAnSGn0FWzJ2/pw
         JhUAS6Nd8jaQw0XJpJHlYYBttFdbB9ggrTzlZlYeFD/4Fdu7rWzcXyK1NwEpIMGB8CWy
         CKWQ==
In-Reply-To: <00000000000000964605faf87416@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com

On Fri, May 5, 2023 at 4:51=E2=80=AFPM syzbot
<syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
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
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1440318228=
0000
> start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of https://gith=
u..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1640318228=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1240318228000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D73a06f6ef2d5b=
492
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D8fb64a61fdd96b5=
0f3b8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12442414280=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D176a731828000=
0
>
> Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reis=
erfs_security_write()")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

I don't think Roberto's patch identified above is the actual root
cause of this problem as reiserfs_xattr_set_handle() is called in
reiserfs_security_write() both before and after the patch.  However,
due to some bad logic in reiserfs_security_write() which Roberto
corrected, I'm thinking that it is possible this code is being
exercised for the first time and syzbot is starting to trigger a
locking issue in the reiserfs code ... ?

--=20
paul-moore.com
