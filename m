From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 19:07:10 +0300
Message-ID: <200403111904.50475.vitaly@namesys.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com> <Pine.LNX.4.58.0403110944230.1969@web1.mmaero.com> <200403111848.11662.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403111848.11662.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jlewis@lewis.org
Cc: reiserfs-list@namesys.com

On Thursday 11 March 2004 18:48, Vitaly Fertman wrote:
> On Thursday 11 March 2004 17:52, jlewis@lewis.org wrote:
> > On Thu, 11 Mar 2004, Vladimir Saveliev wrote:
> > > > > Yes, this looks like reiserfsck got into endless loop. If it is
> > > > > still there lets break and fix reiserfsck bug.
> >
> > Actually, I've just straced reiserfsck for a while and in 20mb of strace
> > output, I see it's written to stdout more than 60000 message file names
> > (all unique) for this one user it's been 'stuck' on since last night.  So
> > I'm not so sure it's looping, but just taking an awful long time on a dir
> > with some insane number of files in it.  If that's the case, I'd hate to
> > stop it just to start over and take as long again.
> >
> > I ran this reiserfsck via a session logged in (across a 100mb ethernet)
> > via ssh.  Is it possible that not using -q could make it orders of
> > magnitude slower than it would have been if I'd used -q -l /some/logpath
> > ?
>
> it is possible that not using -l logfile or -n make it orders of magnitude
> slower, but not -q.

ah, I forgot that there is no delays in progress at semantic pass in 
v3 progs, in other words -q would speedup semantic pass for you also.

-- 
Thanks,
Vitaly Fertman
