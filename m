From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Filesystem errors
Date: Wed, 17 Jul 2002 08:11:44 -0400
Message-ID: <200207170811.44229.kuba@mareimbrium.org>
References: <200207160146.01440.cabernet@internode.on.net> <200207171736.44485.cabernet@internode.on.net> <20020717121056.A12081@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020717121056.A12081@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Wed, Jul 17, 2002 at 05:36:44PM +0930, Brian Marr wrote:
> > Thanks for your comments. My system is still going under my watchful eye.
> > I tried to copy the data using tar to a spare diskl
> > tar -cplf - -C /myhardrive . | tar -xpvf -
> > but this did not go far. I wonder if I could boot into rescue and do  a
> > dd ? I have not used this before.
>
> use dd_rescue tool, conventional dd is not working very good with
> broken hard disks.

Better yet, buy sprinrite (www.grc.com). It's an absolutely great tool, and 
more than worth the money. Although it doesn't handle out-of-place (i.e. data 
moving) recovery on non-fat filesystems, it can diagnose your disk and try 
recovering in-place. It uses quite advanced data recovery methods. It goes 
about as far as you can go without taking the hard drive out and plugging it 
into specialized hardware.

Did I mention that spinrite was about 100kb in size and written in assembler?

Cheers, Kuba Ober
