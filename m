From: Redeeman <redeeman@metanurb.dk>
Subject: Re: some basic questions
Date: Wed, 05 Nov 2003 16:44:42 +0100
Message-ID: <1068047082.32079.2.camel@redeeman.linux.dk>
References: <1067880381.17873.9.camel@redeeman.linux.dk>
	 <1068044839.32072.0.camel@redeeman.linux.dk>  <3FA91326.2060407@gmx.net>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FA91326.2060407@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

you say reiserfs and reiser4 is two diffrent things, is reiser4 a
totally new filesystem?

On Wed, 2003-11-05 at 16:11, Carl-Daniel Hailfinger wrote:
> Redeeman wrote:
> > nobody seems to answer :(
> > 
> > On Mon, 2003-11-03 at 18:26, Redeeman wrote:
> > 
> >>i am wondering about a few things. i am seriously thinking of change to
> >>reiserfs. i experience bad stuff happen to fat32 often, and i have got
> >>tired of it. i have a kernel with version 3.6 of reiserfs.
> >>
> >>will it be possible to convert to reiserfs4?
> 
> Not at this time. Actually reiserfs 3.6 and reiser4 are two totally
> different entities, so it's highly unlikely.
> 
> >>is it possible to defragment a partition with reiserfs (or will it be in
> >>version 4?)
> 
> backup with tar, delete everything, restore backup.
> 
> >>is it possible to undelete stuff?
> 
> no.
> 
> >>is it the correct choice for my use? (mp3, movies, cd images)
> 
> should be.
> 
> >>is there anything i should know?
> 
> Yes. reiser4 is not yet stable. This will not affect you if you use
> reiserfs 3.6
> 
> >>thanks, and have a nice day
> 
> Regards,
> Carl-Daniel
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments

