From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.20-rc3-mm1: umount reiser4 FS stuck in D state
Date: Fri, 02 Feb 2007 22:13:34 +0100
Message-ID: <45C3A97E.5060909@free.fr>
References: <20070104220200.ae4e9a46.akpm@osdl.org> <200701062158.06329.vs@namesys.com> <45A81231.6040104@free.fr> <200701231940.58053.vs@namesys.com> <20070123154617.GE11995@kernel.dk> <45B65234.4000203@free.fr> <45C247EB.6000806@namesys.com> <45C250C9.3040307@free.fr> <45C26130.5090108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1946087AbXBBVNj@vger.kernel.org>
In-Reply-To: <45C26130.5090108@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, Kernel development list <linux-kernel@vger.kernel.org>


Le 01.02.2007 22:52, Edward Shishkin a =E9crit :
> Laurent Riffard wrote:
>>
>> Le 01.02.2007 21:04, Edward Shishkin a =E9crit :
>>>
>>> Laurent, would you please try 2.6.20-rc6-mm3 + this patch:
>>> http://lkml.org/lkml/diff/2007/2/1/195/1
>>
>>
>> Reiser4 works fine with 2.6.20-rc6-mm2 or 2.6.20-rc6-mm3 without any=
=20
>> additional patch (it was broken in rc6-mm1).
>>
>> FWIW, Andrew removed git-block.patch from 2.6.20-rc6-mm2, and he=20
>> restored git-block.patch without some problematic CFQ updates in=20
>> 2.6.20-rc6-mm3.
>>
>> In this case, does this patch need testing in rc6-mm3 ?
>=20
> Yes. This is against git-block patch to prevent endless waiting for I=
O=20
> completion.
> I have reproduced it by ./iozone -B -a -n 524288 -f /mnt/foo
> on x86 box with 512M RAM available.

OK, applied yesterday. I have been using it a few hours with a normal=20
workload and I didn't notice any problem.

Thanks
--=20
laurent
