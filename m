From: Edward Shishkin <edward@namesys.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Fri, 23 Sep 2005 00:03:32 +0400
Message-ID: <43330E14.9050209@namesys.com>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509221951.38302.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote:

>On Thursday, 22. September 2005 18:41, Edward Shishkin wrote:
> =20
>
>>Grzegorz Ja=C5=9Bkiewicz wrote:
>>   =20
>>
>>>I think there should be file attribute that says whether it is
>>>compressed/whatever/ or not.
>>>     =20
>>>
>>Right. All the plugins responsible for compression, etc.. will be observed
>>via pseudo-file interface
>>
>>   =20
>>
>>>This way, it would be possible to
>>>compress already existing files. At least, if filesystem is so
>>>flexible as everyone say, it would be possible.
>>>     =20
>>>
>>It will be possible to turn on/off compression at any
>>time if a file is powered by cryptcompress plugin id.
>>AFAIK changing file plugin id will be impossible (at least in reiser4)
>>   =20
>>
>
>I don't quite understand how the file plugin concept scales once we get mo=
re=20
>of them. For instance if I want to have an additional attribute attached t=
o=20
>my files, which contains a checksum that is kept up to date whenever the f=
ile=20
>is changed. I'd have to use a special file plugin for those files then, is=
=20
>this correct?
>
Yes. It is impossible to implement all features in one file plugin.=20
Checksuming means a low
performance: in order to read some bytes of such file you will need=20
first to read the whole file
to check a checksum (isnt it?). So it will be suitable for a small=20
number of special files.
To write this new file plugin you will want to use already existing=20
cipher and compression
transform plugins (dont mix it with cryptcompress file plugin which also=20
calls those plugins)
to compress and encrypt your checksumed file.
=20

>In that case it's always an exclusive decision if I want my files checksum=
med,=20
>compressed, encrypted, monitored for changes or whatever.
>
>Apparently the encryption and the compression is realized with one single =
file=20
>plugin, so it seems that there is indeed no way to have both features=20
>implemented as separate plugins.
>

Why do you need separate ones? Having only a cryptcompress file plugin=20
you will be able
to create files which are either only encrypted or only compressed, just=20
set the transform
plugins properly.

> Or is there another reason why you packed=20
>both things into one plugin?
>

Because sometimes it is useful to compress data before encryption since=20
compression
destroys vulnerable regular structure of some special files (like *.html)

>If most new file features have to be implemented=20
>as part of one single plugin,
>

Then this plugin will look like a monster ;)
Not necessarily. On the oher hand, creating a separate file plugin for=20
each feature
imho is not a good idea.

> then the whole concept of using file plugin
>starts looking a bit less promising in my eyes.=20
>I hope I'm just wrong or the plugin interface is not set in stone yet ;)
>
>Fred
>
>
> =20
>

