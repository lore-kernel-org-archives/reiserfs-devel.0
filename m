From: Oleg Drokin <green@namesys.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Tue, 29 Oct 2002 18:26:00 +0300
Message-ID: <20021029182600.A23041@namesys.com>
References: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com> <20021029181438.A21904@namesys.com> <20021029162014.0d9b359f.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021029162014.0d9b359f.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com, mason@suse.com

Hello!

On Tue, Oct 29, 2002 at 04:20:14PM +0100, Philippe Gramoull? wrote:

> This in the log , before the oops :
>  journal-1413: journal_mark_dirty: j_len (1024) is too big

Yes, this is the assertion that failed (jlen to be less than TRANS_MAX
something).

> and filer is low on space :o)
> /dev/sdb1            572418604 572341220     77384 100% /storage
> Should it be because filer hit 0 on space ?

No, the free space on disk is irrelevant I believe.
Journal is on its own separate area anyway.

Bye,
    Oleg
