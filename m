From: Ookhoi <ookhoi@humilis.net>
Subject: Re: reiser4 and 2.5.60
Date: Tue, 18 Feb 2003 10:52:47 +0100
Message-ID: <20030218105247.D20771@humilis>
References: <20030215160033.A3570@humilis> <20030218121257.A27125@namesys.com> <20030218103151.B19634@humilis> <20030218124236.A31148@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030218124236.A31148@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, reiserfs-list@namesys.com

Oleg Drokin wrote (ao):
> On Tue, Feb 18, 2003 at 10:31:51AM +0100, Ookhoi wrote:
> > Sure. It is a P-MMX, 200MHz, with 512MB ram, and a 4GB scsi disk.
> 
> Hm. That must be real slow, is it? (just because not all of the RAM is
> covered by L2 cache, I mean. Or do you have some sensible chipset in
> there?).

It is slow, but I am not aware of issues with too little L2 cache. A
quick look at dmesg didn't give me more clue. Can you please explain a
bit, or give some google keywords?

It is only 200MHz, so I expect it to be slow, but if I can make it
faster that would be nice (without removing the ram if possible ;-)

> > As said before, I do reiser4 on a loop fs. I did the same with
> > reiser3, and that worked ok. Could the loop fs be a problem for
> > reiser4?
> 
> Well, it should not, but if you can test it not on loop device just to
> be sure, that would be nice.

I see if I can free a partition, or put an extra disk in.

> > Do you need more info, or want me to test things?
> 
> I need to experiment a bit more locallywith info I got from you, I
> think.
> 
> > It seems that reiser4 in BK is not updated for a few days now.
> 
> <joke>Because it is already perfect, nothing to improve</joke> ;)

Goody :-)  Well, let me know if you want me to test something. I'll let
you know what happens with reiser4 on a partition.
