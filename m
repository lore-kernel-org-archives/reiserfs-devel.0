From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 3 Apr 2004 22:22:33 -0500 (EST)
Message-ID: <20040404032233.86328.qmail@web25010.mail.ukl.yahoo.com>
References: <406EFB72.6000009@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406EFB72.6000009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote: 

> Narcoleptic Electron wrote:
> 
> >What is the plan for addressing the name clash
> >problems that this causes?  (eg. I copy a 
> >directory,
> >that happens to contain a "metas" directory, to my
> >Reiser4 partition)
>  
> these problems will not exist significantly in
> reality.  Look at netapps 
> and snapshots and clearcase and other filesystems, I
> remember wondering 
> if .snapshot could be a problem when netapps were
> new and it was never a 
> problem.

I do not disagree that it is unlikely.  However, it is
still possible, so my question remains: what happens
in the scenario I describe?

> People who find it is a problem can #define it to
> something else.  If 5 
> people bother to do so, I will be surprised.

True; as long as everyone refers to the "metas"
directory properly (using an environment variable, for
example, as opposed to hard-coding the string "metas"
anywhere), it will be fine.

> Many languages have reserved keywords.....

We're not talking about a language here, though...
we're talking about a namespace.  To me, the measure
of usefulness of a namespace is the ability to provide
names... reserved words hamper that ability.  The
perfect namespace has no reserved words; at worst,
only  reserved characters, with escape sequences
provided for each so that any name is still possible.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
