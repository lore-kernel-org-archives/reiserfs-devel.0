From: Edward Shishkin <edward@namesys.com>
Subject: Re: REISER4: fix for reiser4_write_extent
Date: Sat, 07 Apr 2007 23:29:49 +0400
Message-ID: <4617F12D.8080905@namesys.com>
References: <46157B5B.5000602@gmail.com> <461793E4.5040706@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S965737AbXDGTaF@vger.kernel.org>
In-Reply-To: <461793E4.5040706@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Laurent Riffard wrote:

> Le 06.04.2007 00:42, Ignatich a =C3=A9crit :
>
>> While trying to find the cause of problems with reiser4 in recent=20
>> kernels I came across this.
>>
>> Incomplete write handling seem to be missing from=20
>> reiser4_write_extent() thanks to reiser4-temp-fix.patch. Strangely,=20
>> there is a patch by Edward Shishkin that should address that issue,=20
>> but it is missing from -mm tree. Please check.
>>
>>    Max
>>
>
> This patch was added to -mm tree the 14 Dec 2006 (see=20
> http://www.mail-archive.com/mm-commits@vger.kernel.org/msg05338.html)=
=2E
>
> It was then dropped from -mm tree the 05 Mar 2007 (see=20
> http://www.mail-archive.com/mm-commits@vger.kernel.org/msg10818.html)=
,=20
> with this comment:
>     "This patch was dropped because it is obsolete"
>
> No idea why it was obsolete. Does somebody know ?


This uses not settled interface filemap_copy_from_user_atomic/nonatomic
However, those things should be fixed. I'll prepare the patch a bit lat=
er..

Thanks,
Edward.
