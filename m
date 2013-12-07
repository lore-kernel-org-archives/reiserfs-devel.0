From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 for 3.12
Date: Sat, 07 Dec 2013 20:38:17 +0100
Message-ID: <52A37929.8020304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=RQTjTWjmqzWGQisorakeRssywjoK3lTd+eHaTxB15Rs=;
        b=QGUgdhIQ7yr8UPzsEHD8VOj+48L0axnxae/4t9CPE2P1AIJMYteeKyiZzp11qamza+
         VB409b+TUF78zxYeM8nntqAVg7czCQ4L31vHunCue5zu2jlARPH0Fec21hemQYrIMJ7b
         tgmKO/GrNp5G+C8noDT5DYXTRp8EJgjtNPL2KSX8WVAlzTrgvJc190mOBCO0TJEhinPT
         M/9bNbxE+fu0KjlJ92MUKhq8YOW98yNXvA+Thf1Kd24eGYs6/4OzZZL7MKunZJoc1ucv
         l8//7U0LNTcJl0MJy4+OUlg5dX308pZkRIVzJITCQgqR6ocEWGugMNWdQthjGGP42tfL
         xC/w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

07.12.2013 17:59, Mathieu Belanger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
 > I have updated my git tree for kernel 3.12.

Thanks!

 >
 > No change for reiser4 since 3.12-rc2.
 >
 > Change since 3.11 :
 >  - Shrinker API change
 >  - Patch from Edward for enerasable directory (I think)


The problem still exists. It is not always reproducible though..
Sometimes when deleting a file the process can not find the
record about this file in the directory item. As the result, the
size of directory is not updated and it becomes undeletable.

I don't have any ideas, if this is an old bug, or some implicit
regression. People started to complain from 3.10, however
I didn't change reiser4 code when porting to 3.10.

After running fsck --fix the directory becomes removable again.
Also you can rename undeletable directories, so that they won't
annoy you (to not run fsck every time).

Edward.

 >
 > Note, I did not test it with 3.12 final yet. I still have a busy day=
=20
so have fun!
 >
 > Shrinker API change can be viewed here :=20
https://github.com/DestroyFX/reiser4/commits/reiser4-for-3.12-rc2
 > Current kernel 3.12 git  :=20
https://github.com/DestroyFX/reiser4/commits/reiser4-for-3.12
 > Patch Here : http://mirror.nxtoo.org/reiser4-for-3.12.patch.bz2

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
