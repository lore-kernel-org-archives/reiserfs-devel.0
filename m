From: Yury Umanets <umka@namesys.com>
Subject: Re: segmentation fault in fsck
Date: Wed, 20 Aug 2003 12:39:03 +0400
Message-ID: <1061368742.28785.1.camel@haron.namesys.com>
References: <1061269852.19511.17.camel@ayanami>
	 <1061270576.8879.1.camel@haron.namesys.com>
	 <1061318620.12894.18.camel@ayanami>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061318620.12894.18.camel@ayanami>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aphelion <aphelion@snet.net>
Cc: reiserfs-list@namesys.com

On Tue, 2003-08-19 at 22:43, Aphelion wrote:
> On Tue, 2003-08-19 at 01:22, Yury Umanets wrote:
> > On Tue, 2003-08-19 at 09:10, Aphelion wrote:
> > > The reiser4 fsck from the aug 18th snapshot as well as 0.4.11 cause a
> > > segfault on my machine, in repair_filter_node_check. This is a clean
> > > filesystem being checked that has never before been mounted.
> > Excuse me, but fsck is not ready yet. We're working on it.
> > 
> > But anyway, thanks for report.
> 
> Oh... I did not know this. The userspace tools for reiserfs3 segfaulted
> on me after their first few stable releases (but not since this
> filesystem was first introduced). Well I'm less confused now. At least I
> followed the directions given by the app when a problem happens.
> *nodnod*
> 
> I'm thinking the release of reiser4 final will be an exciting event
> indeed, much more so than the release of reiserfs3. Well... for me
> anyways. Only a few geeks like myself would dare associate filesystems
> with excitement. Keep up the great work everyone. Please. :)

We will try to have not segfaults even in first releases.

Thanks for your interest to us and trying our software.

Regards.

