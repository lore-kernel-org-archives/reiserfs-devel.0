From: Oleg Drokin <green@namesys.com>
Subject: Re: Large Partition Performance Test
Date: Fri, 12 Apr 2002 17:32:49 +0400
Message-ID: <20020412173249.B23772@namesys.com>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com> <20020411234316.A3749@namesys.com> <20020411202856.GA26083@matrix.wg> <1018563083.14483.100.camel@tiny> <20020412134116.B21820@namesys.com> <1018617682.14429.119.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1018617682.14429.119.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Dirk Mueller <dmuell@gmx.net>, reiserfs-list@namesys.com

Hello!

On Fri, Apr 12, 2002 at 09:21:22AM -0400, Chris Mason wrote:
> > Even withoyt skip_busy mode it will work much better.
> > The problem is on each file creation we start to look for a free block almost
> > from the beginning of disk. using no_unhashed_relocation mount option,
> > we make initial block allocation to be more random and cause less overhead
> > (verified).
> > And in this test we create a lot of 15k files.
> Ok, I'll buy that.  The only way to know for sure is to give it a try or

OF course you'll buy that, because my suggested workaround worked ;)

> profile the run, but I think it is very likely to be allocator related.

First I decided I need a profile run, but once I realised how small created
files are, and looked on the on-disk block distribution chart.
Then I remembered on what basis we choose 1st block of a file to be allocated,
and I realised I do not need profile run ;)

In fact I am interested in similar task performance of ext3, since I've yet
to try it.

Bye,
    Oleg
