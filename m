From: Danila Beketov <danila.beketov@gmail.com>
Subject: Re: reiser4: mv command lost folder.
Date: Tue, 1 Jun 2010 07:37:07 +0400
Message-ID: <AANLkTimFpPD0YPUMteHCV8o1FXpw9STQpif3vcXypwxI@mail.gmail.com>
References: <AANLkTilTr_Yt0OWx1ED8pt2pM0rZc4FCg9obrNKVX2w9@mail.gmail.com>
	<4BFF90A9.2050209@gmail.com>
	<AANLkTimGrw7rDQb8d21MfP1xZHRFki-QhjzoLFD4cUJB@mail.gmail.com>
	<AANLkTildYHfsdvVPxZmpgAUuyF4BEfp7GOYakjclVuAx@mail.gmail.com>
	<4C0406B6.9050601@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3Ep6dH/LOOQ9DPfH8UVO9XGlU5PiZ8Qvm4TseUbsu2I=;
        b=jk3CTa+TsV9BOb0RLPsWtgwubU2LG3YvrJEcim3WSHeLm6ARtd07mbxyRNHCVOrjt3
         SKDlkZiPOhmOxOCTrjGvKqnKoOBDzmbtl2KAZvq5pFcDO2siV1tp+XMLkQDR2bWyEapw
         ZRt9MXdLRLQS9Sa/a825v+5yeKM+t3O+OhT5U=
In-Reply-To: <4C0406B6.9050601@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Thanks for response!

In the lost folder was recoverable data, so I'll recreate the partition=
=2E

2010/5/31 Edward Shishkin <edward.shishkin@gmail.com>:
> Danila Beketov wrote:
>>> Hello
>>>
>
> Hello.
> I have downloaded your metadata.
> Thanks.
>
>>>> Need help to return my lost folder, that has disappeared after mv
>>>> command execution by magic way.
>>>>
>
> I see this directory, but can not extract it so far.. It's old name
> has been removed, but new one wasn't created for some reasons.
>
> Eventually I have found that all link/unlink stuff in reiser4 is racy=
:
> the process which creates a child takes an exclusive flag
> REISER4_IMMUTABLE so that other concurrent processes
> should wait on this flag. However, instead of waiting they return
> reiser4-specific error number (-E_REPEAT) to the VFS...
> Will be fixed.
>
> I'll take a look why fsck don't want to put your poor directory to
> lost+found. but it'll take some time (I have only weekends for
> reiser4).
>
> The oops below is specific to zen-kernels. Sometimes zen
> folks try to fix reiser4 without success, so before sending oopses
> to this mailing list please make sure that you use -mm kernels,
> or reiser4 stuff against vanilla kernels from kernel.org.
>
> Thank you.
> Edward.
>
>>
>> May 19 20:04:32 beda kernel: ------------[ cut here ]------------
>> May 19 20:04:32 beda kernel: kernel BUG at fs/reiser4/txnmgr.c:1116!
>> May 19 20:04:32 beda kernel: invalid opcode: 0000 [#1] PREEMPT
>> May 19 20:04:32 beda kernel: last sysfs file:
>> /sys/devices/pci0000:00/0000:00:1f.2/host3/target3:0:0/3:0:0:0/block=
/sdb/dev
>> May 19 20:04:32 beda kernel: Modules linked in: vboxnetadp vboxnetfl=
t
>> vboxdrv ipv6 oss_usb oss_envy24ht osscore btusb bluetooth nvidia(P)
>> uvcvideo videodev v4l1_compat i2c_i801 parport_pc parport i2c_core
>> May 19 20:04:32 beda kernel:
>> May 19 20:04:32 beda kernel: Pid: 1453, comm: ent:sda8! Tainted: P
>> =A0 =A0 =A0(2.6.32-gentoo-r7 #1) MS-6728
>> May 19 20:04:32 beda kernel: EIP: 0060:[<c10d4625>] EFLAGS: 00010202=
 CPU: 0
>> May 19 20:04:32 beda kernel: EIP is at reiser4_txn_end+0x511/0x55f
>> May 19 20:04:32 beda kernel: EAX: 000073cd EBX: 00000000 ECX: 000000=
01
>> EDX: ed46a9a8
>> May 19 20:04:32 beda kernel: ESI: f6adfe48 EDI: f661d0ec EBP: f6adfe=
68
>> ESP: f6adfe10
>> May 19 20:04:32 beda kernel: DS: 007b ES: 007b FS: 0000 GS: 0000 SS:=
 0068
>> May 19 20:04:32 beda kernel: Process ent:sda8! (pid: 1453, ti=3Df6ad=
e000
>> task=3Df7083000 task.ti=3Df6ade000)
>> May 19 20:04:32 beda kernel: Stack:
>> May 19 20:04:32 beda kernel: f6adfe40 00000000 edce7e00 f6b3ec00
>> edce7ee8 edce7e74 ef133100 00000000
>> May 19 20:04:32 beda kernel: <0> f70832e8 f7083000 f6adff30 f6adff6c
>> ed46a900 f6adff6c 000000a4 00000000
>> May 19 20:04:32 beda kernel: <0> 00000000 00000000 00000000 f6adff30
>> ed46a900 f661d0dc f6adfe74 c10d467e
>> May 19 20:04:32 beda kernel: Call Trace:
>> May 19 20:04:32 beda kernel: [<c10d467e>] ? reiser4_txn_restart+0xb/=
0x1a
>> May 19 20:04:32 beda kernel: [<c10d49b3>] ? flush_some_atom+0x326/0x=
40d
>> May 19 20:04:32 beda kernel: [<c10e1a3c>] ? reiser4_writeout+0xe5/0x=
1af
>> May 19 20:04:32 beda kernel: [<c1099d8a>] ? writeback_inodes_wb+0x30=
8/0x398
>> May 19 20:04:32 beda kernel: [<c10e2390>] ? entd+0x19a/0x36a
>> May 19 20:04:32 beda kernel: [<c10e21f6>] ? entd+0x0/0x36a
>> May 19 20:04:32 beda kernel: [<c1036fa3>] ? kthread+0x66/0x68
>> May 19 20:04:32 beda kernel: [<c1036f3d>] ? kthread+0x0/0x68
>> May 19 20:04:32 beda kernel: [<c10033e3>] ? kernel_thread_helper+0x7=
/0x14
>> May 19 20:04:32 beda kernel: Code: ff ff 83 68 14 01 f6 40 08 08 0f =
84
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
