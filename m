From: Oleg Drokin <green@namesys.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Tue, 29 Oct 2002 18:14:38 +0300
Message-ID: <20021029181438.A21904@namesys.com>
References: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>, mason@suse.com

Hello!

On Tue, Oct 29, 2002 at 03:59:07PM +0100, Philippe Gramoull? wrote:

> Is this still the infamous NFSD/inode race ?

No.
This is a bug in journalling code.
Something related to improper transaction blocks accounting.
Chris said he will try take care of it and rejected my 
simple, but invalid patch.

Chris, any news on that?

> >>EIP; c0194899 <reiserfs_panic+29/60>   <=====
> Trace; c01a1bcc <journal_mark_dirty+160/320>

Bye,
    Oleg
