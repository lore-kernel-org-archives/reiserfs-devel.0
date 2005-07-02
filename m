From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
 <xuan--2005.07.02--reiserfs-list--namesys.com@baldauf.org>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Sat, 02 Jul 2005 14:12:11 +0200
Message-ID: <42C6849B.1080800@baldauf.org>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C16B43.7060706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Keven Murphy <murphyk@gdls.com>, reiserfs-list@namesys.com

Edward Shishkin wrote:

> Keven Murphy wrote:
>
>> Hello,
>>
>> I have read so much about reiser4 and the crypto plugin. What I have not
>> found is any docs on how to set up a partition using the plugin.
>> =20
>>
>
> Hello. Crypto transform is unsupported for a while,

That's too bad. Because if you do not use the latest machines (e.g. only=20
1 GHz CPU), you get, with cheap hard disks, 42 MB/s without encryption=20
but only 12 MB/s with aes-cbc-essiv:sha256 (using dm-crypt). Thus,=20
encryption seriously sacrifies performance. If you could limit=20
performance-sacrificing to data which is really important (say: /home or=20
/etc, but not /usr or /bin), performance would suffer less. Encryption=20
should be orthogonal to the volume|partition the data is stored on. So=20
I'm looking forward to (transparent) file level encryption becoming=20
usable. :-)

> only compression (still not
> for product using). The docs are under  construction.
>
> Thanks,
> Edward.

ciao,
Xu=E2n.

>
>
>> I have the modules installed and I have created a reiser4 filesystem.=20
>> I am
>> not sure what I need to do next.
>>
>> Thanks from a reiser newbie,
>>
>> Keven Murphy
>> murphyk@gdls.com
>>
>> Murphy's Law
>> ((U+C+I)x(10-S))/20xAx1/(1-sin(F/10))
>> U =3D Urgency    C =3D Complexity
>> I =3D Importance S =3D Skill
>> F =3D Frequency  A =3D Aggravation
>>
>>
>> This is an e-mail from General Dynamics Land Systems. It is for the=20
>> intended recipient only and may contain confidential and privileged=20
>> information.  No one else may read, print, store, copy, forward or=20
>> act in reliance on it or its attachments.  If you are not the=20
>> intended recipient, please return this message to the sender and=20
>> delete the message and any attachments from your computer. Your=20
>> cooperation is appreciated.
>>
>>
>> =20
>>
>
>
>

