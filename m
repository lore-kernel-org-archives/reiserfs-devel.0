From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages.
Date: Wed, 5 Mar 2003 23:53:29 +0100
Message-ID: <14585980078.20030305235329@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C079D@CORPUSMX1>
 <3885785484.20030305235014@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3885785484.20030305235014@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>>         You may want to look at the latest from SuSE. I've been mostly
>> successful with lk 2.4.19 on the pdc202xx driver with Maxtor 250GB drives on
>> a Tyan PIII motherboard. I added IDE write barrier patches from Chris Mason
>> and Jens Axboe and ran into the "drive not ready for command" errors. This
>> was subsequently fixed by Jens for a 2.4.20 kernel and I've back ported that
>> bit for the 2.4.19 kernel I'm testing. The status errors are gone but now
>> I'm investigating filesystem coruptions on my ReiserFS partitions.

> I  am currently running 2.4.21-pre4. It seem to keep most other things
> working, except for the "drive not ready for command" error.

> It might be worth testing 2.4.19 kernel with these patches then. I did
> try with mandrake 2.4.19 without success though.

> Also, am going to try 2.5.64 too.

Might  be  something to do with APIC and/or ACPI/APM too. Have to test
with/without these options.

--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

