From: Edward Shishkin <edward@namesys.com>
Subject: Re: back up to disk
Date: Wed, 16 Oct 2002 21:29:09 +0400
Sender: edward
Message-ID: <3DADA1E5.4A5CB158@namesys.com>
References: <20021016021558.79A2E1AEC1B9@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: Hans Reiser <reiser@namesys.com>, Russell Coker <bofh@coker.com.au>, ReiserFS List <reiserfs-list@namesys.com>, webmaster@www.mikerubel.org

JP Howard wrote:
> 
> On Wed, 16 Oct 2002 05:15:33 +0400, "Hans Reiser" <reiser@namesys.com>
> said:
> > JP Howard wrote:
> >
> > >We've been thinking about something like that, using this extremely nifty
> > >trick:
> > >
> > >http://www.mikerubel.org/computers/rsync_snapshots/
> > >
> > This is brilliantly simple.
> >
> I thought so too. I'm cc'ing the author so he can bask in the glory...
> ;-)
> > >
> > >Back in the old days (i.e. last week) when we were planning around Ext3,
> > >we were thinking of combining it with this product:
> > >
> > >http://www.shaolinmicro.com/product/cogofs/index.php
> > >
> > This looks reasonable as a product, and not unreasonably expensive for
> > servers.   There are some advantages to tight integration though, in
> > that you can compress at flush time.
> >
> Yes indeed. And I haven't seen this product used anywhere--I don't know
> how reliable it is. It's binary-only, which I don't like, and you have to
> get a version for your particular kernel (and really, who uses stock
> kernels?...)
> > >
> > >The two combined, with ATA RAID, provide fast, redundent, incremental,
> > >compressed backups.
> > >
> > >Does ReiserFS support transparent compression?
> > >
> > This is one of the features that won't make the Halloween deadline, but
> > might be slipped in later.
> >
> > If not, are there any
> > >plans in this direction? Benchmarks I've seen in the past suggest that
> > >compressed file systems generally improve performance (especially when
> > >using something fast like LZOP) since CPUs are so fast--and of course for
> > >backups being able to store more on fewer disks is nice...
> > >
> > What I had heard was that they generally slowed peformance, but maybe my
> > info is old.
> >
> > CPUs are faster now, and maybe compression algorithms are faster.
> >
> > Can you give more details?
> >
> I'm just passing on anecdotal information, I'm afraid. I can tell you
> that LZOP is *seriously* fast.
>   http://www.oberhumer.com/opensource/lzop/
> 
> Every benchmark I've seen shows it #1 for speed. We see around 50%
> compression ratio on our Cyrus mail store using LZOP compression on our
> backups.

It looks fine, although I expect that file system will produce lower
compression ratio since we can not use too large cluster size as this
algorithm does (256K).

Edward.   

> 
> It's easy enough to construct some simple benchmarks like this:
> ----
> # time zgrep foobar maillog.1.gz
> real    0m6.924s
> user    0m3.140s
> sys     0m0.620s
> 
> # time grep foobar maillog.1
> 
> real    0m19.972s
> user    0m0.290s
> sys     0m0.620s
> ----
> 
> Of course, it depends a lot on the CPU and HDD configuration, and where
> your system is loaded. We always find our IMAP and SMTP servers IO bound,
> with plenty of CPU free. It's very expensive to change from a 5x73GB to a
> 10x36GB config, so buying more IO performance is an expensive
> proposition.
