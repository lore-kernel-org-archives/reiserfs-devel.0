From: Anders Widman <andewid@tnonline.net>
Subject: Re: power loss -> corruption
Date: Fri, 16 May 2003 00:38:13 +0200 (CEST)
Message-ID: <1245.213.204.144.196.1053038293.squirrel@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Am Donnerstag, 15. Mai 2003 10:40 schrieb Mirar:
>> > This _is_ very well known for me.
>> > Some KDE config files and my tcsh history file where broken without
>> > data-logging (data=journal/ordered).
>>
>> My .zsh-history just got nuked with data=ordered.
>>
>> The kernel couldn't agree with my HPT controller and stopped all (!)
>> IDE activities when I did a 'hdparm -y /dev/hd?' (all sleep). (Note,
>> the .zsh-history was not on that controller.)

Hm..  Are  you sure you are using the right command? "-Y" is SLEEP and
"-y"  is STANDBY mode. With stand by mode the drive spins up by itself
when  data  is  requested.  However when you use sleep mode it needs a
reset to wake up again (or if the driver can issue a soft reset).

Even  if  the  drive spins back up there can be transfer errors or DMA
problems that follows. IF you want a reliable configuration you should
not use power-save mode. It is not very well supported on all hardware
in Linux :(


> In short, DON'T DO THAT without "suspend kernel patches".
> *nix is NOT designed for "disk power management" in the first place.
> But it evolves...;-)

> HPT ("small" IDE/ATA "RAID") controllers are not that good (supported)
as they
> seems. Apart that they are "cheap".

>> Not in the same way as previously (just a block), though. It was
>> completely filled with binary data.

> Sounds like another problem (hardware, see above).

>> No other active files seems to have been affected, though.

> Good.

> -Dieter






--------
PGP public key: https://tnonline.net/secure/pgp_key.txt


