From: Paul Wagland <paul@wagland.net>
Subject: Re: reiser4 and bonnie problems
Date: Tue, 20 Apr 2004 20:18:27 +0200
Message-ID: <1EA54599-92F7-11D8-B5AA-000A95CD704C@wagland.net>
References: <20040416203937.GY14134@nysv.org> <26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net> <2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net> <16516.54935.159587.423283@laputa.namesys.com> <61B07E02-92A8-11D8-8B4A-000A95CD704C@wagland.net> <16517.10147.704572.959551@laputa.namesys.com> <20040420145158.GC1579@backtop.namesys.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-1--1048791084"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040420145158.GC1579@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alex Zarochentsev <zam@Namesys.COM>
Cc: reiserfs-list@Namesys.COM, Nikita Danilov <Nikita@Namesys.COM>

--Apple-Mail-1--1048791084
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed


On Apr 20, 2004, at 16:51, Alex Zarochentsev wrote:

> On Tue, Apr 20, 2004 at 05:37:39PM +0400, Nikita Danilov wrote:
>> Paul Wagland writes:
>>> Just to summarise everything that is written below, this is what 
>>> bonnie
>>> is doing:
>>> 1. write 3.5 GB onto a 4GB partition. This works
>>> 2. delete 3.5 GB from a 4GB partition. This works.
>>
>> Disk blocks freed during transaction are not actually freed until
>> transaction commits.

Under what conditions do transactions get committed? Alex mentioned 
below that every write is an implicit commit. Is that the only 
situation? Other than sync obviously :-)

>>> 3. I check using df that the disk space is free. That works.
>>
>> But that "delayed freeing" confused users (they did cp, rm, but df has
>> still showed that space is used), so that statfs(2) (system call used 
>> by
>> df) was modified to take these delayed blocks into account and pretend
>> that they are free.

OK, that I can deal with, rm'ing a file should free the space ;-). 
However, if the transaction is not committed at this point, what 
happens if I lose power at this point? Is the filesystem rolled back to 
before the deletions?

>>> 4. write 3.5GB onto a 4GB partition. This fails.
>>
>> Try to repeat this with sync before step 4.

OK, here is the results of the test. I have decided to run it without 
bonnie, just to make sure that it was not the determining factor.

-----------------

tidbit:~# mount | grep /mnt/sdr
/dev/sdr1 on /mnt/sdr type reiser4 (rw)
tidbit:~# df /mnt/sdr
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdr1              3984228       292   3983936   1% /mnt/sdr
tidbit:~# dd if=/dev/zero of=/mnt/sdr/ddtest bs=512K count=7K ; rm 
/mnt/sdr/ddtest; df /mnt/sdr; dd if=/dev/zero of=/mnt/sdr/ddtest 
bs=512K count=7K ; rm /mnt/sdr/ddtest; df /mnt/sdr
7168+0 records in
7168+0 records out
3758096384 bytes transferred in 70.899981 seconds (53005605 bytes/sec)
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdr1              3984228       292   3983936   1% /mnt/sdr
dd: writing `/mnt/sdr/ddtest': No space left on device
613+0 records in
612+0 records out
321384448 bytes transferred in 3.378787 seconds (95118291 bytes/sec)
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdr1              3984228       296   3983932   1% /mnt/sdr
tidbit:~# dd if=/dev/zero of=/mnt/sdr/ddtest bs=512K count=7K ; rm 
/mnt/sdr/ddtest; df /mnt/sdr; sync; dd if=/dev/zero of=/mnt/sdr/ddtest 
bs=512K count=7K ; rm /mnt/sdr/ddtest; df /mnt/sdr
7168+0 records in
7168+0 records out
3758096384 bytes transferred in 73.244216 seconds (51309122 bytes/sec)
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdr1              3984228       296   3983932   1% /mnt/sdr
7168+0 records in
7168+0 records out
3758096384 bytes transferred in 70.666456 seconds (53180768 bytes/sec)
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdr1              3984228       292   3983936   1% /mnt/sdr

----------------


>>> At the time of failure, according to df there is stiff 3.5 GB
>>> free. So, I say that reiser4 has a problem.
>>
>> df lies.

No. df tells the user what reiser4 tells df. If df is lying it is 
because reiser4 has lied to it. If df tells me that there is 3.9GB 
available on the filesystem, then I expect that filesystem to allow me 
to write 3.9GB to it.

> reiser4_statfs() was changed to report deleted blocks as free space 
> immediately
> after rm(1).

As mentioned above, this makes perfect sense, and leads to more 
'intuitive' behaviour from the filesystem. I fully expect that the 
filesystem should change "established semantics", and in this sense the 
above change keeps these semantics, which is a good thing :-)

> It was done because reiser4_write() should trigger fs commit and 
> recover free
> space.   If commit does not happen, it is a reiser4 bug.

In that case I humbly submit that I have found a reiser4 bug :-)

Cheers,
Paul

--Apple-Mail-1--1048791084
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAhWl2tch0EvEFvxURAsC0AJ42vfD6efrWOVOZLqkmQJLqVDDNBQCglotq
4DeJxTX+Y4pJ+SwNqt2WILA=
=+v5C
-----END PGP SIGNATURE-----

--Apple-Mail-1--1048791084--

