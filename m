From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Forked reiserfsprogs
Date: Tue, 22 Apr 2008 18:28:29 -0500
Message-ID: <1208906909.26981.6.camel@localhost>
References: <480B97E3.7080008@gmail.com> <480C0721.7090005@suse.com>
	 <480E5861.7070205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <480E5861.7070205@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Vladimir Saveliev <Vladimir.Saveliev@sun.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Ric Wheeler <ric@emc.com>

On Wed, 2008-04-23 at 01:28 +0400, Edward Shishkin wrote:
> Jeff Mahoney wrote:
> 
> > Edward Shishkin wrote:
> 
> [...]
> 
> > >Problems:
> >
> > >1. The status of Reiserfsprogs-3.6.20.1 should be clarified.
> > >  Did the Vladimir's branch get testing?
> >
> >
> > I believe this is the version I was working with. It got testing, and
> > the results weren't good. I'm not sure if these are specific to
> > Vladimir's version or to Vitaly's version,
> 
> 
> I think it was Vitaly's one (3.6.20), as Vladimir told about monthly
> snapshots somewhere in ./tmp..
> 
> > but when I pushed it for a
> > SLE10 SP2 alpha, I ended up getting lots of bug reports. They focused
> > mainly in the area of endianness and divide-by-zero errors. So, I
> > wouldn't call this version stable at all.
> 
> 
> Hum.. I didn't know about it. It seems we need to rename it to something
> like 3.6.20-preX..
> 
> > I didn't have the time or
> > interest to figure out what these problems were especially since, at the
> > time, I was told a real 3.6.20 didn't actually exist. I ended up backing
> > out the change and porting all my patches to what you're calling 3.6.19.1.
> >
> > >2. I don't have Reiserfsprogs-3.6.20.1. Are there any snapshot
> > >  on this mirror that can be put for public needs:
> > >  ftp://ftp.icm.edu.pl/packages/linux-reiserfs ?
> > >3. Perhaps, I will need help in addressing possible bugreports
> > >  and the final merge of all branches.
> >
> > >Any comments, updates, suggestions?
> >
> >
> > If we actually have a stable 3.6.20, I'd be happy to forward port my
> > patches. One thing needs to happen, though: We absolutely need to start
> > testing on big endian hardware. We ship reiserfs on both powerpc and
> > s390, and hit the endian bugs quickly on those systems.
> >
> 
> Perhaps, I'll buy a cheap Mac G3 for testing (it is also needed for 
> reiser4),

You could also try PearPC. On a fast x86/amd64 machine it probably isn't
any slower than a low-spec G3.

I have a beige G3 I'm not doing anything with (aside from testing
reiser4 on it some time ago), but getting it to boot Linux without MacOS
8/9 installed is borderline voodoo, so I assume you wouldn't be
interested.

> but s390 seems to be exotic here..
> 
> Ok, I'll put what I have: 3.6.19.1 and renamed 3.6.20.
> 
> Thanks Jeff.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Jake Maciejewski <maciejej@msoe.edu>

