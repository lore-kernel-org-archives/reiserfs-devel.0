From: Yury Umanets <umka@namesys.com>
Subject: Re: Reiserfs with standard journal found, but there was specified
 a journal dev
Date: Mon, 10 Mar 2003 22:19:53 +0300
Message-ID: <3E6CE559.1010400@namesys.com>
References: <3E6CE176.5030906@acris.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6CE176.5030906@acris.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julian Hall <jules@acris.co.uk>
Cc: reiserfs-list@namesys.com

Julian Hall wrote:

> My FS never had an external journal device.  I've used 'dd' to 
> transfer it to a different partition and am trying to get it to work, 
> but I get the following messages from reiserfsck:
>
> vengeance:~# reiserfsck --rebuild-sb /dev/hdc1
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.4
> [...]
> Will check superblock and rebuild it if needed
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you 
> do):Yes
> super.c 228 rebuild_sb
> Reiserfs with standard journal found, but there was specified a 
> journal dev 

It means, that superblock has journal dev field initialized by not zero.

>
>
>
> Do I need to use the --no-journal-available option?  Or is it 
> something else.  If I just run --check rather than anything else, it 
> manages to check the journal OK, but then complains that 
> --rebuild-tree didn't finish last time. 

I can do the following:
(1) Backup your data by using dd (if you are sure, that your drive has 
not bad blocks on it) or dd_rescue otherwise 
(http://www.garloff.de/kurt/linux/ddrescue/).

(2) Rebuild superblock by means of using reiserfsck --rebuild-sb
(3) Usual fsck check and following to its instructions.

>
>
> Any ideas?
>
> Jules
>
>
>
>


-- 
Yury Umanets


