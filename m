From: Oleg Drokin <green@namesys.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 17:26:12 +0400
Message-ID: <20020711172612.A2740@namesys.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com> <20020711170537.A2611@namesys.com> <004901c228dd$f01fe220$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <004901c228dd$f01fe220$0e01a8c0@englishbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian <brian@english-bay.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 11, 2002 at 06:21:59AM -0700, Brian wrote:

> >    Have you tried specifying explicit -t reiserfs parameter?
> Yes.
> It reports the usual "mount" errors for wrong filesystem mount parameters.

Hm.

> 'mount -t auto /dev/hdc2 /arch" always mounts as an ext3 filesysstem.

Ok, so you run reiserfsck (with what options?) and it told you what?
So that you decided everything was restored.
Have you rebooted after ratitioning scheme change?

Bye,
    Oleg
