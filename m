From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 06 Dec 2004 16:04:54 +0300
Message-ID: <1102338274.1652.63.camel@tribesman.namesys.com>
References: <41B38E30.3060308@inter.net.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41B38E30.3060308@inter.net.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Omry Yadan <omry_y@inter.net.il>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello

On Mon, 2004-12-06 at 01:39, Omry Yadan wrote:
> I have a partial image of a reiserfs partition which takes up all the 
> space on the (reiserfs) parition it sits on.
> there are 0 bytes free on that partition.
> the image was created with dd, and I ran out space when creating it.
> when I try to run
> reiserfsck --rebuild-sb backup.img
> I get the error
> bwrite: write 4096 bytes returned -1 (block=16, dev=3): No space left on 
> device
> 
> does that make sense?
> 
Yes. That means that you have hit reiserfsck bug. Vitaly will contact
with you soon.


>      Omry.
> 



