From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Wed, 03 Sep 2003 02:17:50 +0400
Message-ID: <3F55170E.1080603@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <20030829131250.GU24767@marowsky-bree.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030829131250.GU24767@marowsky-bree.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Lars Marowsky-Bree <lmb@suse.de>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Lars Marowsky-Bree wrote:

>On 2003-08-28T20:18:14,
>   Tom Vier <tmv@comcast.net> said:
>
> =20
>
>>and shell builtins would have to be modded to insure page alignment. it
>>would be neat if all the regular builtins (cp, mv, ln) were atomic.
>>   =20
>>
>
>mv (ie, rename), ln and rm have always been atomic. That's a POSIX
>requirement.
>
Programs that need atomicity find it inconvenient that only one mv, or=20
one ln, and or one rm, or one 4k write of a block, are atomic operations.

>The new thing with reiserfs4 seems to be that if you do a write of, say,
>1M size in the atomic way,=20
>

>another reading process will either see all
>of the write or none of the write to have taken place.
>
No, isolation is not yet implemented and won't be unless we come up with=20
some more funding from somewhere.  The txnmgr seems to be structured to=20
handle isolation, but....

The new thing with reiser4 is that if you do that write of 1MB to a=20
file, and perhaps updates to 63 other files as well, as part of an atom,=20
it will either all survive a crash, or none of it will.  We have=20
considered using the term "transcrash" for this.

>(Right now, you could see a 'partial' read, where some pages from the
>write have been written already while others return the old data.)
>
>And apparently, you can say "begin transaction" and "commit / abort
>transaction" to achieve the same for multiple operations as a group.
>
>Hans, does that support nested transactions, too?
>
>And one thing has slipped from my mind: How do I enter a transaction? is
>it like chroot(), or a task-specific thing, how can child processes
>participate in the transaction etc?
>
>
>Sincerely,
>    Lars Marowsky-Br=E9e <lmb@suse.de>
>
> =20
>


--=20
Hans


