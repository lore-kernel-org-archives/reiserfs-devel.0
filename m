From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sat, 07 Aug 2004 00:49:43 -0700
Message-ID: <41148997.4070404@namesys.com>
References: <20040807065039.5BF4E15CBC@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040807065039.5BF4E15CBC@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>

David Dabbs wrote:

> =20
>
>>-----Original Message-----
>>From: Hans Reiser [mailto:reiser@namesys.com]
>>Sent: Friday, August 06, 2004 11:16 PM
>>To: David Dabbs
>>Cc: 'Philippe Gramoull=E9'; 'ReiserFS List'
>>Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
>>error"
>>
>>David Dabbs wrote:
>>
>>   =20
>>
>>>i.e.
>>>
>>>	"%.c", '`' + (char) rnd
>>>
>>>If you exceed 26 then you will generate filenames that may cause
>>>     =20
>>>
>>problems.
>>   =20
>>
>>>     =20
>>>
>>Problems that indicate reiser4 bugs or mongo bugs?
>>
>>   =20
>>
>
>Mongo. The pipe character is not legal in a filename as an example.
>
>I think I have discovered the problem - unless there was a reason mongo was
>issuing mount/unmount commands at the start/end of a mongo 'run' as well as
>before/after _each phase_. I just removed the mount/unmount calls that
>bracket each phase execution and I am not seeing the errors. In addition,
>reiser4 is running much faster. For instance, with the 'extra'
>mount/unmounts r4 reported a REAL TIME stats of approximately 700 & 40 for
>CREATE and MKFILES. After removing the mount/un calls it is reporting 224 &
>50 REAL TIME.
> =20
>
can you quote code more in these emails?

>I will reboot and run a sequence of each of the filesystem configs overnig=
ht
>and see what happens.
>
>David
>
>
>
>
>
> =20
>
Probably someone wanted to separate the measurement of the phases.  It=20
has been a while since I read mongo.....
