From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 25 Nov 2002 18:44:33 +0300
Message-ID: <20021125184433.A32129@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz> <20021125174846.A31778@namesys.com> <20021125153154.GA19254@mail.cekit.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021125153154.GA19254@mail.cekit.cz>
Resent-To: reiserfs-list@namesys.com
Resent-Message-Id: <20021125154708.CBF6D2FD004@angband.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mira Temp?r <mira-list@cekit.cz>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Nov 25, 2002 at 04:31:54PM +0100, Mira Temp?r wrote:

> Oleg Drokin - 25/11/02 17:48 napsal:
> | > But after 16 hours of running it, it is still on 0% and whole process 
> | > would take about 1 month to complete (started at 2000 blocks/sec, 
> | > but now running at 26b/s).
> | This is very strange, We've seen reports of reiserfsck --rebuild-tree
> | of 500Gb volume (filled to 170Gb) finished in 8 hours.
> Can be the speed affected with high usage of FS (about 99%)? 

Not at this stage at least. How much RAM do you have?

> One point that I've missed in previous e-mail: during rebuild-tree,
> there is a lot of messages in log like this:
> pass0: vpf-10700: block 1615323, item 6: The item with wrong offset or
> length found [9532827 9534032 0x3001 DRCT (2)], len 1000 - deleted

This is pretty strange thing indeed. File tail beyond border that is allowed.
I do not know how it might have happen.

> | Can you please verify that the read speed of your RAID5 is constant in all
> | the areas of disk, that it is not opearting in some kind of degraded mode
> | and is generally in good state?
> raid is reporting to be ok, data read speed are almost the same at
> various places:
> 0:03.80elapsed 18%CPU
> 0:02.97elapsed 19%CPU
> 0:01.76elapsed 24%CPU
> 0:01.51elapsed 36%CPU
> ... (dd reading 40MBytes)

BTW, what is the CPU usage when the speed is degraded?
(have you already interrupted reiserfsck process? if not then attach to it with
gd and obtain a pair of stacktraces for us please.)

Bye,
    Oleg

