From: Baldur Norddahl <bbn-reiserfs@dark.x.dtu.dk>
Subject: Re: Filesystem corruption after resize
Date: Wed, 12 Jun 2002 14:19:25 +0200
Message-ID: <20020612121925.GA23461@dark.x.dtu.dk>
References: <20020611165513.GB23259@dark.x.dtu.dk> <200206121250.31567.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206121250.31567.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Baldur Norddahl <bbn-reiserfs@dark.x.dtu.dk>, reiserfs-list@namesys.com

Quoting Vitaly Fertman (vitaly@namesys.com):
> Hi, 
> 
> > Hello,
> > The exact commands used are:
> >
> > resize_reiserfs -s 400G /dev/vg01/stuff
> > lvreduce -l 16693 /dev/vg01/stuff
> > pvmove -v /dev/md1
> > vgreduce -v vg01 /dev/md1
> > resize_reiserfs /dev/vg01/stuff
> > reiserfsck --check /dev/vg01/stuff
> >
> > This all worked like a charm, until I noticed that a nightly script that
> > scans all files, no longer was able to access about 20 files (access denied
> > even though the script is running as root).
> 
> Do you mean reiserfsck finished without any error/warning massage? 

Yes, it did not detect any errors after the resize. The errors turned up a
day after. So it might not be 100% that those two events are linked. But
since nothing else was done that could justify corruptions, that is the
theory I am working on.

> This progs I send to you is what is going to be the next release. 
> Please run --check and tell me what is in fsck.log. You can run 
> --fix-fixable if it says so, but it would be better to run 
> rebuild-tree on a copy (it is not a release). Or you can do the following:
> 
> debugreiserfs/debugreiserfs -p /dev/vg01/stuff | gzip -p > stuff.gz
> 
> it will pack metadata (without filebodies), I will download it and test 
> locally.

I will send you those two files in a seperate mail.

I copied all the data over to the other raid device, so I am not so much
concerned about rescueing the filesystem - I could just reformat the whole
thing and copy the files back.

But I would very much like to find out what happened so I can take actions
to prevent it from happening again. Particularly I need to know if resizing
on lvm devices is working properly, since I will need to resize again
shortly when the replacement disk arrives.

Baldur
