From: David Swift <dswift@tdl.com>
Subject: Re: Re: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Tue, 31 Jan 2006 06:58:04 -0800
Message-ID: <1138719484.43df7afccbab0@tdl.com>
References: <E1F3vw4-0007bn-7V@www5.emo.freenet-rz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E1F3vw4-0007bn-7V@www5.emo.freenet-rz.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: abc1237@freenet.de
Cc: reiserfs-list@namesys.com

Hi all,

I've had brand new drives fail the moment power was applied - sometimes even the
best just get a bad drive through.

You could try using smartmontools to non-destructively find out what the drive
thinks of itself - a blog entry describing one person's adventures with these
tools is here: http://scottstuff.net/blog/articles/tag/drive

Good luck, I hope this gives you some useful information.

David


Quoting abc1237@freenet.de:

>  	
> 
> Hi,
> I don't think that this is an error of the Disc, because I have a brand new
> Harddisk (2 day's old).
> 
> greets
> ----- original Nachricht --------
> 
> Betreff: Re: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
> Gesendet: Di 31 Jan 2006 04:18:49 CET
> Von: "Clay Barnes"<clay.barnes@gmail.com>
> 
> > To amplify what Hans (accurately) wrote, once you see bad sectors, that 
> > means that you already have many more than you see, and that your hard 
> > drive is all out of spare sectors to silently swap out for when it finds 
> > one.
> > 
> > Basically, there's so much wrong with the surface that your hard drive 
> > can't hide any more flaws, and has given up trying.
> > 
> > Hans is right:  If you see a single bad sector, the drive is considered 
> > unsafe and trash for even the tightest owner.
> > 
> > --Clay
> > 
> > Hans Reiser wrote:
> > > Wow, are we at last actually stable enough that hardware errors are more
> > > of a problem than software errors for our Reiser4 users?
> > >
> > > Rudekjan, you have a bad sector, buy a new drive, use dd_rescue to copy
> > > to it, don't run reiser4.fsck until you get the data onto the new
> > > drive.  Why buy a new drive?  Because after the first user visible bad
> > > sector, your odds of more bad sectors over time go WAY up.  Your
> > > time+data are too valuable.....
> > >
> > > Hans
> > >
> > > rudekjan@freenet.de wrote:
> > >
> > >   
> > >> i'm again... here are some more informations. i haven't encrypted my
> data
> > and the error above the reiser4 panic is:
> > >>
> > >> end_request: I/O error, dev sdb, sector 64412
> > >>
> > >> hope thats help finding the bug
> > >>
> > >> greets
> > >>
> > >> Jan
> > >>
> > >> ----- weitergeleitete Nachricht ---------
> > >>
> > >>
> > >> Subject: Re: 2.6.15.1+reiser4 Kernel Panic
> > >> Date: Di 31 Jan 2006 01:49:38 CET
> > >> From: rudekjan@freenet.de
> > >>
> > >>  
> > >>
> > >>     
> > >>> Hi,
> > >>> i have the same Problem witch 2.6.16-rc1 with the reiser4 Patch from
> > >>> ftp.namesys.com.
> > >>> Same error and the System is frozen to. But I wanted to copy data from
> > >>> Partition A (Reiser3) to Partition B (Reiser4).
> > >>>
> > >>> greets
> > >>>
> > >>> Jan
> > >>>
> > >>> From: "Vladimir V. Saveliev" <vs@namesys.com>
> > >>>        To: Ps <Ps_Mail@freenet.de>
> > >>>        Date: Mon, 30 Jan 2006 11:29:18 +0300
> > >>>        Subject: Re: 2.6.15.1+reiser4 Kernel Panic
> > >>>        Hello
> > >>>        
> > >>>        On Sun, 2006-01-29 at 11:44 +0100, Ps wrote:
> > >>>        > Hi,
> > >>>        >
> > >>>        > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch
> > from
> > >>>        > ftp.namesys.com, when writing data to a usb harddisk.
> > >>>        >
> > >>>        > kernel output:
> > >>>        > loop4: loop_end_io_transfer err=-95 bi_rw=0x5 
> > >>>        > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> > >>> commit_current_atom
> > >>>        > (fs/reiser4/txnmgr.c:1130)[zam-597]
> > >>>        > write log failed (-5)
> > >>>        >
> > >>>        > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> > >>> commit_current_atom 
> > >>>        > (fs/reiser4/txnmgr.c:1130)[zam-597]
> > >>>        > write log failed (-5)
> > >>>        >
> > >>>        > and the machine is *frozen*
> > >>>        >
> > >>>        > the harddisk is encrypted via loop-aes v3.1c (loop4). i think
> > it's
> > >>> a
> > >>>        > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel
> > <2.6.15
> > >>> is
> > >>>        > running quite perfekt. fsck.reiser4 1.0.5 says the filesystem
> > is
> > >>> clear.
> > >>>        >
> > >>>        
> > >>>        can you reproduce the problem?
> > >>>        
> > >>>        > Best Regards,
> > >>>        > Patrick 
> > >>>        >
> > >>>        >
> > >>>        
> > >>>
> > >>>
> > >>>
> > >>> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> > >>> www.klarmobil.de/index.html?pid=73025
> > >>>
> > >>>
> > >>>    
> > >>>
> > >>>       
> > >>
> > >> ---- weitergeleitete Nachricht Ende ----
> > >>
> > >>
> > >>
> > >>
> > >> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> > >> www.klarmobil.de/index.html?pid=73025
> > >>
> > >>
> > >>
> > >>  
> > >>
> > >>     
> > >
> > >
> > >   
> > 
> > 
> 
> --- original Nachricht Ende ----
> 
> 
> 
> 
> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> www.klarmobil.de/index.html?pid=73025
> 
> 




-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
