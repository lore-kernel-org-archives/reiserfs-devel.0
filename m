From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 4 Apr 2004 00:21:22 -0500 (EST)
Message-ID: <20040404052122.62535.qmail@web25006.mail.ukl.yahoo.com>
References: <200404040631.50269.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404040631.50269.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Christian Iversen wrote: 

> On Sunday 04 April 2004 06:28, Hubert Chan wrote:
>
> > >>>>> "Narcoleptic" == Narcoleptic Electron
> > >>>>> writes:
> >
> > Narcoleptic> True; as long as everyone refers to
> the "metas" directory
> > Narcoleptic> properly (using an environment
> variable, for example, as
> > Narcoleptic> opposed to hard-coding the string
> "metas" anywhere), it
> > Narcoleptic> will be fine.
> >
> > Hmm.  Maybe have a /proc/fs/reiser4/metas file to
> query it?
> > (Environment variable seems fragile.)
> 
> Good idea. Of course, I will be the first one to set
> it to "..." ;-)

Yes, a "/proc/fs/reiser4/metas" file containing the
meta directory name is a far better approach than
putting it in an environment variable (that was just
the first thing that came to my mind to demonstrate
the point).


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
