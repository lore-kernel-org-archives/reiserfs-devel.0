From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs with standard journal found, but there was specified a journal dev
Date: Tue, 11 Mar 2003 09:48:08 +0300
Message-ID: <20030311094808.B28591@namesys.com>
References: <3E6CE176.5030906@acris.co.uk> <3E6CE559.1010400@namesys.com> <3E6CE7D3.1060903@acris.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E6CE7D3.1060903@acris.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Hall <jules@acris.co.uk>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com

Hello!

On Mon, Mar 10, 2003 at 07:30:27PM +0000, Julian Hall wrote:
> >I can do the following:
> >(1) Backup your data by using dd (if you are sure, that your drive has 
> >not bad blocks on it) or dd_rescue otherwise 
> >(http://www.garloff.de/kurt/linux/ddrescue/).
> >
> >(2) Rebuild superblock by means of using reiserfsck --rebuild-sb
> >(3) Usual fsck check and following to its instructions.
> That's essentially what I was trying to do, but --rebuild-sb won't run. 
> I've tried --no-journal-available also (what the heck, it's only a copy 
> of the data...!), but that wouldn't work either (same message: "super.c 
> 228 rebuild_sb // Reiserfs with standard journal found, but there was 
> specified a journal dev").
> I'm stumped now.  Anyone got any more suggestions?

Please try reiserfsprogs-3.6.5-pre2, I think I remember something about similar problem
being fixed.

Thank you.

Bye,
    Oleg
