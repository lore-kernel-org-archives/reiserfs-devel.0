From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: kernel dumps error messages  after heavy use and repeated mount unmount sequences
Date: Tue, 25 Oct 2005 16:43:46 +0200
Message-ID: <op.sy7hu8uwd4os1z@localhost>
References: <000e01c5d94d$75752d90$7ac44d0a@persistent.co.in> <435E43F3.8010900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435E43F3.8010900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Tue, 25 Oct 2005 16:40:51 +0200, Vladimir V. Saveliev =20
<vs@namesys.com> napisa=B3:

> Hello
>
> Abhijeet Anant Sane wrote:
>> ReiserFS 4.0 dumping a error message.
>>
>>
>> ------------[ cut here ]------------
>> kernel BUG at fs/reiser4/debug.c:141!
>> invalid operand: 0000 [#6]
>> Modules linked in: reiser4
>> CPU:    0
>> EIP:    0060:[<f8b972f7>]    Not tainted VLI
>> EFLAGS: 00010202   (2.6.12)
>> EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]
>
>>
>>
>> Please tell me if i have done something wrong in the kernel compilation =
=20
>> or
>> something else is wrong.
>>
>>
>
> Please, try to reproduce the problem with more recent code.
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/reiser4-for-2.6.13-4.pat=
ch.gz
> is fresh reiser4 for 2.6.13.
>
>

I'm running 2.6.13 kernel with reiser4-for-2.6.13-4 patch and it's stable  =

as 2.6.12 with latest patch for it. Earlier versions for 2.6.13 were =20
unstable for me.

