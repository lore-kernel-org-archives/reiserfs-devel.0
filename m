From: Julian Hall <jules@acris.co.uk>
Subject: Re: Reiserfs with standard journal found, but there was specified
 a journal dev
Date: Mon, 10 Mar 2003 19:30:27 +0000
Message-ID: <3E6CE7D3.1060903@acris.co.uk>
References: <3E6CE176.5030906@acris.co.uk> <3E6CE559.1010400@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6CE559.1010400@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com



Yury Umanets wrote:

> I can do the following:
> (1) Backup your data by using dd (if you are sure, that your drive has 
> not bad blocks on it) or dd_rescue otherwise 
> (http://www.garloff.de/kurt/linux/ddrescue/).
>
> (2) Rebuild superblock by means of using reiserfsck --rebuild-sb
> (3) Usual fsck check and following to its instructions.

That's essentially what I was trying to do, but --rebuild-sb won't run. 
 I've tried --no-journal-available also (what the heck, it's only a copy 
of the data...!), but that wouldn't work either (same message: "super.c 
228 rebuild_sb // Reiserfs with standard journal found, but there was 
specified a journal dev").

I'm stumped now.  Anyone got any more suggestions?


