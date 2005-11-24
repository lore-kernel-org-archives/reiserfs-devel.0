From: Avuton Olrich <avuton@gmail.com>
Subject: Re: More Slowdown - testscript [noatime,nodiratime]
Date: Thu, 24 Nov 2005 01:41:39 -0800
Message-ID: <3aa654a40511240141u770c657br18fe2cd618c4f479@mail.gmail.com>
References: <437CBC63.3050202@namesys.com> <43820CAD.3090605@namesys.com>
	 <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com>
	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
	 <1132709496.7650.24.camel@teratron.lan.etheus.net>
	 <1132710424.7328.7.camel@teratron.lan.etheus.net>
	 <1132777409.7458.8.camel@teratron.lan.etheus.net>
	 <43854668.8010000@namesys.com> <20051124074909.GB8307@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051124074909.GB8307@favonius>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On 11/23/05, Sander <sander@humilis.net> wrote:
> Hans Reiser wrote (ao):
> > Craig Shelley wrote:
> > >With the noatime and nodiratime options, the problem of accessing file=
s
> > >causing a massive sync time has gone. See the results below.

> Please don't forget that the behavior without 'noatime' is new. I never
> had my disk mounted 'noatime', and until recently did not experience the
> huge slowdown. I assume the other people who reported this agree.
>
> So whether or not fsync needs to be optimized, something changed in
> Reiser4 or -mm that causes the huge slowdown.

Agreed, I have mounted with noatime nodiratime and still get time when
interactivity is extremely poor. Mostly with the vim test. I'm not
sure the problem is /fixed/ but it does seem much better.

avuton
--
  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
