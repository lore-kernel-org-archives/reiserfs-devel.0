From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Lost Files
Date: Wed, 29 Oct 2003 14:01:55 +0100
Message-ID: <3F9FBA43.8000203@gmx.net>
References: <200310290906.h9T96nsO020624@mail02.webpoint.co.at> <3F9FA820.80208@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9FA820.80208@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Waller <a.waller@webpoint.at>, reiserfs-list@namesys.com, webmaster@webpoint.at

Hans Reiser wrote:
> Alexander Waller wrote:
>=20
>> Hi !
>> Yesterday it was the third time I lost important files on a
>> reiserfs-partition.
>> This time I had a reasonable backup.
>> So i could minimize the time my server was offline.
>> I use S.u.S.E 8.2.
>> The first to times reiserfsck was not able to repair any file. I found=

>> all
>> of them in the directory /lost+found, but that was not good for me. (
>> 11000
>> files there )
>> This time about 5000 files were in /lost+found and the rest in the rig=
ht
>> place.
>>
>> Is this a normal behavior or do you think I have a hardware problem ?
>> Is the S.u.S.E implementation wrong ?
>> Shall I change to ext3 ? ( It=B4s slower, I know )
>>
>> Whats the right strategie to recover a defetive partition ?
>>
>> Alex.
>>
>>
>> =20
>>
> It is not normal.  It is very likely to be hardware.

Alex: Can you check /var/log/messages if there is any line containing
"error", "oops" or something like that?


Carl-Daniel
--=20
http://www.hailfinger.org/

