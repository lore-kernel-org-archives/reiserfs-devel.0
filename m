From: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Subject: Re: 2.6.0-test4 reiserfs oops
Date: Tue, 26 Aug 2003 11:46:47 +0000
Message-ID: <200308261146.47241.l.allegrucci@tiscali.it>
References: <200308252047.36054.l.allegrucci@tiscali.it> <20030826083244.GC5816@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826083244.GC5816@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Tuesday 26 August 2003 08:32, Oleg Drokin wrote:
> Hello!
>
> On Mon, Aug 25, 2003 at 08:47:36PM +0000, Lorenzo Allegrucci wrote:
> > I have got this oops running fsstress and fsx-linux
> > on a 20Gb reiserfs partition.  Fully reproducible.
>
> What are the options to fsx and fsstress?

fsx-linux linux-2.5.0.tar.bz2 :)
mkdir d
fsstress -d d -n 1000000 -p 10

The oops follows immediately.

> Also I immediately see a place that can lead to an oops you quoted,
> can you try to run with the patch attached and see if the oops go away?

The oops goes away but fsx-linux hangs in "D" state.

