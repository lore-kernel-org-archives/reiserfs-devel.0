From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Reiser4 shows Type: UNKNOWN with stat -f mountpoint
Date: Thu, 1 Apr 2004 17:52:42 -0700
Message-ID: <20040402005242.GA1177@schnapps.adilger.int>
References: <1080860231.2206.18.camel@spc0.esa.lanl.gov>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080860231.2206.18.camel@spc0.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Cole <elenstev@mesatop.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

On Apr 01, 2004  15:57 -0700, Steven Cole wrote:
> I noticed that stat -f returns UNKNOWN for Type for a reiser4
> filesystem, while working OK* with other filesystems.  The version
> of stat used is 5.0.  If this is the fault of the stat command and not
> reiser4, sorry for the noise.

> [steven@spc2 testing-2.6]$ stat -f /r4_testing
>   File: "/r4_testing"
>     ID: 0        Namelen: 3976    Type: UNKNOWN (0x52345362)
> Blocks: Total: 982670     Free: 907053     Available: 907053     Size: 4096
> Inodes: Total: 0          Free: 0

Yes, the filesystem magic numbers are built into stat, and it probably
hasn't been updated to understand reiser4 yet.  This can probably be
fixed by sending a patch to the fileutils/coreutils maintainers.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

