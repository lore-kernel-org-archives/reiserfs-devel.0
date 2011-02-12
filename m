From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: how can I list out any replayed journal entries on startup in
 reiser4 filesystem
Date: Sat, 12 Feb 2011 15:21:04 +0100
Message-ID: <4D569750.6040507@gmail.com>
References: <a97e8e36d46dfcf2ec71076c895a5d40@mail.velocitynet.com.au> <4D55E2D2.2070306@gmail.com> <a2d9ce3b9dd8baedbc543628d9c72573@mail.velocitynet.com.au> <op.vqr6rm2phogzsi@g17b> <3f7c92853e755d5e74db17f2885f41dd@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=0CuHSbPsZ/D6l9+8wEEEPhLOGy60gbljk9pmwIB1zpA=;
        b=kLspLMQCx/03IerCX0Dx4BoAMLuEckdOYGOTcPZYCZVDWYVY/ldJvUJGGmTHefGtT1
         KdkpKQ0QFldBZZwCjrxnLcibAxBxOpiwRnk7/2HebDYuGX3VZGs/1Sh8M0kDWzVntqyP
         RreJg5xq1OUqYHCfVOOtkTKUda3tUix/ezedU=
In-Reply-To: <3f7c92853e755d5e74db17f2885f41dd@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>, ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

On 02/12/2011 03:06 PM, doiggl@velocitynet.com.au wrote:
> On Sat, 12 Feb 2011 09:20:06 +0100, Jon=C3=A1=C5=A1 Vidra<vidra.jonas=
@seznam.cz>
> wrote:
>> Dne Sat, 12 Feb 2011 04:20:13 +0100<doiggl@velocitynet.com.au>
> napsal(a):
>>
>>> Hello,
>>> I ask because the activation time on /dev/sdb ->  /media/disk is 13=
0
>>> seconds or so with no progress on screen , so for me its helpful to=
 see
> a
>>> progress indicator and a pass/fail at the end of journal replay
> process.
>>> Glenn
>>
>> Umount your partitions properly and use fsck if you don't. But I don=
't
>> think this is caused by a journal replay. How big is that disk? You =
may
>> consider using the "dont_load_bitmap" option =E2=80=94 just put it i=
nto your
>> fstab or use the "-o" switch when you mount the FS.
>
>> How big is that disk?
> 1.7Terabyte | 1.1T used | 600 GB free |371,987 files,  all on one
> partition

Yes, this is not because of journal replays: you have a large
volume, and by default all bitmap blocks are loaded to memory
in mount time.

>
> Is this the correct format for dont_load_bitmap in /etc/fstab ?
>
> /dev/sdb /media/disk reiser4 defaults,dont_load_bitmap 0 0


There were complaints that loading bitmaps "on-demand" causes
system lockups, I didn't have a chance to look at this yet. So
I wouldn't recommend to use this mount option for now.

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
