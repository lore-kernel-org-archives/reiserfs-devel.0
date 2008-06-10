From: Ralf Gross <Ralf-Lists@ralfgross.de>
Subject: Re: warning: is_tree_node: node level 56362 does not match to the expected one 1
Date: Tue, 10 Jun 2008 13:01:20 +0200
Message-ID: <20080610110119.GC22951@p15145560.pureserver.info>
References: <20080608174322.GC19640@p15145560.pureserver.info> <484C4736.3080103@gmail.com> <20080609072909.GA22951@p15145560.pureserver.info> <484DA03D.5060207@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <484DA03D.5060207@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Edward Shishkin schrieb:
> Ralf Gross wrote:
> > Edward Shishkin schrieb:
> >>>
> >>> http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console-1.png
> >>>
> >>> With the rescue CD I could also take a look at the system logfiles
> >>> from the time of the crash:
> >>>
> >>>   
> >>>       
> >> olala... it definitely seems like hardware problems..
> >>     
> >
> > But I can't find any hardware problems for the last 2 days.
> >  
> >   
> 
> How did you test it?
> Were relevant controllers, cables, etc. involved?

I didn't check the cables or opened the chassis. But neither memtest
nor badblocks found anything interesting. 

> [...]
> >> If yes, then try to build and check the same configuration with the
> >> same hard drives on another box. No more ideas.
> >>     
> >
> > Moving the disks to another server is not possible I fear.
> >   
> 
> How much space is occupied on dm-0? (df -h)

~ 1 TB.

Anyway, I couldn't wait any longer to get the system online again. So
I started from scratch and created one new raid volume (instead of 3)
and don't use lvm anymore. As the controller has the ability to expand
raid volumes, I won't need lvm.

Next I'll fill the filesystem and calculate the md5sums for a couple
of times. If this doesn't shows any problems, I *hope* that I can
trust the hardware.  

Any other ideas? Is there a tool that does the above thing (fill a fs
and check the md5sums x times)?

Ralf
