From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 03:31:05 +0200
Message-ID: <3D853459.4030709@mb.tu-ilmenau.de>
References: <20020916025655.E22362@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list-return-11456-manuel.krause=mb.tu-ilmenau.de@namesys.com
Cc: reiserfs-list <reiserfs-list@namesys.com>, reiserfs errors to <flx@namesys.com>

On 09/16/2002 02:56 AM,
reiserfs-list-return-11456-manuel.krause=mb.tu-ilmenau.de@namesys.com wrote:
> Pass 2:
> 
> # reiserfsck --rebuild-tree -S /dev/md0
> 
> ...
> 0%..rewrite_file: 2 items of file [97373 97385] moved to [97373 1591], 207
> /sec
> ..20%....40%..vpf-10260: The file we are inserting the new item (89 280
> 0x120001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format
> new) into has not StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (89 280 0x514001 IND
> (1), len 4048, location 48 entry count 0, fsck need 0, format new) into
> has not StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (89 280 0x908001 IND
> (1), len 4048, location 48 entry count 0, fsck need 0, format new) into
> has not StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (2035 3072665 0x10b001
> IND (1), len 1060, location 3036 entry count 0, fsck need 0, format new)
> into has not StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (2035 3072665 0x10b001
> IND (1), len 1060, location 3036 entry count 0, fsck need 0, format new)
> into has not StatData, insertion was skipped
> ufile.c 171 delete_N_items_after_key
> delete_N_items_after_key: No directory item of [32340 32341] are expected
> Aborted
> 
> I needed the rebuid because I had a multiple RAID disk death.
> 
> I restarted the check; if it dies again I'll append a core dump.
> 

Can you, please, retry with the latest release of reiserfs-progs

ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.3.tar.gz

or the latest beta

ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.4-pre1.tar.gz

and repost your results.

Thanks,

Manuel

! The first message refers to my personal related return-path in the
! headers officially, I'm not the sender or author of the original
! message. I'll send a different mail to flx@namesys.com as this is a
! definite error. If this is a user error or a problem with my
! browser/mail-app I want a definite hint. And I want the person that
! wrote that first mail to immediately stop writing under my
! return-path!

