From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bug report: Reiser4 freezes during file copy
Date: Wed, 18 Feb 2004 22:30:44 +0300
Message-ID: <20040218193044.GM21098@backtop.namesys.com>
References: <1077127993.7063.6.camel@localhost.localdomain> <20040218184322.GK21098@backtop.namesys.com> <1077131946.7063.10.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1077131946.7063.10.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Wed, Feb 18, 2004 at 12:19:06PM -0700, Jonathan Briggs wrote:
> On Wed, 2004-02-18 at 11:43, Alex Zarochentsev wrote:
> > hi,
> > 
> > On Wed, Feb 18, 2004 at 11:13:14AM -0700, Jonathan Briggs wrote:
> > > The software:
> > > Linux kernel 2.6.3 with Reiser4 patch dated February 6th.
> > > Compiled with gcc 3.4.0 20040129
> > > (I know the GCC is still in testing, but Reiser3 works fine with it,
> > > so...)
> > > 
> > > After I'd created a new Reiser4 filesystem, I was copying my backup
> > > files onto it.  While I was doing that, it just stopped.
> > 
> > Did you create reiser4 on a loopback or RAID/LVM device?
> 
> I knew I should have included more details!  Sorry...
> Yes, it was on a MD device on top of two SCSI drives.  RAID 0.

This is know problem. That snapshot does not work with RAID devices due to
error in bio constructing code.  

We are about releasing new snapshot which the fixes.

-- 
Alex.
