From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 14:03:05 +0200
Message-ID: <1063454584.1661.9.camel@teapot.felipe-alfaro.com>
References: <Pine.LNX.4.44.0309130753440.6794-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0309130753440.6794-100000@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Reiser FS mailing list <reiserfs-list@namesys.com>

On Sat, 2003-09-13 at 13:59, Robert P. J. Day wrote:
> > If my memory serves me well, that's the only patch needed to make it
> > compile.
> 
> i'm confused.  the "patch" i refer to is the kernel patch to build
> reiser 4 support into the kernel.  the fact that this works on 
> patching the kernel doesn't seem to prevent the reiser4 progs build
> problem.

The patch I submitted was against reiser4progs, not against the kernel.
With that patch applied, I've been able to compile reiser4progs with no
problem at all.

