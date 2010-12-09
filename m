From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Thu, 09 Dec 2010 10:57:35 -0500
Message-ID: <4D00FC6F.20308@suse.com>
References: <4CE7F21B.4050605@suse.com> <f6c1e36ad68ee3e4f57925e2f9969f40@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <f6c1e36ad68ee3e4f57925e2f9969f40@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/08/2010 08:13 AM, doiggl@velocitynet.com.au wrote:
> On Sat, 20 Nov 2010 11:06:51 -0500, Jeff Mahoney <jeffm@suse.com> wrote:
>> This patch contains the basic implementation for reiserfs 3.7.
>>
>>  Specifically, it extends reiserfs 3.6 to allow feature compatibility
> bits.
>>  Since it extends v3.6, it assumes allowing a nonstandard journal, so
> some
>>  paths have been adjusted to test for a nonstandard journal instead of
>>  just having the JR superblock magic.
>>
>>  I don't have any large plans to extend beyond some very basic features,
>>  although extended attributes would be much more efficiently implemented
>>  if they were first class items instead of hidden files.
>>
>>  The next patch in the series adds support to allow v2 stat data items
>>  to describe the number of blocks in fs-blocksize blocks instead of
>>  512 byte blocks.
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> 
> Thanks for the information. Is the module available for testing?.
> If so, where can I get the module from and can it be used  it with the
> opensuse factory series?

No, outside of the posting on this list, I haven't published it yet.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk0A/G8ACgkQLPWxlyuTD7LqywCfYKIL5U5pgak3WehG+1k0WI9y
GMoAn1/3805vsF8fB6V5YMoPBbn6P7Zz
=0FPw
-----END PGP SIGNATURE-----
