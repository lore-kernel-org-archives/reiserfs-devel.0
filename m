From: Eric Whiting <ewhiting@amis.com>
Subject: Re: nfs
Date: Mon, 17 Nov 2003 09:38:01 -0700
Sender: ewhiting@amis.com
Message-ID: <3FB8F969.E20ED162@amis.com>
References: <1068931388.2186.6.camel@redeeman.linux.dk> <20031115214812.GD25876@hvs.envisage.co.za> <3FB8DD83.4030105@insightbb.com> <3FB849B5.1020404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

2.4 kernels with reiserfs 3.5 will still have NFS troubles. Just make sure you
do not have this combination.  

eric


Hans Reiser wrote:
> >>
> >> Several moons ago, there were problems with reiserfs and NFS, as
> >> reiserfs didn't (still don't?) have the notion of inodes, which is
> >> used in NFS for filehandle information. there were a quick work around
> >> which didn't work that well, but the current 2.4.x kernels and
> >> Reiserfs 3.6
> >> works sofar without troubles.
> >
> >
> The described problems were more like years ago than moons ago, however,
> there were some kernels a few moons ago that had NFS problems not due to
> reiserfs code just to keep things in a nice state of chaos for the
> users.....
> 
> --
> Hans
