From: Oleg Drokin <green@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 16:54:03 +0300
Message-ID: <20030228165403.E10830@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com> <3E5EAA3A.8030203@suse.com> <20030228100454.B878@namesys.com> <3E5F634D.8060901@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5F634D.8060901@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Feb 28, 2003 at 08:25:33AM -0500, Jeff Mahoney wrote:

> >>	Well, the more possible values a given multivalue option has, the more 
> >>values that need to be explicitly negated for a mutually exclusive 
> >>option. The descriptor lines get quite long with more than 2 options 
> >>when you need to specify every value you need to clear.
> >That's true. Not sure we can do something about that.
> >>	I also got to thinking that perhaps the idea of being able to specify 
> >>multiple values for multivalue options isn't that great. If more than 
> >>one value is possible, the option should probably be a first level 
> >>option (ie: -ooption) rather than a second level option (ie: 
> >>-oname=value). With that in mind, I'd prefer to see my original 
> >>implementation used.
> >Well, we have two kinds of tails now, large and small.
> >So do you propose we should have:
> >notail
> >smalltail
> >largetail options?
> >please keep in mind that smalltail and largetail are mutually exclusive.
> 	No, just the opposite. I'm suggesting that if smalltail and largetail 
> were _not_ mutually exclusive they should be first level options. Since 
> they _are_ mutually exclusive, then they are well suited for a second 
> level option.

Ok, probably I understand. You are against grouping not exclusive options
under one 1st level one, like we have now with balloc, is that right?

Still I do not see how that invalidates the need for "clear mask" for options
that are mutually exclusive with something.

> 	I think that the appearance of assignment involved in specifying a 
> second level option makes it intuitive to believe that only the most 
> recently used option is the active one.

I think that when you able to specify several options at a time (like
alloc=opt1:opt2:opt3) is still intuitive enough.

Bye,
    Oleg
