From: Chris Mason <mason@suse.com>
Subject: Re: Status of reiserfs in Redhat 2.4.7-10 kernel ?
Date: 16 Apr 2003 09:17:24 -0400
Message-ID: <1050499043.10791.137.camel@tiny.suse.com>
References: <Pine.NEB.4.44.0304151610230.25702-100000@slick.sigje.org>
	 <3E9D0744.9090907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9D0744.9090907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ahorn@deorth.org, reiserfs-list@namesys.com

On Wed, 2003-04-16 at 03:33, Hans Reiser wrote:

> I am afraid that I can only say that Redhat kernels are not standard 
> kernels, and non-standard kernels should not be preferred for use in 
> production systems.  They are not as well tested (or as debugged) as 
> Linus/Marcelo kernels.  Linus/Marcelo kernels are the official kernels, 
> and Linus and Marcelo, not RedHat or any other distro, are the Linux 
> kernel maintainers.  I personally try to avoid any use of a non-standard 
> kernel in systems I care about because I know that no distro has the 
> testing ability of those who test the Marcelo kernels, and Marcelo's 
> level of skill and caution exceeds that of any other maintainer I am 
> familiar with in detail, but I am more conservative than most.

Grin, Hans and I have had this debate before, you might want to read
through the reiserfs list archives for all the details.  Just look for
the thread where Hubert Mantel most recently posted.

The short version is that I would pick a current vendor kernel over a
current vanilla kernel any day for heavy production use.    In terms of
performance and stability the vendor kernel will usually do better.  The
kinds of QA done on large hardware and heavy workloads is significantly
better before a vendor release than a vanilla release.

The problem is in defining 'current'.  I haven't followed the rhas
releases enough to know if they still qualify.

Anyway there's no need to start that debate again, neither Hans nor I
have changed our minds ;-)  

-chris


