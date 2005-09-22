From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 19:51:37 +0200
Message-ID: <200509221951.38302.namesys.Sch@ttgen.net>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4332DE9F.8010808@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com

On Thursday, 22. September 2005 18:41, Edward Shishkin wrote:
> Grzegorz Ja=C5=9Bkiewicz wrote:
> >I think there should be file attribute that says whether it is
> >compressed/whatever/ or not.
>
> Right. All the plugins responsible for compression, etc.. will be observed
> via pseudo-file interface
>
> > This way, it would be possible to
> >compress already existing files. At least, if filesystem is so
> >flexible as everyone say, it would be possible.
>
> It will be possible to turn on/off compression at any
> time if a file is powered by cryptcompress plugin id.
> AFAIK changing file plugin id will be impossible (at least in reiser4)

I don't quite understand how the file plugin concept scales once we get mor=
e=20
of them. For instance if I want to have an additional attribute attached to=
=20
my files, which contains a checksum that is kept up to date whenever the fi=
le=20
is changed. I'd have to use a special file plugin for those files then, is=
=20
this correct?=20
In that case it's always an exclusive decision if I want my files checksumm=
ed,=20
compressed, encrypted, monitored for changes or whatever.

Apparently the encryption and the compression is realized with one single f=
ile=20
plugin, so it seems that there is indeed no way to have both features=20
implemented as separate plugins. Or is there another reason why you packed=
=20
both things into one plugin? If most new file features have to be implement=
ed=20
as part of one single plugin, then the whole concept of using file plugin=20
starts looking a bit less promising in my eyes.=20
I hope I'm just wrong or the plugin interface is not set in stone yet ;)

=46red
