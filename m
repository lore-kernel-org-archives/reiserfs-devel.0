From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser FS will not boot after crash
Date: Wed, 13 Sep 2006 10:00:08 -0400
Message-ID: <45080EE8.4050702@suse.com>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com> <200609042333.27778.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609042333.27778.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, jmh5@nei.mv.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
> 
> On Monday 04 September 2006 23:26, jmh5@nei.mv.com wrote:
>> Hi,
>>
>>   I am observing the following Reiser failure:
>>
>>   I am trying to use camorama with a Creative WebCam Live spca5xx driver
>> (recently downloaded and compiled) . Camorama does not start and computer
>> freezes (no response to mouse, or keyboard. Can't change to terminal
>> window.
>>
>>   Reset or pull plug leaves Knoppix 5.0.1-DVD unbootable:
>>
>>   The actual message from GRUB is inconsistent filesystem?! From a boot
>> loader?
> 
> after unclean shutdown journal reply is necessary to return reiserfs to 
> consistent state. Maybe GRUB did not do that?

Grub uses the journal in a read-only mode. It doesn't replay it in a
writable fashion. When grub needs a block, it scans the blocks used in
the journal, and uses the most recent copy it finds there before looking
out to the rest of the file system.

>>   The 'fix' is even stranger. I execute fsck.reiserfs from another OS
>> partition on the Knoppix 5.0.1-DVD partition (takes forever). 
> 
> Did fsck complete? What did it report?
> 
>> Somehow 
>> 'reading' the Knoppix filesystem 'fixes' whatever was preventing Knoppix
>> 5.0.1-DVD from booting.
>>
> 
> fsck replayed the journal.
> Does camorama work now?
> 
> If it still causes computer freeze - can you please install serial or network 
> console and try to catch what does kernel output when it freezes.

If the system doesn't work still, I believe grub has a debugging output
mode that could yield more information. You'd need to rebuild and
reinstall it.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFCA7nLPWxlyuTD7IRAh4DAJwOP1vihfFBRSWT9p8i5MXTxzEP+QCeI3mJ
7P2HrZdP1Hy1BbvhPi8bXbo=
=k2E8
-----END PGP SIGNATURE-----
