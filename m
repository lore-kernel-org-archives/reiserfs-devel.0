From: Oleg Drokin <green@namesys.com>
Subject: Re: rsync and memory leak on linux 2.2?
Date: Thu, 20 Feb 2003 09:19:23 +0300
Message-ID: <20030220091923.A20036@namesys.com>
References: <1045156304.11405.149.camel@barnes> <87r8abtlhq.fsf@freeze.oslo.dnmi.no> <20030214130111.A27034@namesys.com> <1045689849.1168.24.camel@barnes> <3E5402B0.5030606@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5402B0.5030606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Patrick O'Rourke <porourke@egenera.com>, Adrian Phillips <a.phillips@met.no>, reiserfs-list@namesys.com

Hello!

On Thu, Feb 20, 2003 at 01:18:24AM +0300, Hans Reiser wrote:

> Thanks Patrick.  This leaves us with one unsolved reiserfs V3 bug that I 
> know of (unlink related one, vs is working on it, and he is not 

Vladimir tracked that down yesterday.
At least we think so. (and even if the fix we discussed yesterday won't help,
that'd mean we have another bug in addition to what Vladimir found.
And this is indeed a race between two iget(). I am not sure if VFS
is flawed, but I think at least partially it is. Because in 2.5
that piece of code redesigned right way.)

> completely sure it is reiserfs not vfs....).  Oleg, am I right in 
> thinking that the samba+reiserfs bug looks like a samba bug?

That turned out to be fs corruption of unknown source. Hardware is
the main suspect for now.

Bye,
    Oleg
