From: Jan Kara <jack@ucw.cz>
Subject: Re: Quota and reiserfs status
Date: Fri, 7 Jun 2002 18:20:10 +0200
Message-ID: <20020607162010.GI27843@atrey.karlin.mff.cuni.cz>
References: <3D00B880.E3A7B770@cri74.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D00B880.E3A7B770@cri74.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Salvi <fabien@cri74.org>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

  Hello,
  
> I've tried some tests with quota using reiserfs filesystems.
> It works very well...
> 
> I have attached a very little documentation (2 ascii texts) about simple
> configuration.
> Hope it can help somebody.
  The text is nice :)
  
> I have one question :
> Now, you must patch linux kernel to have quota with reiserfs enabled.
> 
> Is it provided to the near future, or maybe not before the next stable
> release of lk ?
  Currently VFS side of the patches is in 2.5 kernel and I
suppose Chris will commit Reiserfs part soon. I plan to backport patches
from 2.5 kernel to 2.4 (but it's not certain Marcello will agree with it
and I'm also not sure about Reiserfs part of the patches).

								Honza
