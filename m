From: Aleksandr Nogikh <nogikh@google.com>
Subject: Re: [syzbot] [wireless?] [reiserfs?] general protection fault in __iterate_interfaces
Date: Mon, 26 Jun 2023 19:55:47 +0200
Message-ID: <CANp29Y6eSpawFhDhv2SW78PKhvCSke8z26=MYNdSu8V4vPSoag@mail.gmail.com>
References: <000000000000302fb805fd180f4a@google.com> <d15cd98d8612e756b4c22a10394d680342512c44.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687802160; x=1690394160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KyqId0hy9n8ww7dcYImtfZGCEfGZtufQ6XSWSyML2w=;
        b=UWtA6BfqBZs0V7WU4CJsXSVx/DqY8RLqLfYuMZlc98E6LB0sbyhWRwGzRowIqb3fwb
         5SGmfJui+n46jrgKlCMTEBgO3XWs9VNxTAZO3zuBYF2gYwZA5Un1huHhl/12CyJGGmlc
         f2tbysJD8byNZvDVUxQ7lXacoxcNY9Z9g4/xPmTWLB1BFExo5WHNYu7gXcjGfPM4yT9p
         goqaekJCGUTzkMRrYE7bjxXPE7NTe5SOF/HMjEfz4VbBMv0eXLl/5h6YKAxn5lFuu/Ir
         goXiCjZrHj0/Q7ZIgI/cIaxmhMrZD5uOZoRx2mjLiqcX9KaOBlA+0b0UdDBnWdf9/2bL
         QZgw==
In-Reply-To: <d15cd98d8612e756b4c22a10394d680342512c44.camel@sipsolutions.net>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Johannes Berg <johannes@sipsolutions.net>
Cc: syzbot <syzbot+1c54f0eff457978ad5f9@syzkaller.appspotmail.com>, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

On Fri, Jun 23, 2023 at 1:08=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Thu, 2023-06-01 at 14:24 -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    715abedee4cd Add linux-next specific files for 20230515
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D13c96725280=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6a2745d066d=
da0ec
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D1c54f0eff4579=
78ad5f9
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binu=
tils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1588e9992=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1013cbc1280=
000
> >
>
> Looking at the reproducers, there's basically nothing happening in wifi.
>
> So seems likely it's just some really bad memory corruption issue in
> reiserfs?

Looks like that indeed.

Let's update bug's subsystems on the syzbot dashboard:

#syz set subsystems: reiserfs

>
> johannes
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/d15cd98d8612e756b4c22a10394d680342512c44.camel%40sipsoluti=
ons.net.
