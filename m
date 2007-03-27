From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Why reiser does a disk write on every sync() call?
Date: Tue, 27 Mar 2007 22:54:46 +0400
Message-ID: <200703272254.46500.vs@namesys.com>
References: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lin Shen (lshen)" <lshen@cisco.com>
Cc: reiserfs-list@namesys.com

Hello

On Tuesday 27 March 2007 21:20, Lin Shen (lshen) wrote:
> I saw 32 blocks by calling sync() alone.
> 

iostat used to count sectors which are 512 bytes long. Did you take that into account?

> Lin
> 
> > -----Original Message-----
> > From: Vladimir V. Saveliev [mailto:vs@namesys.com] 
> > Sent: Tuesday, March 27, 2007 1:00 AM
> > To: Lin Shen (lshen)
> > Cc: reiserfs-list@namesys.com
> > Subject: Re: Why reiser does a disk write on every sync() call?
> > 
> > Hello
> > 
> > On Monday 26 March 2007 22:12, Lin Shen (lshen) wrote:
> > > I'm using iostat to measure disk reads/writes associated 
> > with various 
> > > file operations under Reiser. One thing I noticed and can't 
> > explain is 
> > > that every sync() call by itself (not following a write or 
> > anything) 
> > > will cause an I/O write. Any ideas?
> > > 
> > 
> > The I/O write is performed by reiserfs implementation of 
> > sync_fs method of struct super_operations.
> > If filesystem is mounted r/w - reiserfs_sync_fs begins a 
> > transaction (or joins an existing one), journal super block 
> > if the transaction has zero length, closes the transaction 
> > and flushes old transactions including the one which was just 
> > closed. So, if there were no transaction to flush before 
> > sync() - one transaction of length 1 gets created, closed, 
> > committed and flushed. 5 blocks get written to disk in this 
> > case. My calculation can be wrong, though.
> > How much I/O do you notice? 
> > 
> > > Lin
> > > 
> > > 
> > 
> 
> 
