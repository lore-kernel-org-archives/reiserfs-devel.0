From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: no space left, rebuild-tree not finished, partition not mountable
Date: Sat, 1 May 2004 21:18:34 +0200
Message-ID: <20040501191834.GA2743@hello-penguin.com>
References: <200405011338.i41Dcc515982@p15097155.pureserver.info>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405011338.i41Dcc515982@p15097155.pureserver.info>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hkj@dmkuhlen.de
Cc: reiserfs-list@namesys.com

On Sat, May 01, 2004 at 03:38:38PM +0200, hkj@dmkuhlen.de wrote:
> Hi List!
> 
> I want to mount a partition to delete some files, because there isn't
> any space on the partition anymore. I cannot mount it, because
> --rebuild-tree didn't finish. It didn't finish, because there isn't
> enought space on the partition anymore. So what should I do?
> 
> It's a ~110G Partition. I did dd_rescue to another device and
> --rebuild-tree but still having the same problems. 
> 
> Any hints?

It would be against logic if dd_rescure would solve your problem.

You could try (but I really don't know if it works) the following:

"dd" your partition to a larger one and try to run "resize_reiserfs"
on the copy to enlarge it. Run --rebuild-tree afterwards.

If resize_reiserfs fails (I don't know if it checks filesystem
consistency before extending) patch the correspondending check simply out
of resize_reiserfs.

This is very experimental but in worst case you loose some time because
you working on a copy of your partition.

Good luck, but I guess that other people may offer you better
solutions...

-- 

  ciao - 
    Stefan
