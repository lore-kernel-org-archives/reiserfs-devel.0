From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Tue, 4 Mar 2003 16:29:10 +0100
Message-ID: <20030304162910.2bd2f5bc.philippe.gramoulle@mmania.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com>
	<20030304111807.A18814@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13063-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030304111807.A18814@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>


Hi Oleg,

On Tue, 4 Mar 2003 11:18:07 +0300
Oleg Drokin <green@namesys.com> wrote:


  | Hello!
  | 
  | On Tue, Mar 04, 2003 at 01:34:50AM +0100, Philippe Gramoull? wrote:
  | 
  | > Could you please rediff the patch for the DIRECT IO bug fix (pre5) against 2.4.21-pre4 + 
  | > data-logging patches ? ( I've tried to merge it manually, but there are too many non trivial rejects
  | > for me to dare feeling comfortable :o)
  | 
  | Is it possible for you to use 2.4.21-pre5 instead of 2.4.21-pre4?
[snip]

Kernel is up and running with all patches applied for about 1h30, and so far it rocks ;)
while at the same time other non patched kernels still continue oops ( normal ,as nothing changed )

The other good news are : Load average is significantly lower, down from 4 or 6 to less than 1
on the filer that caused us most of the problems.

I didn't changed the journaling default (ordered) and FYI, mount options are as follow:
defaults,noatime,nodiratime,notail,grpquota

I don't want to say "hurra" too early but signs are really positive that the bugs that we hit
have been fixed and i can't congratulate you more are people were starting to get mad around me ;o)

I'll let it run for a little while now and upgrade all other servers so we'll be almost sure wether ot not
this problem has been fixed for good :o)

I'll also run a quotacheck early tomorrow at the most off hours and will send a report then.

Thanks again for all efforts that were put to solve this issue.

Philippe
