From: Oleg Drokin <green@namesys.com>
Subject: Re: speedup patch for 2.4.18
Date: Wed, 10 Apr 2002 14:16:26 +0400
Message-ID: <20020410141626.A20325@namesys.com>
References: <OFA80C1538.200FD8A8-ONC1256B97.00374308@ev-i.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFA80C1538.200FD8A8-ONC1256B97.00374308@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Apr 10, 2002 at 12:08:00PM +0200, wolfgang.glas@ev-i.at wrote:

>    I've appplied the patches. Could you just explain in some words, what 
> are the biggest changes vs. the original code ? For which things should we 
> look out (big files ? concurrent access via many processes ? NFS 
> interaction ? )

Ok. Basically read speed for big files on IDE (and other devices
with dumb/non-existing) cache is increased in 15% or thereabout.
Write speed is increased due to corrected journal behaviour,
so now we do not write to a log several times a second which gives us quite a
speedup, too.
Due to increased write speed, slmost all fs operations got some boost, too ;)

> I'll give the patches a chance on our questionable server with the Netgear 
> 1GBit network adapter, if the patches turn out to be harmless on my 
> desktop and the feedback on this list is positive ;-)

Since you have indicated problems on your server are persistent on ext3 too,
I believe it is hardware problem of some kind (and I cannot reproduce it, too)
and this patch will give no impact on it most probably.

Bye,
    Oleg
