From: John Wilkes <john@wilkes.com>
Subject: Re: Cannot open root device
Date: Tue, 4 May 2004 19:23:58 -0700 (PDT)
Message-ID: <Pine.LNX.4.53.0405041914040.3659@bi165.wilkes.com>
References: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
 <200405051016.41233.Michael.James@csiro.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405051016.41233.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael James <Michael.James@csiro.au>
Cc: reiserfs-list@namesys.com

On Wed, 5 May 2004, Michael James wrote:

> > [mount hda3 on alt system; tar it; mkfs.reiserfs /dev/hda3; untar]
> >
> > Does that look like it will work?
>
> Yes, in the sense of re-building the partition.

Re-building the partition fixed it.

Must have been some peculiar corruption that affected only mounting
the partition as the root device but allowed simple mounting.
Whatever.  Nuking the filesystem and restoring it fixed the problem.
I feel lucky.

Thanks for your kind assistance!

-- 
John Wilkes
john at wilkes dot com

