From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: Tuning reiserfs
Date: Mon, 29 Mar 2004 15:17:37 +0200
Message-ID: <200403291517.37540.chrivers@iversen-net.dk>
References: <200403280055.10474.chrivers@iversen-net.dk> <1080563749.16246.42.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080563749.16246.42.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Monday 29 March 2004 14:35, you wrote:
> Hello
>
> On Sun, 2004-03-28 at 03:55, Christian Iversen wrote:
> > Hello all.
> >
> > I'm a happy user of reiserfs, which I find stable and fast.
> >
> > However, I'm curious as the wether reiserfs can be tuned to be even
> > faster in my situation.
> >
> > Nearly all files on my volume can be divided into two categories. Files
> > in the 5-10 MB range, and files in the 200-500 MB range.
> >
> > Especially "ls -l" on directories with many 200-500 MB files takes a
> > relatively "long" time (severeal seconds).
>
> I am afraid there is nothing you can easily do to fix this. For the
> fileset like yours reiserfs has to read one block to stat one file.
> So, to ls -l 10000 files - 10000 blocks is to be read.

But that's exactly the point. There aren't nearly 10000 files, closer to 200. 
It seems that 200 2-500 MB files take about the same time to stat as many 
more (i.e. 10000) small files. 

Do large files take a longer time to stat, or is it something else?

In any case, I'm very happy with reiserfs. Thanks for you help :)

-- 
Regards,
Christian Iversen
