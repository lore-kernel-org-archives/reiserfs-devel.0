From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4_unlink_common [nikita-3398]: WARNING: Cannot unlink 2246037
 (-2)
Date: Sat, 28 Sep 2013 23:05:43 +0200
Message-ID: <524744A7.1070602@gmail.com>
References: <CAL2jS+kyd-2g0YJqm_BWLQuD52NuAxjv9eUS-ZGsbct6otLMGA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WKp5n5jy3FmsOk6RNzDxvDwQ3AKXypgu0x6XRHIPy1Y=;
        b=l8faIiO5utju0GZU59y6DKxbsLrsK9MN6a9SCgU8YnDPp971lilYZsFI1Owbs+S3M0
         4yKfS/W9P+IZ6JTmoyIA3yvxbUCiBanBT0s8VpPw7gEBlQOnXfw5BjILXuVazubRrqoX
         KMV/MY3zcc/kAmbCnojBykgbGakIMynnudNiO9SuZ7MYBtIAbMAw/VgJhSebcfCx0wnr
         smuUUUYGlB00zm6Fgi/wkYpJFIMQPOl+a1wozAmt2AsjDDxjXJUTRc8SaSygiuGrE1Gq
         VsfGY+/X/2CfvTW2ZyIg8nkYe8udkmURuCpdGn9yOGh+zc0MJt2JIE2KOyJhNWYxNJ7q
         4V/g==
In-Reply-To: <CAL2jS+kyd-2g0YJqm_BWLQuD52NuAxjv9eUS-ZGsbct6otLMGA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


Please, find the name of the file (find -num 2246037)
and try to delete this file. Report about result.

P.S.
Make sure that you have this patch applied:
http://marc.info/?l=3Dreiserfs-devel&m=3D137996289628968&q=3Dp3



28.09.2013 21:31, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello Edward,
>
> I can reproduce the problem with undeletable folders on my server. I
> have two partitions. One of them xfs and the second is reiser4. When =
I
> use rsync to copy Magento cache folder from xfs partition to reiser4
> and trying to delete it tells me:
> rm: cannot remove =E2=80=98mage--c=E2=80=99: Directory not empty
> rm: cannot remove =E2=80=98mage--d=E2=80=99: Directory not empty
> When I do the same copy by cp or mc - all is fine.
>
> I hope this information somehow help you to catch the bug. If you nee=
d
> any additional info - let me know.
>
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
