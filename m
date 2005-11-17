From: Thorsten Hirsch <t.hirsch@web.de>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Thu, 17 Nov 2005 20:33:50 +0100
Message-ID: <1132256030.6340.5.camel@bauerbob.hirsch.lan>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com>
	 <1132254834.6350.19.camel@bauerbob.hirsch.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132254834.6350.19.camel@bauerbob.hirsch.lan>
Sender: t.hirsch@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Me again,

meanwhile I've applied this patch to my 2.6.14-mm2 (gentoo):

ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-mm2-1.patch.gz

...and I've got to say: THANK YOU! This patch has cured my slow system,
everything's running normal again. Everything? Well, I'm not so sure
about the result of the earthworm-test:

$ strace -T -e sync,fsync ./a.out
sync()                                  = 0 <70.050916>
fsync(3)                                = 0 <0.232150>

Looks like a new world record of slowness. :-(

Thorsten

