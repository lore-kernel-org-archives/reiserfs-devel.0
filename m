From: Aphelion <aphelion@snet.net>
Subject: Re: segmentation fault in fsck
Date: 19 Aug 2003 14:43:41 -0400
Message-ID: <1061318620.12894.18.camel@ayanami>
References: <1061269852.19511.17.camel@ayanami>
	 <1061270576.8879.1.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061270576.8879.1.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com

On Tue, 2003-08-19 at 01:22, Yury Umanets wrote:
> On Tue, 2003-08-19 at 09:10, Aphelion wrote:
> > The reiser4 fsck from the aug 18th snapshot as well as 0.4.11 cause a
> > segfault on my machine, in repair_filter_node_check. This is a clean
> > filesystem being checked that has never before been mounted.
> Excuse me, but fsck is not ready yet. We're working on it.
> 
> But anyway, thanks for report.

Oh... I did not know this. The userspace tools for reiserfs3 segfaulted
on me after their first few stable releases (but not since this
filesystem was first introduced). Well I'm less confused now. At least I
followed the directions given by the app when a problem happens.
*nodnod*

I'm thinking the release of reiser4 final will be an exciting event
indeed, much more so than the release of reiserfs3. Well... for me
anyways. Only a few geeks like myself would dare associate filesystems
with excitement. Keep up the great work everyone. Please. :)


