From: Edward Shishkin <edward@namesys.com>
Subject: Re: Unsupported mkreiserfs and mount options
Date: Tue, 19 Oct 2004 19:47:35 +0400
Message-ID: <41753717.8050108@namesys.com>
References: <41750674.3060505@ribosome.natur.cuni.cz> <4175248B.5040905@namesys.com> <41752C7B.5080107@ribosome.natur.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41752C7B.5080107@ribosome.natur.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?Martin_MOKREJ=A9?= <mmokrejs@ribosome.natur.cuni.cz>
Cc: reiserfs-list@namesys.com

Martin MOKREJ=A9 wrote:

> Edward Shishkin wrote:
>
>> Martin MOKREJ=A9 wrote:
>
>
> sd(8,18):Using r5 hash to sort names
> reiserfs_getopt: head of option "hash" is only correct

Ahh, you specify the mount options a bit incorrect, first
use the "type" of the option:

mount -t reiserfs -o hash=3Dr5 /dev/sdb2 /scratch

> reiserfs_getopt: unknown option "no_unhashed_relocation"


use 'block-allocator' here, etc..

See http://www.namesys.com/mount-options.html
for details.

Edward

> reiserfs_getopt: unknown option "noborder"
> reiserfs: found format "3.6" with standard journal
> reiserfs: checking transaction log (device sd(8,18)) ...
> for (sd(8,18))
> sd(8,18):Using r5 hash to sort names
> reiserfs: found format "3.6" with standard journal
> reiserfs: checking transaction log (device sd(8,18)) ...
> for (sd(8,18))
> sd(8,18):Using r5 hash to sort names
> reiserfs_getopt: unknown option "r5"
>
>>> -----------------------------------------------------------------------=
-=20
>>>
>>>
>>> mkreiserfs -f -s 8192 -b 2048 /dev/sdb2
>>> Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>>> Format 3.6 with non-standard journal
>>> Count of blocks on the device: 638137920
>>> Number of blocks consumed by mkreiserfs formatting process: 47175
>>> Blocksize: 2048
>>> Hash function used to sort names: "r5"
>>> Journal Size 8192 blocks (first block 34)
>>> Journal Max transaction length 512
>>> inode generation number: 0
>>> UUID: f9c76801-44d4-4020-a5cf-b9e5aa76a707
>>> Initializing journal - 0%....20%....40%....60%....80%....100%
>>> Syncing..ok
>>> mount -t reiserfs /dev/sdb2 /scratch
>>> mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>>>       or too many mounted file systems
>>>       (aren't you trying to mount an extended partition,
>>>       instead of some logical partition inside?)
>>

