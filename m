From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output
 error
Date: Wed, 04 Aug 2004 14:47:14 -0700
Message-ID: <41115962.1030407@namesys.com>
References: <20040804065840.17C7915C7C@mail03.powweb.com> <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com> <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com> <20040804183801.GU1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804183801.GU1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Wed, Aug 04, 2004 at 04:51:34PM +0400, Vladimir V. Saveliev wrote:
> =20
>
>>>If it is due to 4k stacks,
>>>     =20
>>>
>>No, I do not think it is.
>>   =20
>>
>
> =20
>
>>reiser4 now refuses to compile if 4k stack is on.
>>   =20
>>
>
>WTF, Redeeman at least runs Reiser4 with 4k stacks...
>
>What's this about?
>
> =20
>
V4 likes stack.  If someone can convince me that kmalloc is as efficient=20
as stack, I'd like to hear it, because I know I lack expertise on the topic.
