From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: Why is Reiser4 slower then ReiserFS v3
Date: Wed, 29 Dec 2004 07:34:42 +0100
Message-ID: <20041229073442.4eb4bd3c.reiser4@blinkenlights.ch>
References: <231dafb5041227123867a2c873@mail.gmail.com>
	<20041228195239.3a1531d5.reiser4@blinkenlights.ch>
	<41D1D32C.1020407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D1D32C.1020407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hello Hans,

> There was a read slowdown, in latest release of reiser4, see patch I 
> cc'd this list on a few emails ago.

I saw the patch 5 seconds after i've posted my message ;)

I'll re-run my test using the patch and with/without the extents
option..

> Did you time the sync command or?

I ran a 'sync' after each test, but i didn't time it..
But i didn't feel a difference between the sync on
Reiser3 and Reiser4.. synching took less than 1/2 second on both
filesystems.


> How large was the fileset created compared to RAM?

I only created this 195075 directories, i've got about
1gb free RAM

When i re-run the test, i'll reboot after each command to get
an empty cache

Thanks,
 Adrian


