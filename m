From: Sander <sander@humilis.net>
Subject: Re: reiser4 and apache (was: Re: Reiser4 and ZFS)
Date: Tue, 28 Dec 2004 14:58:03 +0100
Message-ID: <20041228135803.GA11209@favonius>
References: <20041215064608.66493.qmail@web50901.mail.yahoo.com> <200412152000.iBFK0CHH016500@turing-police.cc.vt.edu> <20041227122814.GA7388@favonius> <200412271533.iBRFXpmT011625@turing-police.cc.vt.edu> <20041228111239.GA10511@favonius> <20041228131035.GB5352@backtop.namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041228131035.GB5352@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Alex Zarochentsev wrote (ao):
> > Can somebody please point me to a patch to disable the file as a
> > directory feature?
> 
> it is disabled in the recent reiser4 code.

That means the latest -mm (not 2.6.10-rc3-mm1) will contain the patch
too?

> mount options 'nopseudo' should work for older versions.

Remount doesn't seem to work. Google suggests that it should be passed
as a kernel argument during boot. Is that both true?
