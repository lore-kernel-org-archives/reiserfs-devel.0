From: Hans Reiser <reiser@namesys.com>
Subject: Re: New to reiserfs
Date: Tue, 14 May 2002 00:57:07 +0400
Message-ID: <3CE028A3.3080002@namesys.com>
References: <200205132153.59075.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, JPASTORM@esade.edu

Dieter N=FCtzel wrote:

>On Monday 13 May 2002 10:07, Hans Reiser wrote:
> =20
>
>>>>4.- I have a PIII 1 GHz, 512 MB RAM, SCSI server where I run sendmail,
>>>>bind and squid. Will I have problems with performance if I migrate to
>>>>reiserfs?
>>>>
>>>>       =20
>>>>
>>sendmail will be lower in performance when using reiserfs unless you use =

>>the latest not yet released patches and turned data journaling on.
>>   =20
>>
>
>More speed numbers on this to come with related post.
> =20
>
>>Do you really push the performance limits of the machine as a mail server?
>>   =20
>>
>
>You mean if it is worth?
>
> =20
>
>>squid will benefit from your putting all files in one directory.
>>   =20
>>
>
>So I should clobber my squid partition/dir and reconfigure to put all file=
s=20
>into only one directory and let the squid hierarchy alone?
>
>Thanks,
>	Dieter
>
> =20
>
I don't understand you. =20

You should put squid into one big directory (not using their kludge that=20
avoids making directories too large by using a tree)  unless you have=20
multiple processors (in which case the VFS directory giant lock will=20
hurt you).

Hans


