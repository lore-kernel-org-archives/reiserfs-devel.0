From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Testing] Testing Reiser4 with xfstests
Date: Sun, 7 Dec 2014 09:28:55 +0100
Message-ID: <CADW=+3nsmombz5smTAq7RTPfg2WhZWYAbvGukms0H1Pfbz3r8A@mail.gmail.com>
References: <CADW=+3nVaodqG2YX0g8kajU=ZPKOPw167Sm98vHQBFvmqfL4xg@mail.gmail.com>
	<CADW=+3=QtDv6--1BNAVo8dcKX4QPeZWYeJJQvuiJu+dqec0aug@mail.gmail.com>
	<CADW=+3mMFTZDrQaLvL1d7SU4o_Ek7KWhbX6jDJJA7JdTtK465Q@mail.gmail.com>
	<5482F061.6040807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=tjp+m+IVIULkPuZ7WXAEFZ214qSfb3XYlLyf5V3lFo8=;
        b=kbmdlxii3bA8qNnOFG3fKRZCG/XLgQArEw31q9P6CoKyS6xoifo2ehBUIyQyU8yqal
         oBqaPLuIxUonA/S6xAnTOBtZBECNmDLvdDFARq+T7pedDBibe7TqyrIKyMAE5mO04sZ4
         hl/DyJz2oldG4Z0+cBVc5StCOdI4HMFZ6OoGDm1k8Kfjys027W3MAbPrOlCsbvL8iWOE
         6NEXw2OyJGaDNd3dEZCxfNYzN9lT09LIf6WZaHt2dIJhF5JkgSDxagoPiFZEsaF98xvO
         blpRhSaZMVMrTH+i9ZdT2ymxaXgJ6YWihb/VhPcyKWVz2ORvoetCHDlGT99YbxeMpy7q
         5iYw==
In-Reply-To: <5482F061.6040807@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sat, Dec 6, 2014 at 1:02 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
> On 12/06/2014 11:07 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Some of the tests (~20 of 300) didn't work and I traced that they
>> require fallocate. AFAIK R4 doesn't support it right?
>
>
>
> Yup, we don't support fallocate.
>
> Edward.
>
>
>
>>
>> On Fri, Dec 5, 2014 at 2:46 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>>>
>>> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@=
gmail.com> wrote:
>>>>
>>>> I managed to get xfstests  (
>>>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree )
>>>> to
>>>> run on Reiser4 partition. Test for async, acl, quota still don't w=
ork
>>>> but a
>>>> lot of the rest finishes successfully.
>>>> Tests were run on reiser4-for-3.16.2.patch
>>>> I'll post unsuccessful tests and their results in following e-mail=
s.
>>>>
>>> Btw. these tests can stress test fs and I could also test with
>>> different mount (block size?) or mkfs options (reg40) and automate =
it
>>> easily to test multiple combinations, so if there's any ideas what
>>> would be useful please tell me.
>>>
All combinations I test fail same tests:

generic/091 fsx exercising direct IO -- sub-block sizes and concurrent
buffered IO
generic/130 SQA Test No. 130

xfs_io vector read/write and trunc tests. modified from cxfsqa tests
 - unixfile_basic_block_hole
- unixfile_buffer_direct_
coherency
 - unixfile_direct_rw
 - unixfile_eof_direct
 - unixfile_fsb_edge
 - unixfile_open_append
 - unixfile_open_trunc
 - unixfile_small_vector_async_rw
 - unixfile_small_vector_sync_rw

generic/135 Concurrent I/O to same file to ensure no deadlocks

generic/263 fsx exercising direct IO vs sub-block buffered I/O


I'm currently testing these combinations (only ccreg40 as reg40 is
stuck in D state in the middle of the tests):

[r4ccHybrid]

MODULAR=3D0
TEST_DIR=3D/mnt/test
SCRATCH_MNT=3D/mnt/scratch
TEST_DEV=3D/dev/hda5
SCRATCH_DEV=3D/dev/hda7

RESULT_BASE=3D"`pwd`/results/`date +%d%m%y_%H%M%S`"
RECREATE_TEST_DEV=3D"true"

=46STYP=3Dreiser4
MKFS_OPTIONS=3D" "
MOUNT_OPTIONS=3D" "

[r4ccNoatime]
MKFS_OPTIONS=3D" "
MOUNT_OPTIONS=3D"-o noatime"

[r4ccCOW]
MKFS_OPTIONS=3D" "
MOUNT_OPTIONS=3D"-o txmod=3Dwa"

[r4ccJournal]
MKFS_OPTIONS=3D" "
MOUNT_OPTIONS=3D"-o txmod=3Djournal"

[r4ccLexic]
MKFS_OPTIONS=3D"-o fibration=3Dlexic_fibre"
MOUNT_OPTIONS=3D" "

[r4ccDot_o]
MKFS_OPTIONS=3D"-o fibration=3Ddot_o_fibre"
MOUNT_OPTIONS=3D" "

[r4ccExt_1]
MKFS_OPTIONS=3D"-o fibration=3Dext_1_fibre"
MOUNT_OPTIONS=3D" "

[r4ccExt_3]
MKFS_OPTIONS=3D"-o fibration=3Dext_3_fibre"
MOUNT_OPTIONS=3D" "

[r4ccTails]
MKFS_OPTIONS=3D"-o formatting=3Dtails"
MOUNT_OPTIONS=3D" "

[r4ccExtents]
MKFS_OPTIONS=3D"-o formatting=3Dextents"
MOUNT_OPTIONS=3D" "


>>> Thanks
>>> Dushan
>>>
>>>
>>>> Dushan
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
