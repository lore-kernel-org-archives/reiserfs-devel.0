From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: setfacl curiously slow
Date: Wed, 13 Sep 2006 09:55:58 -0400
Message-ID: <45080DEE.9080606@suse.com>
References: <a7466f460609121223t35ee8500x24e72f989029b611@mail.gmail.com> <200609122323.00866.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609122323.00866.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Dragan Krnic <dkrnic@googlemail.com>, reiserfs-list@namesys.com, support@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
> 
> On Tuesday 12 September 2006 23:23, Dragan Krnic wrote:
>> Hi, everyone,
>>
>> I've migrated important user data from an older PC to some fairly
>> contemporary hardware.
>>
>> The old hardware was Intel Pentium 4 3 GHz, single CPU, 2 GB RAM,
>> 6 x 250 GB S-ATA connected via 2 Promise Tx2 cards and the on-board
>> 2-port controller, managed as a software raid5 with 5 disks and 1 spare,
>> with 83% used up, which is about 790 gigibytes net.
>>
>> The new hardware is a Tyan S2895, 2 dual-core Opteron280, 8 GB RAM,
>> 8 x 500 GB S-ATA connected via Areca ARC-1120 133 MHz/64-bit PCI-X
>> 8-port, managed as a hardware raid5 with 8 disks no spares.
>>
>> The tar backup of the old machine to a second similarly new PC ran at
>> about 30 MB/s. The tar restore onto the new hardware was about twice as
>> fast, as was expected.
>>
>> But! The restoration of ACLs took an enormous amount of time.
>>
>> The ACLs backup was created on the old machine in about 28 minutes,
>> but it took 74 minutes to restore the ACLs on the new hardware. During
>> that time the disk activity looked like what you can see in the enclosed
>> PDF file. Short intervals of intense writing with much longer intervals of
>> inactivity. In top the process "setfacl --restore=acls.local" and "pdflush"
>> were in state "D" all the time. From time to time a process "reiserfsd"
>> joined them in the same state.
>>
>> A login to the computer during that time was considerably slowed down.
>> Otherwise the computer was still free from any load.
>>
>> I'm not sure if that's a problem or just normal but you will know better.
>>
> 
> I believe Jeff as reiserfs acl author will be interested by this question.
> But may I ask you to try your test on ext2 to check whether ACL restoring is 
> much faster there?
> 
>> There were 796,115 files to apply ACLs to.

What file system was on the old hardware? Taking longer to restore the
ACLs than backing them up isn't notable at all. It's expected that reads
are faster than writes.

pdflush is responsible for flushing dirty pages to disk, kreiserfsd is
the journal commit thread. Both are essential for writing on a reiserfs
file system, and their being in "D" state is normal.

It's known that ACLs on reiserfs have performance issues. There's been
several threads on this list and linux-kernel discussing it and we don't
need to rehash them.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFCA3uLPWxlyuTD7IRAjlSAJ9z+XmFVQqBQ2oisUjNOPfR5NM5bQCgmmOj
0grcUTiDnMrxJAfzxbBKNB8=
=5Iva
-----END PGP SIGNATURE-----
