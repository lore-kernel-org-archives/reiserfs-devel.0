From: David Masover <ninja@slaphack.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Thu, 22 Sep 2005 15:11:59 -0500
Message-ID: <4333100F.6080307@slaphack.com>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43330E14.9050209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

Edward Shishkin wrote:
> Fred Schaettgen wrote:
>=20
>> On Thursday, 22. September 2005 18:41, Edward Shishkin wrote:
>> =20
>>
>>> Grzegorz Ja=C5=9Bkiewicz wrote:


>> Or is there another reason why you packed both things into one plugin?
>>
>=20
> Because sometimes it is useful to compress data before encryption since=20
> compression
> destroys vulnerable regular structure of some special files (like *.html)

Although I'd imagine some algorithms are fairly resistant against that=20
(RSA, maybe?), the main reason is simple -- encryption tends to=20
introduce randomness.  If the crypto is any good at all, you won't be=20
able to compress very well after you've encrypted.

Anyway, can't you stack plugins?  Or at least create one new plugin out=20
of two existing ones?

>> If most new file features have to be implemented as part of one single=20
>> plugin,
>>
>=20
> Then this plugin will look like a monster ;)
> Not necessarily. On the oher hand, creating a separate file plugin for=20
> each feature
> imho is not a good idea.

How about some other examples of things to group together and things to=20
not group together?

I wonder if it would make sense to try to optimize for a huge number of=20
plugins?  It'd be harder than optimizing for a huge number of files per=20
directory, but would it be possible?
