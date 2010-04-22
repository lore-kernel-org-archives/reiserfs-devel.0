From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: (nearly) full hd causes weird and corrupting behaviour of apps
 and tools
Date: Thu, 22 Apr 2010 15:10:21 -0400
Message-ID: <4BD09F1D.5020700@suse.com>
References: <20100419170223.1418c33d.melodramus@online.de>	<4BCC9D97.7090107@suse.com> <20100419220453.5af4ab06.melodramus@online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100419220453.5af4ab06.melodramus@online.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: melodramus@online.de
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/19/2010 04:04 PM, melodramus@online.de wrote:
> On Mon, 19 Apr 2010 14:14:47 -0400
> Jeff Mahoney <jeffm@suse.com> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>>
>> Deleting the log file isn't enough. You need to restart syslog. The file
>> can't really be deleted until all open references of it are gone.
>>
>> As for having space free but unable to use it, please attach the output
>> of debugreiserfs -o <dev>
>>
>> I've seen it happen before where a file system becomes badly fragmented
>> enough that new objectids can't be represented in the objectid map at
>> the start of the file system.
> 
> makes me wonder if apps can trust the posix interfaces in case a reiserfs is fragmented badly. will write() write to nil, and is fsync() reliable?

It's not an issue of fragmentation in the normal sense - it's an issue
of objectid fragmentation. Once an objectid is released, it can be
reclaimed. Fragmentation in the tree isn't an issue - it's just the map
that represents the allocations that can be an issue. There are just
certain cases - and I've only seen this in the wild exactly once - where
a heavy create-delete load in a pattern I haven't been able to reproduce
will cause the map to need more space than allotted to represent it.

Even if this were to occur, fsync() and write() are still reliable. It
will just return -ENOSPC when there is clearly space available.

> attached are the files before and after reiserfschk

Ok, thanks. They don't exhibit the problem I was thinking of.

- -Jeff
- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkvQnx0ACgkQLPWxlyuTD7JauwCgmgNAckDBOyWxKafX7QCh4275
FXAAniASL6yiubjOywq/tAddLPn6Znsv
=rpQ7
-----END PGP SIGNATURE-----
