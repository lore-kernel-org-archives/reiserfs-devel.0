From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 inclusion into staging tree
Date: Sun, 02 Nov 2014 23:19:14 +0100
Message-ID: <5456ADE2.9060405@gmail.com>
References: <CADW=+3knfdvLiuFRNWdA5PQjq+fg-iC+D6NNqV9y8=vewig-hw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=vAhH+k+q2I/2sFQTVtE3NMvoOBA7nA9f7WiHMOOf6tE=;
        b=HvsltUIb9LF5h6leIgHte7JHP7zF8LVtifLvp8uiPoQdA2mCW/mxZtTL4+0QbOawVn
         jc/55S7IE9V+MMMQs7C1RcAp4C40bn6CVX2qqrYsKfixp5GAegqBwdU9xUN7ohXoKvrI
         PeNKqunGoHAXJ6rnn6HEB9+w6JGGffzboChfuCceO1clyRzKQz0C4dzAWhozE+2XXjm6
         W7zCP/UrkyOCeNefHowdGOtDZsSA0THzCjzv3j2c4nR+Oa0eTR8icKZ2KKkh/BeyRNrI
         xPHPNUKWoF584M1XFj97OcRZl1Y4gCniFItptIuhY8RV7lBWzTyc3Q5V3u2udAo7MnUa
         Hyuw==
In-Reply-To: <CADW=+3knfdvLiuFRNWdA5PQjq+fg-iC+D6NNqV9y8=vewig-hw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>


On 11/02/2014 10:09 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> I've made a poll on forums.gentoo.org with a question:" What Reiser4
> needs for you to start using it?" and with these offered answers I go=
t
> following results:
>
> http://forums.gentoo.org/viewtopic-t-1002726-postdays-0-postorder-asc=
-start-25.html
>
> Mainline inclusion
>   45%
> Encryption
>   0%
> Snapshots
>   0%
> Defrag
>   0%
> Performance
>   0%
> Subvolumes
>   0%
> Grub2 support
>   0%
> Something else
>   31%
> It's already perfect
>   4%
> I'd never use it
>   18%
>
>
> Something else were users that asked for checksums (we do that for
> ccreg40 partitions or files?


Currently a checksum (adler32) is appended at the end of compressed
logical cluster. If cluster is not compressed for some reasons, then
checksum is not appended.

Also we protect bitmap blocks by checksums.


>   what about reg40? just sizes AFAIK?),


Data of files managed by unix-file plugin is not protected by checksums=
=2E

I think that data protection by checksums is a business of applications
(not of the file system).

It makes sense to protect formatted nodes of the storage tree.
We'll need a new node format (node41, or so), which includes a 32-bit
checksum, which is updated/checked at flush/jload time. If jload() find=
s
that check is not OK, then make the file system read-only and suggest
to fsck.

Edward.


>   SSD
> support, fixing undeletable dir bug, long mount times (if the large
> partition is / does dont_load_bitmap have to be in boot options or it
> can be in /etc/fstab?)...
>
> Based on these results (even on a small portion of linux user base
> that's traditionally been positive about reiser4) I really think that
> taking Reiser4 to the staging tree could be the move that would show
> users that the R4 development has some goal and is not dying down and
> with that would come influx of new users/developers.
>
> Ofc this is just my wish as I don't have the knowlege or right to pus=
h
> it to staging but if there's anything you can think of that I can do
> to help (I have one extra machine just waiting for some R4 testing)
> please tell me.
>
> Thanks a lot for your great work
>
> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
