From: Hans Reiser <reiser@namesys.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Fri, 28 Nov 2003 08:46:25 -0800
Message-ID: <3FC77BE1.3070200@namesys.com>
References: <bq8f7u$ufn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bq8f7u$ufn$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Jens Benecke <jens-usenet@spamfreemail.de>
Cc: reiserfs-list@namesys.com

Jens Benecke wrote:

>Hi,
>
>I applied the 2.4.22 patches from Chris Mason's SuSE FTP directory for data
>logging etc:
>
>available at=20
>http://mirrors.mathematik.uni-bielefeld.de/pub/linux/suse/people/mason
>patches/data-logging/2.4.22/ or
>mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.22/
>
>root         3109 Jul 11 21:10 02-akpm-b_journal_head-1.diff
>root        17133 Jul 11 21:10 04-reiserfs-sync_fs-4.diff
>root       155659 Jul 11 21:09 05-data-logging-39.diff
>root          650 Jul 11 21:10 06-write_times.diff
>root        41276 Jul 11 21:09 07-reiserfs-quota-28.diff
>root         3275 Jul 11 21:15 08-kinoded-9.diff
>root         2653 Jul 11 21:10 10-reiserfs-quota-link-fix.diff
>root          898 Oct 10 12:25 README
>
>This system is running 2.4.22-kernel from Debian (stable) with the
>GRsecurity 1.9.12 patch, on P4 optimization and no other patches, except
>for the above.
>
>
>Two problems appeared with the above patches:
>
>a) Synchronizing with drbd (www.drbd.org) shared devices slowed down to=20
>   a crawl. I guess this might have something to do with the way drbd
>   inserts itself between block device and file system and the changed
>   sync behavoiur.
>   Sync rates were >5000k/s before and <500k/s after I patched.
>
>b) bonnie++ on a (previously created) reiserfs partition (with=20
>   mkreiserfs 3.6.6) exited with random "disk full" errors, although=20
>   the disk was never full. This didn't happen before.
>
>
>Details:
>
> =20
>
>>bonnie++ -d . -s 2048 -m master1 -r 1024 -x 2 -u nobody:nogroup
>>   =20
>>
>
>Now bonnie++ exits randomly with "no space left on device" when 'df' clear=
ly
>shows there is ample space left:
>
>Writing with putc()... =20
>Writing intelligently...
>Can't write block.
>Bonnie: drastic I/O error (write(2)): No space left on device
>
>-rw-------    1 nobody   nogroup  474931200 Nov 28 22:04 Bonnie.19345.000
>-rw-------    1 nobody   nogroup         0 Nov 28 22:04 Bonnie.19345.001
>
>Dateisystem          1k-Bl=F6cke    Benutzt Verf=FCgbar Ben% montiert auf
>/dev/ide/host0/bus0/target0/lun0/part7
>                       3044184    945424   2098760  32% /var
>
>
>This did not happen before I applied the patches.
>To be honest, I don't know how to debug this.
>
>There is nothing in the syslog and nothing via 'dmesg' related to drbd or
>reiserfs.
>
>
>I would appreciate any help.
>Thank you! :-)
>
>
> =20
>
there may be a holiday related delay in Chris's response, don't=20
interpret it as a lack of interest....

--=20
Hans


