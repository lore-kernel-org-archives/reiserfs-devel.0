From: Jan Kara <jack@ucw.cz>
Subject: Re: quota problem
Date: Thu, 7 Nov 2002 17:44:27 +0100
Message-ID: <20021107164427.GI28780@atrey.karlin.mff.cuni.cz>
References: <20021104121034.GA96760@ppk.itb.ac.id>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11944-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021104121034.GA96760@ppk.itb.ac.id>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dikshie <dikshie@ppk.itb.ac.id>
Cc: reiserfs-list@namesys.com, ext3-users@redhat.com

  Hello,
  
> VFS: Quota for id 1114 referenced but not present.
> VFS: Can't read quota structure for id 1114.
> VFS: Quota for id 1116 referenced but not present.
> VFS: Can't read quota structure for id 1116.
> VFS: Quota for id 1115 referenced but not present.
> VFS: Can't read quota structure for id 1115.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
  This looks like corrupted quota file. quotacheck(8) should be able
to fix it (but probably you should check that limits are set properly -
some of them might got lost). 2.4.18 kernel has a small race which can
occur under heavy load and cause such corruption so I suggest you
updating to newer kernel...
								Honza
