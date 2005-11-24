From: Sander <sander@humilis.net>
Subject: Re: More Slowdown - testscript [noatime,nodiratime]
Date: Thu, 24 Nov 2005 08:49:09 +0100
Message-ID: <20051124074909.GB8307@favonius>
References: <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de> <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com> <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com> <1132709496.7650.24.camel@teratron.lan.etheus.net> <1132710424.7328.7.camel@teratron.lan.etheus.net> <1132777409.7458.8.camel@teratron.lan.etheus.net> <43854668.8010000@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43854668.8010000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote (ao):
> Craig Shelley wrote:
> >With the noatime and nodiratime options, the problem of accessing files
> >causing a massive sync time has gone. See the results below.
> >
> >Although this option has made the system useable, I don't think it has
> >fully solved the problem. I think fsync() and sync() performance is
> >still poor, I will do a bit more testing and get back.
>
> Sounds like we need to specifically optimize fsync.  Well, we have
> known that for a while, but now it is more true.

Please don't forget that the behavior without 'noatime' is new. I never
had my disk mounted 'noatime', and until recently did not experience the
huge slowdown. I assume the other people who reported this agree.

So whether or not fsync needs to be optimized, something changed in
Reiser4 or -mm that causes the huge slowdown.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
