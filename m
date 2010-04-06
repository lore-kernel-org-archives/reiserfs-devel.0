From: Marco Gatti <marco.gatti@gmail.com>
Subject: Re: reiserfs + acl corruption
Date: Tue, 6 Apr 2010 11:40:20 +0200
Message-ID: <r2r54cce25c1004060240o8f8baf09y5ccb5d7c6791ef53@mail.gmail.com>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
	 <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de>
	 <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de>
	 <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
	 <4BBA0313.4020405@suse.com>
	 <alpine.DEB.2.01.1004060136060.29272@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=iGaRYu8n1Yy0l/roXay/hCx0XsQ7EbPpgNYDPmZ4Ndg=;
        b=dsUUnk3STsZSS/RSSn8hCCKPdRy86aVDjSE8TTpRMf2eA3fkIHcHj5WEYCq0JUqEBz
         zy7mUQeiXy4PreL5vbjxygJmaKr9mg6AUHoajAh8pB4B/mAAY5PP+3OqqABKeehtgCrh
         +x4LXyQh6YVn9v9QIYthhnvLTGFUyklPpFnbQ=
In-Reply-To: <alpine.DEB.2.01.1004060136060.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christian Kujau <lists@nerdbynature.de>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

2010/4/6 Christian Kujau <lists@nerdbynature.de>:
> On Mon, 5 Apr 2010 at 11:34, Jeff Mahoney wrote:
>> Ok. I'm able to reproduce this with your script. I _can't_ reproduce=
 it
>> with 8 GB of memory, but I can reproduce it with mem=3D256m. That's =
a good
>> data point.
>
> On a 8GB machine I can reproduce it with 1000000 files, 500000 files =
is
> fine. I haven't found out the exact threshold though.
>
> v40z1# free -k
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total =C2=A0 =C2=A0 =C2=A0 =
used =C2=A0 =C2=A0 =C2=A0 free =C2=A0 =C2=A0 shared =C2=A0 =C2=A0buffer=
s =C2=A0 =C2=A0 cached
> Mem: =C2=A0 =C2=A0 =C2=A0 8121176 =C2=A0 =C2=A05497464 =C2=A0 =C2=A02=
623712 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 718264 =C2=A0 =
=C2=A01878760
> -/+ buffers/cache: =C2=A0 =C2=A02900440 =C2=A0 =C2=A05220736
> Swap: =C2=A0 =C2=A0 =C2=A0 996024 =C2=A0 =C2=A0 =C2=A0 1016 =C2=A0 =C2=
=A0 995008
>
>
> Could you comment on the relation to #14826, or is this something
> completely different. I'm getting more and more jdm-20002 in my syslo=
g and
> it's making me kinda nervous...
>
> Thanks,
> Christian.
>
> [0] http://bugzilla.kernel.org/show_bug.cgi?id=3D14826

Well, I checked the bug #14826 and it seems just the same that happened=
 to me.
I was curious so i reverted to a previous kernel version and i tested 2=
=2E6.31.12.
The bug is there and my debian system with 4GB of RAM gives the
Input/Output error managing 300000 files. So, IMHO, this bug is
related to something that changed before 2.6.32.
If i'll have some time i'll check previous versions of already built
kernels i used before and let you know what i found.

If i were you, Christian, backup all your data asap. When corruption
happened to me reiserfsck didn't help at all, even with rebuild-tree
option...
LVM snapshots saved me a lot of work and time!
=46or the record i was able to verify this bug with setfacl version
2.2.47 and 2.2.49, packaged by debian:
http://packages.debian.org/lenny/acl
The -R option is there for recurse.

Marco
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
