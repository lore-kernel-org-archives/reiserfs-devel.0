From: Chris Mason <mason@suse.com>
Subject: Re: new block allocator for 2.4.18
Date: 11 Apr 2002 09:39:42 -0400
Message-ID: <1018532382.28340.93.camel@tiny>
References: <20020411173101.A1150@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020411173101.A1150@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, jeffm@suse.com

On Thu, 2002-04-11 at 09:31, Oleg Drokin wrote:
> Hello!
> 
>    Hans thinks it is about the time to release new bitmap allocator, I was
>    working with for some time (and which I originally inherited from zam).

I think Hans is right.  From the description, this code has what we need
to help reduce fragmentation over time and the skip_busy option should
cut down on CPU usage as the FS gets full.

It would be great if everyone with experimental machines could give this
a try and help find the best option for their workload. I know I will
(but I'll start by reading it ;-).

Jeff, do you still have those fragmentation measuring tools?

-chris


