From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Thu, 3 Jun 2004 15:51:42 +0300
Message-ID: <200406031551.43093.rmeijer@internet.gr>
References: <200406021554.11690.rmeijer@internet.gr> <200406031407.32025.rmeijer@internet.gr> <200406031417.51895.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406031417.51895.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 3 June 2004 14:17, Raymond A. Meijer wrote:

> I'll reboot into single user mode, rebuild the FS and try again to boot into
> 2.6.6 and 2.6.7-rc1...
> 
> Keeping you posted...

There were MANY errors, but fsck.reiser4 fixed them all.

But it didn't help...still the same errors in 2.6.6-mm2 and 2.6.7-rc1-mm2...

I even reformatted the partition and restored a backup, and it still wouldn't
work!

However, I just discovered that my CFLAGS environment variable is by default
set to "-O3 -Wall -march=i686 -mcpu=i686 -msse2 -mfpmath=sse"!

So, I'll recompile a vanilla kernel with no optimisations and only the mm and
Reiser4 patches applied...

Here we go again! :)


Ray
