From: geearf@free.fr
Subject: Re: Reiser4 crash
Date: Wed, 19 Nov 2008 05:11:29 +0100 (CET)
Message-ID: <1507673316.377921227067889231.JavaMail.root@zimbra4-e1.priv.proxad.net>
References: <4920AE1D.8070808@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4920AE1D.8070808@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


----- Mail Original -----
De: "Edward Shishkin" <edward.shishkin@gmail.com>
=C3=80: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org
Envoy=C3=A9: Dimanche 16 Novembre 2008 15:34:53 GMT -08:00 USA/Canada -=
 =C3=89tats du Pacifique
Objet: Re: Reiser4 crash

geearf@free.fr wrote:
>> Hello ML,
>>
>> just to report one issue that I had yesterday with r4:
>>
>> I restarted Xorg the hard way (ctrl alt backspace) without any real =
reason for that, just to try some different xorg.conf and >>then I coul=
d not log in KDE anymore (I had a bad crash the previous day so it coul=
d have been related).
>> Result was that certain files were corrupted and fsck.reiser4 did no=
t fully help. To fix my issues I had to fsck the partition >>and manual=
ly remove anything in /tmp and /var/tmp from another OS. Removing anyth=
ing in /var/tmp while using that partition as >>the OS would result in =
a crash even after fsck said everything was fixed...
>>  =20

>It is reproducible?
I have no idea how, and I do not have much time to corrupt my system th=
is week.
>Compression is disabled?
It was enabled

>if both is "yes", then, please, pack the metadata by
>debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>and let me download the file meta.gz

>> What I saw in dmsg was pretty much the same we had a year ago when K=
DE4 was out, with the "out of memory?" warning and stuff till Edward fi=
xed R4.
>
>  =20

>Yes, it looks like a bug in handling some special
>case of incomplete conversion. Anyway, detailed
>kernel complaints are highly desirable..

>Thanks,
>Edward.

Sorry I did not keep any data after fixing the fs...

John
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
