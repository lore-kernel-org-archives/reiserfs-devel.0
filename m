From: Hans Reiser <reiser@namesys.com>
Subject: Re: More Slowdown - testscript [noatime,nodiratime]
Date: Wed, 23 Nov 2005 20:49:44 -0800
Message-ID: <43854668.8010000@namesys.com>
References: <200511171447.41362.mail@earthworm.de>	 <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>	 <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>	 <4383677F.8060106@namesys.com>	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>	 <1132709496.7650.24.camel@teratron.lan.etheus.net>	 <1132710424.7328.7.camel@teratron.lan.etheus.net> <1132777409.7458.8.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132777409.7458.8.camel@teratron.lan.etheus.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Craig Shelley wrote:

>With the noatime and nodiratime options, the problem of accessing files
>causing a massive sync time has gone. See the results below.
>
>Although this option has made the system useable, I don't think it has
>fully solved the problem. I think fsync() and sync() performance is
>still poor, I will do a bit more testing and get back.
>
>Regards,
>
>  
>
Sounds like we need to specifically optimize fsync.  Well, we have known
that for a while, but now it is more true.

Ways we can do it include using write twice journaling to a fixed
journal area for fsync, and making it possible to specify for a
particular file that it should have an atime, and then letting noatime
be the default.

Probably doing both is best.

Atime has been hated by most fs designers for a very very long time, so
there might be less resistance to a new standard for this than one would
think.

Hans
