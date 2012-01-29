From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4
 --build-fs /dev/sdc
Date: Sun, 29 Jan 2012 08:51:53 +0100
Message-ID: <op.v8t5gqschogzsi@g17b>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: reiserfs-devel@vger.kernel.org, doiggl@velocitynet.com.au

Dne Sun, 29 Jan 2012 05:15:48 +0100 <doiggl@velocitynet.com.au> napsal(=
a):

> Hello,
> I did a repair on a reiser4 partition as follows:
> # fsck.reiser4 --build-fs  /dev/sdc
>
> =E2=80=A6
>
> # mount /dev/sdc  /media/disk2
> mount: No such file or directory
>
> This did not work either
> mount -t reiser4  /dev/sdc  /media/disk2
> mount: No such file or directory
>
> Other details
> -------------
> # cd /media
> # md disk2
> # ll
> total 3
> drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
> drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2

Hello,

I suppose "md" is an alias for mkdir, right? And "ll" for ls -l? Did th=
e
directory /media/disk2 exist at the time you were trying to mount to it=
?
Does your syslog contain anything useful?

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
