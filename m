From: Edward Shishkin <edward@namesys.com>
Subject: Re: Unsupported mkreiserfs and mount options
Date: Tue, 19 Oct 2004 18:28:27 +0400
Message-ID: <4175248B.5040905@namesys.com>
References: <41750674.3060505@ribosome.natur.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41750674.3060505@ribosome.natur.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?Martin_MOKREJ=A9?= <mmokrejs@ribosome.natur.cuni.cz>
Cc: reiserfs-list@namesys.com

Martin MOKREJ=A9 wrote:

> Hi,
>  I'm doing some benchmarking of reiserfs on 2.4.28-pre3 system.
> I have crafted some non-standard options to mkreiserfs and mount,
> but they sometimes fail. I've attached only those which have failed.
> ;)
>
Hello.
Most cases take place because kernel doesn't support blocksize !=3D 4096.
I don't have any ideas why fs with standard journal created by '=20
mkreiserfs -f -h r5 /dev/sdb2'
is failed to mount. Would you please send us the kernel messages?

>  Am I right they don't work but should according to manpages?

What manpages do you mean? My 'man mkreiserfs' says the following:
      -b | --block-size N
              N is block size in bytes. 4096 only for now.

> Thanks for help
> Martin
> P.S.: Yes, some messages about unsupported bla bla got logged by syslog.
> Why cannot user see the on STDERR?=20

Because of restricted set of standard errors..

> I simply don't know what has
> generated what in syslog. :(

try the following (using your date) under root privileges:
cat /var/log/messages | grep '^Oct 19 17:3' | grep reiserfs

Edward.

>------------------------------------------------------------------------
>
>mkreiserfs -f -s 8192 -b 2048 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with non-standard journal
>Count of blocks on the device: 638137920
>Number of blocks consumed by mkreiserfs formatting process: 47175
>Blocksize: 2048
>Hash function used to sort names: "r5"
>Journal Size 8192 blocks (first block 34)
>Journal Max transaction length 512
>inode generation number: 0
>UUID: f9c76801-44d4-4020-a5cf-b9e5aa76a707
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
>mkreiserfs -f -s 8192 -b 8192 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with non-standard journal
>Count of blocks on the device: 159534480
>Number of blocks consumed by mkreiserfs formatting process: 10637
>Blocksize: 8192
>Hash function used to sort names: "r5"
>Journal Size 8192 blocks (first block 10)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: fcfa840c-4170-421a-9383-cebaf2d78b58
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>mkreiserfs -f -h r5 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 319068960
>Number of blocks consumed by mkreiserfs formatting process: 17949
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: 2fa671ed-eb3e-4e4f-b59c-040502c6d7b4
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs -o r5 /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
>mkreiserfs -f -h yura /dev/sdb2
>mkreiserfs: wrong hash type specified. Using default
>mkreiserfs 3.6.17 (2003 www.namesys.com)
>
>
>mkreiserfs -f -t 16384 /dev/sdb2
>mkreiserfs 3.6.17 (2003 www.namesys.com)
>WARNING: wrong transaction max size (16384). Changed to 1024
>
>
>mkreiserfs -f -t 65535 /dev/sdb2
>mkreiserfs 3.6.17 (2003 www.namesys.com)
>WARNING: wrong transaction max size (65535). Changed to 1024
>
>
>mkreiserfs -f -t 131072 /dev/sdb2
>mkreiserfs 3.6.17 (2003 www.namesys.com)
>WARNING: wrong transaction max size (131072). Changed to 1024
>
>
>mkreiserfs -f -h r5 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 319068960
>Number of blocks consumed by mkreiserfs formatting process: 17949
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: 2b54ffa7-068a-428b-bc7b-a8b3ba80400b
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs -o hashed_relocation /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
>mkreiserfs -f -h r5 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 319068960
>Number of blocks consumed by mkreiserfs formatting process: 17949
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: e2d5da73-0359-4bc1-bfcb-6dad0a80efe6
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs -o no_unhashed_relocation /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
>mkreiserfs -f -h r5 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 319068960
>Number of blocks consumed by mkreiserfs formatting process: 17949
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: 10caff17-0e91-4517-814b-fc407a996985
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs -o noborder /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
>mkreiserfs -f -h r5 /dev/sdb2
>Guessing about desired format.. Kernel 2.4.28-pre3 is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 319068960
>Number of blocks consumed by mkreiserfs formatting process: 17949
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: c2edaab9-1b24-459b-ba62-722798e0745d
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>mount -t reiserfs -o r5 /dev/sdb2 /scratch
>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       or too many mounted file systems
>       (aren't you trying to mount an extended partition,
>       instead of some logical partition inside?)
>
>
>
> =20
>

