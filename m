From: Will Dyson <will_dyson@pobox.com>
Subject: Re: Separating Indexing and Searching (was silent semantic changes
 with reiser4)
Date: Mon, 30 Aug 2004 23:22:20 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133EEEC.50201@pobox.com>
References: <96515990355-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <96515990355-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

> That brings up a good point, should the queries be allowed to run across
> file systems or be restricted to just one?  BeOS was restricted to one
> file system (the query evaluation code was file system specific) and
> faked it for multiple ones at the user level by repeating the query on
> each FS.  A separate Query FS wouldn't have that limit (or could fake
> it at the kernel level), if the kernel/FSs exported their indices and
> change notifications.

I don't see any fundamental reason why filesystem boundaries couldn't be 
crossed. A separate Query FS could even fake it by scrubbing the disk 
with /usr/bin/find for filesystems that didn't export indices. Probably 
a bad idea, of course. But painfully slow execution is not a reason it 
_couldn't_ be done. Some people even like pain...

-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
