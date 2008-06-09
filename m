From: Ralf Gross <Ralf-Lists@ralfgross.de>
Subject: Re: warning: is_tree_node: node level 56362 does not match to the expected one 1
Date: Mon, 9 Jun 2008 09:29:09 +0200
Message-ID: <20080609072909.GA22951@p15145560.pureserver.info>
References: <20080608174322.GC19640@p15145560.pureserver.info> <484C4736.3080103@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <484C4736.3080103@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Edward Shishkin schrieb:
> > Last Friday a backup server running backuppc crashed and did not
> > respond to pings anymore. I logged in using the IPMI management card
> > and found this (sorry I couldn't scroll up or get the output from any
> > logfile):
> >
> > http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console.png
> >   
> 
> There is no useful info here..
> 
> I also don't have successful experience with such remote consoles:
> It doesn't fit a stacktrace. Desperate attempts to parse packets with
> ngrep didn't' t lead to happy end..

Maybe I should use netconsole on my servers, but as the server was not
responding to ping packets, I doubt it would have been a big help.
 
> > Next I reset the system and booted. But I couldn't boot the system to
> > the login prompt. Many reiserfs warnings appeared.
> >
> > To start reiserfsck I booted grml from CD. The first run with the
> > check option resulted in errors and I restarted reiserfsck with the
> > --rebuilt-tree option which complained after 40% about a possible
> > harware problems.
> >
> > http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console-1.png
> >
> > With the rescue CD I could also take a look at the system logfiles
> > from the time of the crash:
> >
> >   
> 
> olala... it definitely seems like hardware problems..

But I can't find any hardware problems for the last 2 days.
 
> > Jun  5 21:59:20 server -- MARK --
> > Jun  5 22:05:54 server kernel: ReiserFS: warning: is_tree_node: node level 56362 does not match to the expected one 1
> > Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514510379. Fsck?
> > Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
> >   
> [...]
> > Hardware:
> >
> > Supermicro Mainboard
> > C2D CPU
> > 4 GB ECC RAM
> > Areca SATA RAID Controller
> >
> > The system was running as backuppc server for 18 months without
> > problems. No power failure or other harware problems were detected
> > before the fail.
> >
> > Since Friday I've been running memtest86+ (20 passes, app. 25 hours),
> > prime95 and badblocks. No problems so far.
> >
> >   
> 
> Did you check all your hard drives with badblocks after the crash?

Not one by one, but the 3 raid volume sets (sdc, sdd and sde). No bad
blocks were found (non destructiv badblock test of course). I also
used the "Check Volume Set" option of the Arcea controller. 
 
> If yes, then try to build and check the same configuration with the
> same hard drives on another box. No more ideas.

Moving the disks to another server is not possible I fear.


Ralf
