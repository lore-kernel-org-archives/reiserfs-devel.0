From: Sander <sander@humilis.net>
Subject: Re: Some ReiserFS failure situations and questions
Date: Fri, 5 Mar 2004 07:47:34 +0100
Message-ID: <20040305064734.GD15906@favonius>
References: <20040303224848.GF31472@dbz.icequake.net> <4046F8F0.2010204@namesys.com> <20040304220945.GA23425@dbz.icequake.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040304220945.GA23425@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Ryan Underwood wrote (ao):
> The reason I posted is to find out some general Reiser recovery
> strategy.

Backups are a good thing for this. If you don't have money for a
usb/firewire disk, cd burner or old second computer, you can also store
your files in your homedir at the university.

Computer hardware will die for sure. You just never know when, but when
it does, it is a real PITA.
Backups not only protect against user error, but also bad programs,
power failures, broken hardware, etc. You can't do without.

> I had two filesystems corrupted in unusual ways as I described, and in
> both cases reiserfsck --rebuild-tree was mostly useless in recovering
> the data.

Did you try the newest reiserfsprogs? They are at 3.6.13 now, and seem
to get quite a bit better every release.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
