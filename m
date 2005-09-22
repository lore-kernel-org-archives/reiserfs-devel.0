From: michael chang <thenewme91@gmail.com>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 16:54:12 -0400
Message-ID: <b14e81f00509221354348a431b@mail.gmail.com>
References: <194f625505092006316ad200b5@mail.gmail.com>
	 <2f4958ff05092208244a0496fc@mail.gmail.com>
	 <4332DE9F.8010808@namesys.com>
	 <200509221951.38302.namesys.Sch@ttgen.net>
	 <43330E14.9050209@namesys.com> <4333100F.6080307@slaphack.com>
	 <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>
Cc: David Masover <ninja@slaphack.com>, Edward Shishkin <edward@namesys.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

On 9/22/05, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu> wrote:
> 2) Even though most modern block ciphers are designed to be fast, it's st=
ill
> faster to apply a reasonably quick compression scheme to whomp 16K of dat=
a
> down to 5-6K and encrypt/decrypt 5-6k than it is to encrypt/decrypt 16K.

Two questions.  One, does this mean that compression will usually be
performed before encryption (which to me, sounds like it appears to be
what would be the best method here)?

Second, will plugins be layerable, e.g. can I use a compression plugin
and a _seperate_ encryption plugin on the _same_ file, and then if so,
can I choose which order in which they take effect?

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
