From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 25 Nov 2002 17:48:46 +0300
Message-ID: <20021125174846.A31778@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021125143634.GC9006@mail.cekit.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mira Temp?r <mira@cekit.cz>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Nov 25, 2002 at 03:36:34PM +0100, Mira Temp?r wrote:

> my setup:
> linux 2.4.18 SMP, HW RAID5, nearly full 240GB reiserfs of mostly small files,
> reiserprogs 3.6.4.
> With advice to run --rebuild-tree.
> But after 16 hours of running it, it is still on 0% and whole process 
> would take about 1 month to complete (started at 2000 blocks/sec, 
> but now running at 26b/s).

This is very strange, We've seen reports of reiserfsck --rebuild-tree
of 500Gb volume (filled to 170Gb) finished in 8 hours.

Can you please verify that the read speed of your RAID5 is constant in all
the areas of disk, that it is not opearting in some kind of degraded mode
and is generally in good state?
What is the ARID5 hardware you are using?

> My question is: is there any way how to speed up filesystem restore?
> I still believe, that problem is not in hardware and data is recoverable.

Data is recoverable for sure, but the speed degradation you are seeing 
is strange and I do not yet think it should be attributed to reiserfsck.

Bye,
    Oleg
