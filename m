From: Chris Worley <chrisw@lnxi.com>
Subject: Re: 2GB limit won't go away
Date: 09 Jun 2002 09:13:22 -0600
Message-ID: <1023635603.5057.10.camel@localhost.localdomain>
References: <1023708533.4654.301.camel@xserver> 
	<3D033CC6.70707@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D033CC6.70707@neuronet.pitt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I do have the line:

	/dev/worley/newsys  / reiserfs  conv,defaults 1  1

in my /etc/fstab (and reboot); it doesn't help.  Running:

	# dd if=/dev/zero of=./temp bs=1024 count=5242880

returns:

	dd: writing `./temp': File too large
	2097153+0 records in
	2097152+0 records out

Note that I am using SuSE's hybrid kernel that's shipped w/ 7.3.  I've
seen some messages say this might be the cause of the problem.

Thanks,

Chris
On Sun, 2002-06-09 at 05:32, Rafael E. Herrera wrote:
> Chris Worley wrote:
> > I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
> > (using 3.5.x disk format...ReiserFS version 3.6.25) atop
> > lvm-1.0.0.2_rc2-6.  I believe I upgraded reiserfs after a disk crash
> > last xmas (with a few remnants of that catastrophe still in the system).
> > 
> > I try to "mount -o remount,conv" and put "conv" in the options section
> > for the root partition in the /etcfstab file.
> > 
> > But,  I can't create a file greater than 2GB.
> > 
> > What am I doing wrong?  I'd really like to accomplish this without
> > changing lvm or my kernel.
> 
> Use a line similar to this:
> 
> /dev/hdc5       /       reiserfs        defaults,conv 1 2
> 
> Or simply, boot in rescue mode and mount your partition with "mount -o 
> conv".
> 
> -- 
>       Rafael
> 


