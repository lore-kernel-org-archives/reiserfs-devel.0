From: Philip Miller <millenix@zemos.net>
Subject: Re: a hosed reiserfs
Date: Tue, 06 Jul 2004 19:17:00 -0400
Message-ID: <40EB32EC.6070702@zemos.net>
References: <20040625115258.A27445@tux.org> <200406252006.55426.vitaly@namesys.com> <40DC58B7.109@namesys.com> <20040625144523.A5159@tux.org> <40E0595D.8060106@namesys.com> <20040704122021.A25785@tux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040704122021.A25785@tux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruce Israel <israel@tux.org>
Cc: reiserfs-list@namesys.com

Bruce Israel wrote:
> [snip]
> I've tried running dd_rescue to copy the partition over; I've run it both
> forward and reverse.  Whenever I run it, it copies for a while and then
> hangs my system (Linux 2.6.5-gentoo-r1; also hangs a 2.6.3 kernel).
> 
> When I say it hangs, I mean that all other shells and virtual consoles are
> non-responsive, and the only thing that works is the reset button on the
> front panel.
> 
> I also tried /sbin/badblocks which hung the sytem as well.
> 
> When I run dd_rescue forward, it copies about 4.5GB (out of 20GB total),
> before hanging, resulting in the following file:
> 
> 4511808 -rw-r-----    1 root     4615569408 Jul  2 23:50 hdf8
> 
> I've also run it forward and then reverse on the same file.  It seems to
> only copy about 20 Meg or so in the reverse direction.  The most recent
> effort resulted in:
> 
> 4520612 -rw-r-----    1 root     20012073984 Jul  4 12:04 hdf8-2
> 
> I've tried giving it starting byte counts of the size (or 1K less), but it
> still hangs, just a lot quicker.  Turning on dd_rescue's logging doesn't
> help; it appears that the system is locked up before anything is either
> written or flushed.
> 
> This is a very slow process since I have to reboot after each time I run
> it. 

Do you, by any chance, run a system based on the nForce2 chipset? On some 
boards, issues with the APIC reliably cause lockups under heavy I/O load, 
such as dd_rescue would create.

If so, try the following:
With kernel version of 2.6.5 or later, try booting with the kernel command 
line argument 'apic_tack=2'.

Philip Miller
