From: Anders Widman <andewid@tnonline.net>
Subject: Re: Slightly off topic.
Date: Wed, 5 Mar 2003 19:46:22 +0100
Message-ID: <15271152843.20030305194622@tnonline.net>
References: <15543129984.20030305115919@tnonline.net>
 <200303060524.33398.sam@vilain.net> <7163181578.20030305173331@tnonline.net>
 <200303051842.54392.Dieter.Nuetzel@hamburg.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303051842.54392.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?RGlldGVyIE78dHplbA==?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com

> Am Mittwoch, 5. M=E4rz 2003 17:33 schrieb Anders Widman:
>> > On Thu, 06 Mar 2003 05:04, Christian Mayrhuber wrote:
>> >> Am Mittwoch, 5. M=E4rz 2003 11:59 schrieb Anders Widman:
>> >> >    Does  anyone  know  where to find a driver for the new Promise S=
ATA
>> >> >    150  controller  for  2.4  or  2.5 kernels? So far I have not fo=
und
>> >> >    anything  on  the promise website, nor does the built-in drivers=
 in
>> >> >    current kernels support the new promise controllers? The chip mo=
del
>> >> >    is  PDC20376,  but  the  kernels  seem to only support PDC202xx =
not
>> >> >    PDC203xx.
>> >>
>> >> No drivers exist for Promise SATA controllers and it seems that none
>> >> will be written. See
>> >> http://kt.dlut.edu.cn/kernel-traffic/kt20030223_206.html#6
>> >
>> > Or wait for Serial SCSI.  IDE has always sucked :-).  My system running
>> > with a Symbios SCSI controller and a 10MBps bus seems damned faster and
>> > more responsive than when I was running on a UDMA66 HD.  I largely put=
 it
>> > down to Tagged Command Queuing
>>
>> Which is in ATA-100 and above. Just tha Linux has not yet support this
>> feature.

> Not true.
> IBM disks support it for ages.

I  was  under the impression that the host OS also has to support TCQ,
but maybe I was mistaken about that.

> Linux and Free (?) BSD was first.

I only noticed support in late 2.4.1x kernels?

> Regards,
>         Dieter


  =20



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

