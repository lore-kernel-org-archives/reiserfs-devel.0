From: Edward Shishkin <edward@namesys.com>
Subject: Re: Crypto(compress) plugin stability
Date: Thu, 12 Aug 2004 23:02:50 -0700
Message-ID: <200408122302.51432.edward@namesys.com>
References: <87isbogqfs.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87isbogqfs.fsf@barad-dur.crans.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Segaud <matt@minas-morgul.org>, reiserfs-list@namesys.com

On Thursday 12 August 2004 11:29, Mathieu Segaud wrote:
> Hi !
>
> I've got a question about Reiser4 encryption ? Is it stable enough to run
> other things than test run or benchmarks ? :)
>

Not yet. 
Currently we are working on fast compression support. 
Hans wants benchmark results for main operations (which actually
promise to be interesting). Then we'll concentrate on cipher support
and stability.
Edward.

> I'm curently running my desktop box with several partitions encrypted thru
> dm-crypt. I know pros of Reiser4, which are: encryption at flush time,
> selection of files to be encrypted, speed of Reiser4 :)
> But are there problems with this plugin ? Is it stable enough to be
> trustworthy ? (I'm used to living on the bleeding edge, with my linux
> boxes)
>
> I'm willing to switch but do I risk serious damages to my system :))) ?
> (I know I do, but I do not stress it a lot)
>
> Regards

