From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 crash
Date: Mon, 17 Nov 2008 02:34:53 +0300
Message-ID: <4920AE1D.8070808@gmail.com>
References: <1797610419.17231226436607627.JavaMail.root@zimbra4-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1797610419.17231226436607627.JavaMail.root@zimbra4-e1.priv.proxad.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

geearf@free.fr wrote:
> Hello ML,
>
> just to report one issue that I had yesterday with r4:
>
> I restarted Xorg the hard way (ctrl alt backspace) without any real reason for that, just to try some different xorg.conf and then I could not log in KDE anymore (I had a bad crash the previous day so it could have been related).
> Result was that certain files were corrupted and fsck.reiser4 did not fully help. To fix my issues I had to fsck the partition and manually remove anything in /tmp and /var/tmp from another OS. Removing anything in /var/tmp while using that partition as the OS would result in a crash even after fsck said everything was fixed...
>   

It is reproducible?
Compression is disabled?

if both is "yes", then, please, pack the metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

> What I saw in dmsg was pretty much the same we had a year ago when KDE4 was out, with the "out of memory?" warning and stuff till Edward fixed R4.
>
>   

Yes, it looks like a bug in handling some special
case of incomplete conversion. Anyway, detailed
kernel complaints are highly desirable..

Thanks,
Edward.
> I am not sure how relevant this report is but I thought I would still give it...
> I am using 2.6.27 with Edward's patch on Debian AMD64/Sid.
>
>
> Thanks,
> John
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

