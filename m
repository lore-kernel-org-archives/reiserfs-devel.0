From: Oleg Drokin <green@namesys.com>
Subject: Re: is this a known bug?
Date: Thu, 24 Jul 2003 19:05:48 +0400
Message-ID: <20030724150548.GA21786@namesys.com>
References: <20030723235435.3C63E9C91@mail.animeslovenija.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030723235435.3C63E9C91@mail.animeslovenija.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pegasus@nerv.eu.org
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Hello!

On Thu, Jul 24, 2003 at 01:54:35AM +0200, pegasus@nerv.eu.org wrote:
> [usb-ohci:sohci_device_operations+781321/95136603] .LC62 [reiserfs] 0xc3
> Jul 14 13:25:41 mai-stor2 kernel: Call Trace: [<f8a456d5>] .LC62 [reiserfs] 0xc3
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a3ad1e>] journal_mark_dirty [reiserfs] 0x13e
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a43d60>] .LC93 [reiserfs] 0x27a0
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a1f100>] reiserfs_free_block [reiserfs] 0xa0
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a34bb0>] prepare_for_delete_or_cut
> [reiserfs] 0x760
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a22417>] free_thrown [reiserfs] 0x57
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a22689>] do_balance [reiserfs] 0xe9
> Jul 14 13:25:41 mai-stor2 kernel: [<f8a356ca>] reiserfs_cut_from_item [reiserfs]

Yes, I know this one. It is journal overflow we fixed in 2.4.21 or thereabout.
If you use reiserfs, you really do not want to depend on RedHat's 2.4.9 kernel,
you'd better get some recent stuff (or talk us into backporting fixes to 2.4.9?
that might work if you have enough money ;) )

Bye,
    Oleg
