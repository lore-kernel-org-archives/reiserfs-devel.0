From: Oleg Drokin <green@namesys.com>
Subject: Re: EVMS Reiser FSIM
Date: Tue, 4 Jun 2002 19:10:45 +0400
Message-ID: <20020604191045.A10459@namesys.com>
References: <OFF33CCB39.8842A3DF-ON85256BCE.0050E23C@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFF33CCB39.8842A3DF-ON85256BCE.0050E23C@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jun 04, 2002 at 10:02:00AM -0500, Steve Pratt wrote:
 
> >What should I do to get something to appear in the disks/slices/whatever
> >lists so I can play with it?
> I need the kernel log and the Engine log (/var/log/evmsEngine.log) to be
> sure what is going on, but my first guess would be that either you did not
> select all of the right components in the kernel, or if you did that you
> might have built them as modules and not loaded them. Specifically it looks
> like the local device manager is missing.

Hm. Yes, I in fact had everything in modules.
But I have expected evms to load all the stuff its needed once evms main module
is loaded. 
It would be helpful if help entry on EVMS suggest evms might be loaded as
module, but then all of the other evms modules should be loaded by hand.

> We recommend compiling all EVMS runtime plug-in that you plan to use
> directly into your kernel.  It avoid the hassle of dealing with init
> ramdisks and lodaing modules at the right time.  If you are really set on

Since I am not planning to put my root on a EVMS volume yet, I think I can
go with modules setup, I only need to load all the modules, it seems.

> Summary: please verify that at least 'local device manager' and 'DOS
> partition manager' are built statically into the kernel, if not reconfigure
> kernel and retry.  If they are, then send me the kernel and Engine logs and
> I will see what is wrong.

Ok, thank you.  will try that.

Bye,
    Oleg
