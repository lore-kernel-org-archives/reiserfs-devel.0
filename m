From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Thu, 25 Mar 2004 15:55:09 +0300
Message-ID: <1080219309.1976.304.camel@tribesman.namesys.com>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
	 <1080213348.1976.277.camel@tribesman.namesys.com>
	 <20040325221423.6296bc84.a.nielsen@optushome.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040325221423.6296bc84.a.nielsen@optushome.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Nielsen <a.nielsen@optushome.com.au>
Cc: reiserfs-list@namesys.com

Hello


On Thu, 2004-03-25 at 15:14, Adam Nielsen wrote:
> Hi,
> 
> Thanks for your reply!
> 
> > Is sda1 your root filesystem?
> > For the beginning you should boot without mounting it and reiserfsck
> > it
> 
> Yes, it's the only partition (apart from sda2 which is swap.)  I've done
> some more fiddling around with it, and I'm starting to think that
> perhaps after all it's not ReiserFS.  I disconnected and reconnected the
> SATA cable, and suddenly it got past that point where it locked up
> before. Now I can mostly read data off the drive fine, but I still
> can't boot from it.  Lilo only gets as far as "LIL", and when booting
> the kernel over the network it seems to run fine until I try reading
> from /boot/bzImage where most of the time it will cause the hard lockup.
> 
> So I'm not sure whether it's ReiserFS "crashing" when it can't read the
> data, the sil3112 module misbehaving, or a physical hardware problem
> (which seemed unlikely until wiggling the SATA cable helped...!)  I
> would've assumed though, that a loose SATA cable would cause the drive
> to either work or not work - but working fine except for booting and
> reading certain files seems a little weird (it also locked up when I
> loaded X11.)
> 
> Any more ideas?  I don't really know what to do next...!
> 

You should boot off not using /dev/sda1 and reiserfsck it

> Thanks,
> Adam.
> (please CC replies)
> 

