From: Guillermo Torreiro <gtorreiro@yahoo.com>
Subject: Re: newbie how to
Date: Thu, 12 Sep 2002 08:12:28 -0700 (PDT)
Message-ID: <20020912151228.31694.qmail@web9804.mail.yahoo.com>
References: <3D80A692.6090107@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D80A692.6090107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

> darren wrote:
> 
> >Hi all,
> >
> >I have a brand new RedHat computer just setup. It
> currently have two
> >partitions...both EXT3.
> >
> >How do I make one of my drives reiserfs?
> >
> >
> >
> >
> >  
> >
--- Hans Reiser <reiser@namesys.com> wrote:
> use tar.  tar does a good job, and nfs to a file
> server (or some 
> borrowed hard drive) plus tar will work well.
> 
> Remember to run lilo after untarring.
> 
> 

a bit more extensive approach:

1) Like Hans said, use tar to backup your partition,
and put it in some place over a NFS drive or another
local drive.
2) umount your partition to be converted to ReiserFS.
3) format this partition using ReiserFS tools.
4) edit /etc/fstab and change the line having your
partition to the following:
/dev/hdxy /xx/yy  reiserfs  defaults    1   2
where /dev/hdxy is your partition (I guess it's ide)
and /xx/yy is the mount point.
5) mount it again.
6) untar your backup into your new ReiserFS partition


__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com
