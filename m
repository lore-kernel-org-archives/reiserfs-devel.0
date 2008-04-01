From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: bad block management
Date: Tue, 01 Apr 2008 15:51:51 -0400
Message-ID: <47F29257.3000502@suse.com>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de> <47F28DE5.1060402@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F28DE5.1060402@emc.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ric@emc.com
Cc: Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ric Wheeler wrote:
> 
> Christian Kujau wrote:
>> On Mon, 31 Mar 2008, kgp wrote:
>>> How ReiserFS manages bad blocks?
>>
>> Is reiserfsck's --badblocks option helpful?
>>
>>> If it is not supporting bad block management, plz tell me the
>>> approches we
>>> can use to implement bad block management in any file system. I am
>>> implementing bad block manager for UDF. I want some inputs
>>
>> Doesn't "Spared UDF" already provide some kind of bad block management?
>>
>> C.
> 
> I am not sure what you want to do with bad block management.
> 
> With most modern disk drives, they will remap bad disk sectors
> dynamically for you so the file system layer can stay out of the bad
> block mapping business entirely.

He's asking about UDF, though, so I'd imagine he's talking about optical
media. It's even cheaper than disk though, so I guess I don't see the
benefit.

Reiserfs handles bad blocks by allocating the blocks input as "known
bad" to special file that's inaccessible. It does _not_ do this
automatically, and reiserfsck/mkreiserfs must be passed a list of blocks
to allocate to that file. It also doesn't recover files that have been
corrupted to the block failure.

Ric's right about disk drives, though. They'll remap the bad sectors
automatically at the hardware level. When you start to see bad sectors
at the file system level, it means that the sectors reserved for
remapping have been exhausted and you should replace the disk.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFH8pJXLPWxlyuTD7IRAuX5AJ4xfX/hFL5i608lEZ9dBcXZ2cuxngCfTBq+
L0gkAhJOlbl4FUb7cgafaM8=
=YqBe
-----END PGP SIGNATURE-----
