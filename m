From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: free space seems wrong...
Date: Thu, 6 Mar 2003 15:23:14 +0300
Message-ID: <200303061523.14590.vitaly@namesys.com>
References: <1046886804.23752.25.camel@calculon> <20030306094705.A5417@namesys.com> <1046952022.23752.55.camel@calculon>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1046952022.23752.55.camel@calculon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com


Hi, 

> do):Yes reiserfs_open_journal: journal parameters from super block does not
> match to journal parameters from journal.
>
> Either make journal partition available or use --no-journal-available
> If you have the standard journal or if your partition is available
> and you specified it correctly, you must run rebuild-sb.

There is a new check for journal parameters were added which helps to recover
fs with relocated journal and in a few other cases. These parameters were not
stored correctly in old kernels before relocated journal appeared. This is 
nothing to worry about, and you can fix if you run fsck --rebuild-sb and
say there to fix parameters in the jouranl by ones from the super block.

-- 

Thanks,
Vitaly Fertman
