From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Mon, 18 Jul 2005 11:59:49 -0400
Message-ID: <42DBD1F5.5030105@suse.com>
References: <42DAB928.9000303@namesys.com> <200507181701.26284.russell@coker.com.au> <42DB5DB3.3020809@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DB5DB3.3020809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: russell@coker.com.au, reiserfs-list@namesys.com, fedora-test-list@redhat.com, reiser@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> Russell Coker wrote:
> 
>> On Monday 18 July 2005 06:01, Edward Shishkin <edward@namesys.com> wrote:
>>  
>>
>>> FC4-test3 (and perhaps FC4) installs its own version of grub which seems
>>> to interact incorrectly with reiserfs. The problem is that reiserfs.ko
>>> module located on reiserfs partition can not be loaded.
>>>   
>>
>> Firstly there is no situation in which reiserfs.ko will be loaded from
>> a reiserfs partition.
>>  
>>
> 
> Hmmm... actually this is a default situation when installing with root
> on reiserfs..
> 
>> If the root file system is reiserfs then reiserfs.ko will (or at least
>> should) be included in the initrd.
> 
> Right, but initrd is in /boot which is not something separate: it is on the
> same reiserfs root partition..

The situation you're describing is one that is well tested by now.

If the root filesystem is reiserfs, and /boot is a part of it,
reiserfs.ko MUST be in the initrd. Otherwise, there is a chicken/egg
problem and the system will not boot.

The initrd being on a reiserfs filesystem is fine since grub doesn't use
any kernel services when it's executing. Grub loads the kernel and the
initrd itself before transferring control to the kernel and uses no
kernel services to do so. Grub has its own filesystem reading code which
gets pointed to during installation.

So, if there is truly a problem with this, I'd look at Fedora's mkinitrd.

- -Jeff


- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFC29H1LPWxlyuTD7IRAv6sAJ4wwM6ArTI+P8NeC2Xr2fMdiSW/6QCbB9wh
/Co71RNi4Uq3a6tatRQDjiw=
=EHOF
-----END PGP SIGNATURE-----
