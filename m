From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Wed, 03 Sep 2003 20:56:05 +0400
Message-ID: <3F561D25.1080705@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <20030829131250.GU24767@marowsky-bree.de> <3F55170E.1080603@namesys.com> <20030903105211.GC5762@marowsky-bree.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903105211.GC5762@marowsky-bree.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Lars Marowsky-Bree <lmb@suse.de>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Lars Marowsky-Bree wrote:

>On 2003-09-03T02:17:50,
>   Hans Reiser <reiser@namesys.com> said:
>
> =20
>
>>No, isolation is not yet implemented and won't be unless we come up with =

>>some more funding from somewhere.  The txnmgr seems to be structured to=20
>>handle isolation, but....
>>   =20
>>
>
>Ah, okay. Sorry, I think I had older plans in mind and hadn't checked
>how far the current roadmap matched up to them ;-)
>
> =20
>
>>The new thing with reiser4 is that if you do that write of 1MB to a=20
>>file, and perhaps updates to 63 other files as well, as part of an atom, =

>>it will either all survive a crash, or none of it will.  We have=20
>>considered using the term "transcrash" for this.
>>   =20
>>
>
>So it's ACD and not ACID ;-) Sounds good. How is this weak transaction
>exported to userspace, ie how do I signal BEGIN and COMMIT/ABORT?
>
>
>
>Sincerely,
>    Lars Marowsky-Br=E9e <lmb@suse.de>
>
> =20
>
sys_reiser4 allows various operations such as assignment, and=20
transactions are indicated using a delimiter.  I am still trying to=20
figure out what is the best delimiter to use, it needs to be a delimiter=20
pair, but what?

Perhaps t{ and }t

?

I worry that users will let a legitimate t variable name get too close=20
to the {}'s.....

There is a symbol shortage unfortunately.

Probably I should use x{ and }x as a convention for new kinds of=20
delimiters, and let x be t in the case of delimiting transactions.

--=20
Hans


