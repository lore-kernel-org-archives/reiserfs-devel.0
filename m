From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Fri, 06 Aug 2004 21:14:30 -0700
Message-ID: <41145726.1030807@namesys.com>
References: <20040806065705.E5A6515C76@mail03.powweb.com>	<4113A91E.3000500@namesys.com> <20040806191045.37527e99@philou.gramoulle.local> <4113C243.30105@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4113C243.30105@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>, David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

Vladimir V. Saveliev wrote:

> Hello
>
> Philippe Gramoull=E9 wrote:
>
>> Hello,
>>
>> I've run David's version of Mongo and hit the following error during=20
>> the PHASE MODIFY sequence.
>>
>> reiser4[mongo_modify(4127)]: commit_current_atom=20
>> (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
>> WARNING: Flushing like mad: 16384
>>
> This is harmless message

Then remove it.

>
>> All 3 mongo_modify processes are stuck in D+
>>
>
> So, it did not complete?
> It is working yet here
>
>> Running a fsck --check now.
>>
>> Thanks,
>>
>> Philippe
>>
>> On Fri, 06 Aug 2004 19:51:58 +0400
>> "Vladimir V. Saveliev" <vs@namesys.com> wrote:
>>
>>   | > Should someone from Namesys downloads the bzip tar I mentioned=20
>> before here's
>>   | > a summary of the changes in my version of mongo:
>>   | >   |   | Yes, i am running your version of mongo.
>>
>>
>
>
>
>

