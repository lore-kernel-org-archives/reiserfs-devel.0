From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: free space seems wrong...
Date: 07 Mar 2003 16:52:05 +0100
Message-ID: <1047052325.23752.70.camel@calculon>
References: <1046886804.23752.25.camel@calculon>
	 <20030306094705.A5417@namesys.com> <1046952022.23752.55.camel@calculon>
	 <200303061523.14590.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303061523.14590.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 2003-03-06 at 13:23, Vitaly Fertman wrote:
> Hi, 
> 
> > do):Yes reiserfs_open_journal: journal parameters from super block does not
> > match to journal parameters from journal.
> >
> > Either make journal partition available or use --no-journal-available
> > If you have the standard journal or if your partition is available
> > and you specified it correctly, you must run rebuild-sb.
> 
> There is a new check for journal parameters were added which helps to recover
> fs with relocated journal and in a few other cases. These parameters were not
> stored correctly in old kernels before relocated journal appeared. This is 
> nothing to worry about, and you can fix if you run fsck --rebuild-sb and
> say there to fix parameters in the jouranl by ones from the super block.

Ok. So I ran reiserfsck --rebuild-sb first and later with --check and
than --rebuild-tree... It connected very few files to lost+found and
finished within 1hr (its a ~3 year old 300G raid) - good job guys !

Thanks a lot,
Soeren.

