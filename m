From: Redeeman <redeeman@metanurb.dk>
Subject: Re: nfs
Date: Mon, 17 Nov 2003 18:16:09 +0100
Message-ID: <1069089369.5237.6.camel@redeeman.linux.dk>
References: <1068931388.2186.6.camel@redeeman.linux.dk>
	 <20031115214812.GD25876@hvs.envisage.co.za>
	 <3FB8DD83.4030105@insightbb.com> <3FB849B5.1020404@namesys.com>
	 <3FB8F969.E20ED162@amis.com>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB8F969.E20ED162@amis.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

the "oldest" kernel i am running is 2.4.22, with reiserfs 3.6, and the
newest is now 2.6test9 with reiserfs 3.6 too, and everything works like
a charm! i hope reiser4 will do so ;D

On Mon, 2003-11-17 at 17:38, Eric Whiting wrote:
> 2.4 kernels with reiserfs 3.5 will still have NFS troubles. Just make sure you
> do not have this combination.  
> 
> eric
> 
> 
> Hans Reiser wrote:
> > >>
> > >> Several moons ago, there were problems with reiserfs and NFS, as
> > >> reiserfs didn't (still don't?) have the notion of inodes, which is
> > >> used in NFS for filehandle information. there were a quick work around
> > >> which didn't work that well, but the current 2.4.x kernels and
> > >> Reiserfs 3.6
> > >> works sofar without troubles.
> > >
> > >
> > The described problems were more like years ago than moons ago, however,
> > there were some kernels a few moons ago that had NFS problems not due to
> > reiserfs code just to keep things in a nice state of chaos for the
> > users.....
> > 
> > --
> > Hans
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments


