From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 mount options
Date: Mon, 19 Sep 2005 18:52:04 +0400
Message-ID: <432ED094.7090301@namesys.com>
References: <dgkvq7$5lo$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dgkvq7$5lo$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ritesh Raj Sarraf <riteshsarraf@users.sourceforge.net>
Cc: reiserfs-list@namesys.com

Hello

Ritesh Raj Sarraf wrote:
> Hello People,
> 
> Despite the fact said that reiser4 is not stable so isn't included in
> mainline kernel, I trusted Hans Reiser's statement that they've not been
> able to crash the fs in the labs.
> 

Well, there are known ways to crash reiser4 and we are working to fix that. However, my desktop is reiser4 but /boot for more than year already.

> I just migrated my laptop from plain partitions with ext3 to Reiser4 on LVM.
> Till now, I'm pretty happy with the performance.
> 2.2 gigs of files in ext3 show 1.9 gigs in Reiser4. Thanks to all your work.
> Disk access is almost doubled. I haven't measured it, I just feel it.

Remember that it is yet experimental. Backup important things regularly. You have to do that even you used the most reliable fs in the world, though.

> 
> Thanks to all of you.
> 
> Some questions,
> What mount options should one use for laptops ? (Right now I'm using
> "defaults")

There are no one which are designed for laptops. Most of them were created to measure impact of various things on performance and default are set based on some
experemnts with those mount options. On short, there is not need to vary mount options unless you wish to do some experements.

> When can we have the reiser4 version of filesystem resize utility ?
> 

There is no reiser4 resizer yet.
