From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiserfs Data Recovery
Date: Wed, 10 Mar 2004 18:26:12 +0300
Message-ID: <1078932372.9476.133.camel@tribesman.namesys.com>
References: <404E8665.7090305@nsanity.com>
	 <1078918871.9476.116.camel@tribesman.namesys.com>
	 <404F2F51.5000205@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404F2F51.5000205@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-03-10 at 18:08, Nick Vahalik wrote:
> Vladimir Saveliev wrote:
> 
> >>Are these features tested?  
> >>    
> >>
> >
> >Most of these things were added quickly to solve certain user problems.
> >To use them one is to understand what they were created for.
> >
> >  
> >
> And I guess that isn't documented....
> 
> >>Is there any more documentation on them 
> >>besides just what's in the comments?
> >>    
> >>
> >
> >no.
> >  
> >
> 
> >>  Are there any good sites to read 
> >>up some more on reiserfs v3.6 internals? 
> >>    
> >>
> >
> >namesys.com had description of reiserfs internals. But now it does not.
> >read source code instead
> >  
> >
> Is there a reason?  I grabbed a copy of the whitepaper from archive.org 
> and started reading it last night.  Is that information out of date... 
> or is it taken down pending the release of Reiserv4?
> 
I have no idea why it was removed. I will try to find out.

> >> I've become determined to get 
> >>this data back.  I've got a couple ideas that I'd like to try but look 
> >>at some of these commands I see that some of the things I'd like to 
> >>access may already be written.
> >>
> >>If the problem is that there are sections of my tree missing, why can't 
> >>we just chop the bad sections off and salvage the data that is still 
> >>there?  Are there any tools that do this?
> >>    
> >>
> >did you try reiserfsck?
> >  
> >
> Yes... with --rebuild-tree, and it aborts after Pass0 every time.  It 
> fixes... maybe 10 leaves... and then it finds a bad pointer (or 
> something) and dies every time it runs.
> 

Are you using reiserfsck from
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz?

If yes - please run
debugreiserfs -p /dev/problemdevice | bzip2 -c > problemdevice.bz2
and make problemdevice.bz2 available for downloading.

It should allow us to fix reiserfsck bug.

If you are using older rieserfsck (reiserfsck -V), please try with the
one of
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz

> Nick Vahalik
> 

