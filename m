From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree
Date: Tue, 6 Jul 2004 14:22:13 +0400
Message-ID: <200407061422.13505.vitaly@namesys.com>
References: <200407060828.56801.aotto1968@onlinehome.de> <40EA5193.2040604@mweb.co.za> <40EA6932.7090606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40EA6932.7090606@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>, Cami <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

On Tuesday 06 July 2004 12:56, Vladimir V. Saveliev wrote:
> Hello
>
> Cami wrote:
> > Hi All,
> >
> > Last night i done monthly maintence on all of my
> > mailhosts and after doing a reiserfsck, it looks
> > like i'll have to rebuild the tree on one of my
> > mail clusters (the other 8 clusters were fine)..
> >
> > [mailhost01][/root]# df -h
> > Filesystem            Size  Used Avail Use% Mounted on
> > /dev/emcpowera1       152G   35G  117G  23% /var/spool/virtual
> >
> > Can anyone tell me roughly how dangerous this is
>
> it is not dangerous. Just, please, make sure you have recent reiserfsck.
>
> > and roughly how long something like this will take?
>
> hard to say. It depends on hardware. Given that 35 gb is not too much
> reiserfsck --rebuild-tree should not take too much. 2 hours? Vitaly may
> want to correct me, though

fscking 35G should take minimum 1h, usually up to 2h. However 
semantic pass depends on the amount of files a lot, and as mailboxes 
have many small files fsck may take several hours. 

> > The filesystem stores all the users mailboxes in
> > maildir format so there are millions of files..
> >
> > Any tips/comments would be appreciated..
>
> PS: please do not forget that backuping is important when dealing with
> user mailboxes even if you are running super reliable hardward and
> bugless software.
>
> > Regards,
> > Cami

-- 
Thanks,
Vitaly Fertman

