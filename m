From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Re: BUG in Reiserfs Journal Thread
Date: Wed, 15 Sep 2004 15:17:48 -0500
Message-ID: <d68fdf7d040915131740e95788@mail.gmail.com>
References: <d68fdf7d04091513021adcd9c7@mail.gmail.com>
	 <1095278836.10543.15.camel@watt.suse.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1095278836.10543.15.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, vijayan@cs.wisc.edu

I'm using reiserfs 3.6 with the data journaling patch from
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/.


On Wed, 15 Sep 2004 16:07:16 -0400, Chris Mason <mason@suse.com> wrote:
> On Wed, 2004-09-15 at 16:02, Vijayan Prabhakaran wrote:
> > Dear Chris Mason,
> >
> > I found a bug in Reiserfs journal thread. This bug is in function
> > reiserfs_journal_commit_thread().
> 
> Hi,
> 
> Which version of the code are you reading?
> 
> -chris
> 
>
