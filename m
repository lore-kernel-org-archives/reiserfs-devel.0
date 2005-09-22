From: Edward Shishkin <edward@namesys.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Thu, 22 Sep 2005 20:41:03 +0400
Message-ID: <4332DE9F.8010808@namesys.com>
References: <194f625505092006316ad200b5@mail.gmail.com>	 <43302F71.3040001@namesys.com> <433034E0.9080904@namesys.com>	 <194f625505092012196e09b5ac@mail.gmail.com>	 <43306541.6010904@mch.one.pl> <4330667F.20000@namesys.com> <2f4958ff05092208244a0496fc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff05092208244a0496fc@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>
Cc: Tomasz Chmielewski <mangoo@mch.one.pl>, linuxhippy@gmail.com, reiserfs-list@namesys.com

Grzegorz Ja=C5=9Bkiewicz wrote:

>I think there should be file attribute that says whether it is
>compressed/whatever/ or not.
>

Right. All the plugins responsible for compression, etc.. will be observed
via pseudo-file interface

> This way, it would be possible to
>compress already existing files. At least, if filesystem is so
>flexible as everyone say, it would be possible.
> =20
>

It will be possible to turn on/off compression at any
time if a file is powered by cryptcompress plugin id.
AFAIK changing file plugin id will be impossible (at least in reiser4)

Edward.

>On 9/20/05, Edward Shishkin <edward@namesys.com> wrote:
>
> =20
>
>>Guys, it is not available. It still requires a work and the creation
>>interface
>>is on a discussion level.
>>   =20
>>
>
>
>--
>GJ
> =20
>

