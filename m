From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Plugins: Pseudo-fun.
Date: Wed, 09 Nov 2005 11:05:44 -0800
Message-ID: <200511091105.44523.pvh@uvic.ca>
References: <200511090320.33063.pvh@uvic.ca> <437239A3.30509@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <437239A3.30509@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On November 9, 2005 10:02 am, Hans Reiser wrote:
> >
> >Although the overall goal remains elusive, we think we should be able to
> >implement a new Reiser4 pseudo directory in 4dot (/..../). This directory,
> >called "user" will contain per-file user-defined attributes.
>
> Why would these go into the pseudo directory instead of into the directory?
>

Let me construct a simple use case for having a namespace separation between 
contained data and metadata. 

For example, a self-installer or a Klik style bundled package could include 
all its resources within its own directory. In this hypothetical use case, it 
would be very valuable for the package metadata (name, version, description) 
to be clearly differentiated from the package data.

I do not have a strong opinion about whether user metadata should be a sibling 
of fourdot or a child.

> You don't want to have directory traversals use "...." at all.....

No, we really don't. So far, my experiments with ls and grep show them playing 
nicely, but that may only be because '....' doesn't get listed by 'ls -la'.

> >Crashing and glitching:
> >pvh@arroyo:~/reiser/ $ cd A2.mp3/...<tab>
> >freezes the console. I think regular files, when pseudo data is enabled,
> > need to provide some basic directory functionality so that users don't
> > accidentally blow things up.
>
> Why exactly does it freeze things?
>

I have no idea. I suspect tab-completion in my console is waiting for a call 
to file->locate() to come back and doesn't know how to cope when it doesn't.

> I hate to say it, but you are the ones most actively working on this
> now, and I encourage you to fix the little bugs you find as you go, and
> tell us about them.  Let me know about everything that affects
> semantics/functionality before fixing it though....

I'll keep sending out these emails.
-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
