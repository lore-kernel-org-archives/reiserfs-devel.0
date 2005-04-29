From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: grub reiser4 won't compile
Date: Fri, 29 Apr 2005 15:19:22 +0400
Message-ID: <200504291519.22561.vitaly@namesys.com>
References: <200504272226.48234.c_wakefield@shaw.ca> <200504281606.42243.vitaly@namesys.com> <200504290211.42905.c_wakefield@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200504290211.42905.c_wakefield@shaw.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Wakefield <c_wakefield@shaw.ca>

On Friday 29 April 2005 13:11, Chris Wakefield wrote:
> Hi Vitaly.
> 
> Thanks for your reply.
> 
> I tried every reasonable combo:
> apt-get source grub ... patched it with LATEST_PATCH ...that wouldn't compile 
> with or without the patch,
> grub-0.95,
> grub-0.96,

if the grub-0.96 without reiser4 patch does not want to be configured,
you should probably ask the grub guys about it:
http://www.gnu.org/software/grub/grub-legacy-bugs.en.html


> all the same result.
> I wasn't sure what to do with "LATEST_GRUB", it seemed to be a binary for some 
> reason.

this is the rebuilt grub package with the applied reiser4 patch, it points to
ftp.namesys.com/pub/reiser4progs/grub/grub-0.96-reiser4-20040130.tar.gz

 
> I'm stumped.
> 
> Thanks,
> Chris W.
> 
> On April 28, 2005 05:06 am, Vitaly Fertman wrote:
> > On Thursday 28 April 2005 09:26, Chris Wakefield wrote:
> > > Greetings all.
> > >
> > > I'm attempting to setup Reiser4 on a partition and I've got as far as
> > > trying to compiling grub and I've run into a wall.
> > >
> > > It's a Reiser4 patched grub source from:
> > > ftp://ftp.namesys.com/pub/reiser4progs/grub/LATEST_PATCH
> >
> > so is it reiser4 patched grub from LATEST_GRUB or
> > the reiser4 grub patch from LATEST_PATCH?
> >
> > > anyways, I run configure and I get:
> > >
> > > "....checking build system type... x86_64-unknown-linux-gnu
> > > checking host system type... x86_64-unknown-linux-gnu...
> > >
> > > .........................
> > >
> > > ........"checking for C compiler default output file name... configure:
> > > error: C compiler cannot create executables".
> > >
> > > config log error is:
> > > ......."configure:2416: $? = 1
> > > configure: failed program was: | /* confdefs.h.  */" ......
> > >
> > > This is happening only with reiser4 grub, as I'm able to compile kernels
> > > and who knows what else .. it's just this source only.
> > > Do I require a different source or do I have to compile reiser4 grub in a
> > > 32 bit chroot environment?
> >
> > what does the plain grub-0.96 without reiser4 patch say?
> 
> 

-- 
Thanks,
Vitaly Fertman
