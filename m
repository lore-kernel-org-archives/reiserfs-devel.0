From: Ps <Ps_Mail@freenet.de>
Subject: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Tue, 31 Jan 2006 12:54:19 +0000
Message-ID: <1138712060.6731.12.camel@ps-laptop.network.ps>
References: <1138531447.7245.18.camel@ps.network.ps>
	 <1138609758.6309.52.camel@tribesman.namesys.com>
	 <1138619502.11876.2.camel@ps-laptop.network.ps>
	 <1138619214.6309.86.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138619214.6309.86.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

so after i've forgot to include the list, the message again + a view new
lines

Am Montag, den 30.01.2006, 14:06 +0300 schrieb Vladimir V. Saveliev:
> Hello
> 
> On Mon, 2006-01-30 at 11:11 +0000, Ps wrote:
> > Am Montag, den 30.01.2006, 11:29 +0300 schrieb Vladimir V. Saveliev:
> > > Hello
> > > 
> > > On Sun, 2006-01-29 at 11:44 +0100, Ps wrote:
> > > > Hi,
> > > > 
> > > > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch from
> > > > ftp.namesys.com, when writing data to a usb harddisk.
> > > > 
> > > > kernel output:
> > > > loop4: loop_end_io_transfer err=-95 bi_rw=0x5
> > > > reiser4 panicked cowardly: reiser4[pdflush(6748)]: commit_current_atom
> > > > (fs/reiser4/txnmgr.c:1130)[zam-597]
> > > > write log failed (-5)
> > > > 
> > > > reiser4 panicked cowardly: reiser4[pdflush(6748)]: commit_current_atom
> > > > (fs/reiser4/txnmgr.c:1130)[zam-597]
> > > > write log failed (-5)
> > > > 
> > > > and the machine is *frozen*
> > > > 
> > > > the harddisk is encrypted via loop-aes v3.1c (loop4). i think it's a
> > > > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel <2.6.15 is
> > > > running quite perfekt. fsck.reiser4 1.0.5 says the filesystem is clear.
> > > > 
> > > 
> > > can you reproduce the problem?
> > Yes, everytime i write on this partition (ok i've only testet a view files, but when i delete one file and it syncs, it always crashes. deleting with kernel 2.6.13.4 and loop-aes 3.1c makes no problem)
> > 
> 
> May I ask you to try this if filesystem is ext2, please?
no chance at the moment, I don't have enough free discspace for testing.
but maybe i get tomorrow a temporary disk for copying data on. if it
help's the root on laptop runs without an error (also encrypted), but
the root on the desktop has the same problem and doesn't boot (wenn
bootlogd tries to write data it hangs) :-/

then I've got another machine (i386, the laptop and desktop are x86_64)
which has an reiserfs 3.6 on the loop => runs also without a warning or
crash. (with 2.6.15.2)

a harddisk problem like on jan's machine is nearly impossible, because
it runs perfekt with the 2.6.13 kernel and the desktop relies on an
raid5, so a bad sector should be reported in the raid status (smart
status also good)

has anyone an idea what I could check?

> > > > Best Regards,
> > > > Patrick
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

