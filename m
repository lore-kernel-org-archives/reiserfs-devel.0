From: Steven Cole <elenstev@mesatop.com>
Subject: Re: Reiser4 shows Type: UNKNOWN with stat -f mountpoint
Date: Fri, 02 Apr 2004 07:48:13 -0700
Message-ID: <1080917293.2206.32.camel@spc0.esa.lanl.gov>
References: <1080860231.2206.18.camel@spc0.esa.lanl.gov>
	 <20040402005242.GA1177@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040402005242.GA1177@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, meskes@debian.org

On Thu, 2004-04-01 at 17:52, Andreas Dilger wrote:
> On Apr 01, 2004  15:57 -0700, Steven Cole wrote:
> > I noticed that stat -f returns UNKNOWN for Type for a reiser4
> > filesystem, while working OK* with other filesystems.  The version
> > of stat used is 5.0.  If this is the fault of the stat command and not
> > reiser4, sorry for the noise.
> 
> > [steven@spc2 testing-2.6]$ stat -f /r4_testing
> >   File: "/r4_testing"
> >     ID: 0        Namelen: 3976    Type: UNKNOWN (0x52345362)
> > Blocks: Total: 982670     Free: 907053     Available: 907053     Size: 4096
> > Inodes: Total: 0          Free: 0
> 
> Yes, the filesystem magic numbers are built into stat, and it probably
> hasn't been updated to understand reiser4 yet.  This can probably be
> fixed by sending a patch to the fileutils/coreutils maintainers.
> 
> Cheers, Andreas

Thanks. Adding meskes@debian.org to the cc list.
Patch to fix coreutils 5.2.1 stat for reiser4 is included below.

I got the coreutils source and fixed it.  The include file is
evidently automatically generated from the source .c file.
From src/stat.c:
# if defined __linux__

      /* IMPORTANT NOTE: Each of the following `case S_MAGIC_...:'
         statements must be followed by a hexadecimal constant in
         a comment.  The S_MAGIC_... name and constant are automatically
         combined to produce the #define directives in fs.h.  */

I modified src/stat.c for reiser4, built coreutils and tested
the new stat with reiser4.  And src/fs.h did get updated automatically.
How nice.

[steven@spc2 coreutils-5.2.1]$ cat src/fs.h
/* Define the magic numbers as given by statfs(2).
   Please send additions to meskes@debian.org.
   This file is generated automatically from ./stat.c. */

#if defined __linux__
# define S_MAGIC_AFFS 0xADFF
# define S_MAGIC_DEVPTS 0x1CD1
[snipped]
# define S_MAGIC_REISERFS 0x52654973
# define S_MAGIC_CRAMFS 0x28cd3d45
# define S_MAGIC_ROMFS 0x7275
# define S_MAGIC_REISER4 0x52345362
#elif defined __GNU__
# include <hurd/hurd_types.h>
#endif

[steven@spc2 coreutils-5.2.1]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    156840    601076  21% /
/dev/sda8     ext3     7147260   5629872   1154324  83% /home
none         tmpfs      257456         0    257456   0% /dev/shm
/dev/sda6     ext3     4024188   1874192   1945572  50% /usr
/dev/sda7     ext3      806368    131768    633636  18% /var
/dev/sda9  reiser4     3930680    302468   3628212   8% /r4_testing

[steven@spc2 coreutils-5.2.1]$ ./src/stat -f /r4_testing
  File: "/r4_testing"
    ID: 0        Namelen: 3976    Type: reiser4
Blocks: Total: 982670     Free: 907053     Available: 907053     Size: 4096
Inodes: Total: 0          Free: 0

Here is the patch:

Steven

--- coreutils-5.2.1/src/stat.c.original	2004-04-02 07:12:55.237719104 -0700
+++ coreutils-5.2.1/src/stat.c	2004-04-02 07:18:15.584019064 -0700
@@ -217,6 +217,9 @@
     case S_MAGIC_ROMFS: /* 0x7275 */
       type = "romfs";
       break;
+    case S_MAGIC_REISER4: /* 0x52345362 */
+      type = "reiser4";
+      break;
 # elif __GNU__
     case FSTYPE_UFS:
       type = "ufs";


