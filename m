From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: AMD64 progress?
Date: Tue, 8 Feb 2005 22:12:58 +0300
Message-ID: <20050208191258.GF7482@backtop.namesys.com>
References: <20050114201751.GB5883@backtop.namesys.com> <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu> <20050207132934.GA7482@backtop.namesys.com> <1107804896.10689.17.camel@gentoo> <20050207195147.GB7482@backtop.namesys.com> <1107887159.12393.6.camel@gentoo>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1107887159.12393.6.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Isaac Chanin <chanin@WPI.EDU>, reiserfs-list@namesys.com

On Tue, Feb 08, 2005 at 12:25:58PM -0600, Jake Maciejewski wrote:
> On Mon, 2005-02-07 at 22:51 +0300, Alex Zarochentsev wrote:
> > On Mon, Feb 07, 2005 at 01:34:56PM -0600, Jake Maciejewski wrote:
> > > I'm running reiser4progs 1.0.3 and 2.6.10 patched with reiser4 from
> > > 2.6.11-rc3-mm1 (and this patch).
> > > 
> > > I've been doing the simultaneous dd and kernel compilation that has
> > > always crashed reiser4 on AMD64 in the past. After about an hour with
> > > debugging and two hours without debugging, I'm thinking of more ways to
> > > torture the FS. For now it looks like reiser4 is working on AMD64!
> > 
> > i think so.  reiser4/amd64 passed 5h of stress testing instead of crashing in
> > first 30min.
> > 
> Have you been stress testing with debugging disabled? I was doing some
> extreme testing and crashed reiser4 with this patch twice. The same test

how it crashed?  Was the fs corrupted after the crash?

> that crashed it one of the times passes on reiserfs (didn't try the
> other), and if enable debugging, I can torture reiser4 all night and
> still not crash it. I'll do some more tests and try to identify a
> simple, reproducible crash scenario.

Thanks,
Alex.
