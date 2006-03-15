From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Static overrun in reiser3
Date: Wed, 15 Mar 2006 17:07:54 -0500
Message-ID: <4418903A.2050501@suse.com>
References: <44188907.50100@suse.com> <44188BD2.50709@namesys.com> <44188D9E.8060204@suse.com> <44188EB2.80806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44188EB2.80806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, vs <vs@thebsh.namesys.com>, Edward Shishkin <edward@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeff Mahoney wrote:
> 
>> Hans Reiser wrote:
>>
>>> Jeff Mahoney wrote:
>>>> Hi Hans -
>>>>
>>>> I've been playing around with the Coverity code checker, and while I
>>>> think it still sees a few too many false positives, it's a good tool.
>>> Thanks for doing that work!  If you could do it for V4, that would be
>>> great too.  If not, maybe Edward could do it.
>>
>> Ah, sorry, all I can do is review their database. I can't actually run
>> the checker myself.
> 
> Ah, so there is a database somewhere that we can look at?

Yes, you have to register at scan.coverity.com. There was a medium-sized
thread on LKML about it around two weeks ago.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEGJA6LPWxlyuTD7IRAvcpAKCUvdOSMQYP9WD3IF8Qm3i2mxomaACgm0PL
VnxXK5P6mKc37FDNCl0tvCs=
=wCll
-----END PGP SIGNATURE-----
