From: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Subject: Re: reiser4progs 1.0.4
Date: Mon, 21 Feb 2005 15:35:11 +0100
Message-ID: <4219F19F.1030106@kmlinux.fjfi.cvut.cz>
References: <200502201344.41656.vitaly@namesys.com> <20050221131024.GA43266@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050221131024.GA43266@xs4all.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Ookhoi wrote:

 > Fatal: Failed to open the reiser4 backup.
 > Fatal: Cannot open the FileSystem on (/dev/hda1).
 >
 > 1 fatal corruptions were detected in SuperBlock. Run with --build-sb 
option to fix them.


Anyway, what is the preferred way to convert reiser4 to this new backup 
layout? I have all reiser4 partitions created with reiserfsprogs 1.0.0, 
so 1.0.3 & 1.0.4 bail out. Using fsck.reiser4 --build-sb from 
reiser4progs 1.0.3 rendered the filesystem created under 1.0.0 unusable, 
I still didn't try fsck 1.0.4. I also found the -C option of 
debugfs.reiser4, but it didn't help either, and subsequent fsck also 
botched the filesystem. Were there any fixes in 1.0.4 regarding this?

Thanks,
-- 
Jindrich Makovicka
