From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item
	returned -28
Date: Fri, 16 Jan 2004 19:26:34 +0300
Message-ID: <1074270394.2251.167.camel@tribesman.namesys.com>
References: <200401091622.41352.lkml@kcore.org>
	 <1074241063.2251.41.camel@tribesman.namesys.com>
	 <200401161620.i0GGK2MT022923@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401161620.i0GGK2MT022923@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Jan De Luyck <lkml@kcore.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, 2004-01-16 at 19:19, Valdis.Kletnieks@vt.edu wrote:
> On Fri, 16 Jan 2004 11:17:43 +0300, Vladimir Saveliev said:
> 
> > This is just a warning. You should be able to free some disk space by
> > removing some files.
> 
> Is this just the *obvious* "removing files frees space", or is there some sort
> of garbage collection that will be triggered, so removing a 1K file will make it
> redo tables/linked lists/whatever and return lots of blocks that used to contain
> metadata?

This is the *obvious* "removing files frees space".

