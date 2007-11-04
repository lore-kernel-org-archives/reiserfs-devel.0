From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: reiser4 BUG in 2.6.22: reiser4_txn_end
Date: Mon, 5 Nov 2007 02:25:27 +0300
Message-ID: <5c7c368b0711041525t4c49443aw15f4e7c40b1814e6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=O9j4g7OtA0YYQqov0KJSWF+C8YCue8PRp/AM0d9Vb1U=;
        b=EtZsPMJYRWMFt0HIwJGjuNdfkv1sYdcsMhDD6xsQzIUfZJCYGWY05E1PofRg1gJRMf4+Q4MxLrm8dBDQ2BZzmjF7/m6KoODQfWntDXE0sjqT1mN8CYEBCS/hx0vInZzvHP+huCVAjY9Z6EbcNvzmYKq+wT/aQHlwOQmIHdxRhpg=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello Marti,
I have reproduced this bug. Thanks for details.
Will try to fix..

Edward.

Marti Raudsepp wrote:

One morning I happened to find this BUG traceback in my dmesg output.
I have no clue what caused it, and it didn't seem to have any effect
on the stability of the system.

uname:
Linux non 2.6.22-gentoo-r8 #1 Fri Sep 28 19:11:19 EEST 2007 x86_64 AMD
Athlon(tm) 64 Processor 3000+ AuthenticAMD GNU/Linux

dmesg:
[16184.832157] reiser4[ktxnmgrd:dm-3:r(1209)]: disable_write_barrier
(fs/reiser4/wander.c:234)[zam-1055]:
[16184.832160] NOTICE: dm-3 does not support write barriers, using
synchronous write instead.
...
[451329.064221] reiser4[cat(13038)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:662)[]:
[451329.064224] WARNING: reiser4_write_tail failed
[451329.064232] reiser4[cat(13038)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.064234] WARNING: Failed (-28) to convert in release_unix_file (4099340)
[451329.067453] reiser4[cat(13039)]: extent2tail
...
