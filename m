From: Ps <Ps_Mail@freenet.de>
Subject: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Sat, 25 Mar 2006 00:49:20 +0100
Message-ID: <1143244161.17514.0.camel@ps-laptop.network.ps>
References: <1138531447.7245.18.camel@ps.network.ps>
	 <200603241704.34561.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603241704.34561.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

this seems to work...

Am Freitag, den 24.03.2006, 17:04 +0300 schrieb Alexander Zarochentsev:
> Hello,
> 
> On Sunday 29 January 2006 13:44, Ps wrote:
> > Hi,
> >
> > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch from
> > ftp.namesys.com, when writing data to a usb harddisk.
> 
> please try to mount reiser4 volume with "no_write_barrier" option.
> 
> >
> > kernel output:
> > loop4: loop_end_io_transfer err=-95 bi_rw=0x5
> > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> > commit_current_atom (fs/reiser4/txnmgr.c:1130)[zam-597]
> > write log failed (-5)
> >
> > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> > commit_current_atom (fs/reiser4/txnmgr.c:1130)[zam-597]
> > write log failed (-5)
> >
> > and the machine is *frozen*
> >
> > the harddisk is encrypted via loop-aes v3.1c (loop4). i think it's a
> > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel <2.6.15 is
> > running quite perfekt. fsck.reiser4 1.0.5 says the filesystem is
> > clear.
> >
> > Best Regards,
> > Patrick
> 

