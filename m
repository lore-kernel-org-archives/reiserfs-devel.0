From: Oleg Drokin <green@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 10:01:47 +0300
Message-ID: <20030228100147.A878@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5E92BA.4090307@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Fri, Feb 28, 2003 at 01:35:38AM +0300, Hans Reiser wrote:
> >    For the simple cases (which also happen to be all we have right 
> >now), yes, I think that my implementation is cleaner. It allows the 
> >simple use of mutually exclusive options, through the "no" prefix, and 
> >clearing of the other bits in a multivalue option.  For now, that's 
> >all we need - and it's a valid argument for using my code. However, 
> >what I like about Oleg's implementation is that if you have an option 
> >that excludes other options (even when it's not multivalue), it can 
> >clear those bits as well.
> It clears them without failing, yes?  Not sure I like that.

Hm, why should it fail?

Bye,
    Oleg
