From: Andreas Gruenbacher <agruenba@redhat.com>
Subject: =?UTF-8?B?YmFsYW5jZV9pbnRlcm5hbDog4oCYbmV3X2luc2VydF9rZXnigJkgdXNlZCB1bmluaXRpYQ==?=
	=?UTF-8?B?bGl6ZWQ=?=
Date: Mon, 23 Nov 2015 13:18:50 +0100
Message-ID: <CAHc6FU4miXBCBSXbG2z+Me6YXoh98KV4a95HZbqSqOdULNW_RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Hello,

I'm getting the following warning in mainline:

> fs/reiserfs/ibalance.c: In function =E2=80=98balance_internal=E2=80=99=
:
> fs/reiserfs/ibalance.c:1156:2: warning: =E2=80=98new_insert_key=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]

Looking at the code, it seems pretty obvious that the code is incorrect=
=2E

Could that please be fixed?

Thanks,
Andreas
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
