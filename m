From: Hans Reiser <reiser@namesys.com>
Subject: Re: ext3 -> reiserfs conversion utility?
Date: Sat, 19 Jun 2004 00:25:01 -0700
Message-ID: <40D3EA4D.4000303@namesys.com>
References: <57818.192.168.1.12.1087599726.squirrel@192.168.1.12> <40D3BA63.70307@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D3BA63.70307@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Nick Bartos <spam99@2thebatcave.com>, reiserfs-list@namesys.com

David Masover wrote:

>
>
> Nick Bartos wrote:
> <snip>
> | From what I am reading, everyone just backs up their files and then
> | reformats & restores the files.
>
> For any two filesystems, it's highly unlikely that you can just convert
> between the two.  I mean, theoretically yes, practically?  There's not
> even funding (I think) for a reiser 3-4 conversion.

No, read about convertfs, it uses loop back file mounting and vfs, and 
it is very clever and elegant.

