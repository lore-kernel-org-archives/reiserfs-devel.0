From: Bret Towe <magnade@gmail.com>
Subject: Re: reiserfs issue with 2.6.32.8
Date: Wed, 3 Mar 2010 19:00:24 -0800
Message-ID: <dda83e781003031900x3ca243d9kba1df3a8b0e04105@mail.gmail.com>
References: <dda83e781002141023t2abe95b8w83f59d6f411f68a2@mail.gmail.com>
	 <alpine.DEB.2.01.1002142229470.28195@bogon.housecafe.de>
	 <dda83e781002232131i53b59c8eu7192257fc4e4f3e0@mail.gmail.com>
	 <alpine.DEB.2.01.1002232249440.28195@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=oIwTMCn6HANJdWPpFKTX2wxmjjkPY1nHt3lGFvyccSA=;
        b=chNh2KqInWMHE+yGBmefOAn3h/WWuZJR76pRYrGYxJLA4yNjrQIlau0N/6/no2CSns
         qS6n1f3S18GnIol/agfAbPPAkKFWjBQSuFAJdl59RM7gs7oWHuILbtOS6AzlOcIb0o3z
         fS+7WSl9+S85F/FgnWKOmjsBq4jmBuqYkzQck=
In-Reply-To: <alpine.DEB.2.01.1002232249440.28195@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Kujau <lists@nerdbynature.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Tue, Feb 23, 2010 at 11:03 PM, Christian Kujau <lists@nerdbynature.d=
e> wrote:
> On Tue, 23 Feb 2010 at 21:31, Bret Towe wrote:
>> ok attached is strace log of cp on 2.6.32.9
>
> I've run cp through strace as well (copying something from an XFS
> partition to a reiserfs partition, I guess that's what you did too), =
and
> noticed a small difference at the end:
>
> < open("/home/foo/1", O_RDONLY) =A0 =A0 =A0 =A0 =A0=3D 3
> < fstat(3, {st_mode=3DS_IFREG|0640, st_size=3D755, ...}) =3D 0
> < open("2", O_WRONLY|O_CREAT|O_EXCL, 0640) =3D 4
>
> While your cp(1) did:
>
>> open("downloads/[DB]_Bleach_258_[27104F7A].avi", O_RDONLY) =3D 3
>> fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D178308328, ...}) =3D 0
>> open("/mdhd/media/Episodes/unwatched/[DB]_Bleach_258_[27104F7A].avi"=
, O_WRONLY|O_CREAT|O_EXCL, 0644) =3D -1 EINVAL (Invalid argument)
>
>
> And open(2) will return -EINVAL when:
> =A0 - The implementation does not support synchronised I/O for this f=
ile.
> =A0 - The value of the oflag argument is not valid.
>
> As we're not passing O_SYNC, it's the latter, if I read this correctl=
y. Which
> still doesn't explain *why* (the filesystem?) returns "invalid flag".
>
>> now I've had a hd drop out of raid (running checks on it atm)
>
> Hm, maybe it's all hardware related after all, let's see what these c=
hecks
> turn up. Strange though, that nothing gets reported in dmesg...

well the hardware update ended up changing more than I thought it would
now on 32bit from 64bit so config is completely new also for the kernel
end result tho is I'm on a 2.6.33 kernel and no issues
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
