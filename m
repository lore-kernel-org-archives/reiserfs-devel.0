From: jenn sirp <sirp1@llnl.gov>
Subject: Re: repost for readdir
Date: 24 Jun 2004 12:28:40 -0700
Message-ID: <1088105320.2573.35.camel@murdock.llnl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> 
> Do you mean readdir library function? It reads directory and fills 
> dirent structures. It does not sort anything. It even does not stat 
> files names of which it reads.

My project here was to alter reiserFS for automatic file queueing. When
files are written their names are automatically placed in a linked list
-- or queue in FIFO or LIFO order. A call to ioctl will return the next
file from the queue. This works for directories too.(every dir has it's
own set of queues). These queues, or lists, reflect the state that the
files are in i.e. enqueued, processing, error, etc.. Every time a file
is written in with a certain prefix the queues for that directory are
updated accordingly.

The purpose behind this type of system is to speed up file processing on
a server that receives queries and sends requests onto a database to be
processed.

I thought that Hans had mentioned that he would accept a readdir plug-in
for Reiser4. I took this to mean the reiserfs_readdir function. But
perhaps I misunderstood. 

Thanks so much,

Jenn



