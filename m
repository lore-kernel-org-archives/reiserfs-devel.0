From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: insserv on Debian triggers "kernel BUG at fs/reiser4/plugin/object.c:58"
Date: Wed, 07 Nov 2012 21:50:07 +0100
Message-ID: <509AC97F.9030301@gmail.com>
References: <20121107194935.4e27acea@Ulf.tvoe.tv> <509AC8D2.9070500@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060709020803090705070506"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type;
        bh=faSDDARG5hwLshdeJ+ln7pCKVAO3FNIDD0y5O5LweTw=;
        b=vm9YYC3oQDa7fW2BfopskiHS0KwqVVb52591GqPzoubPyBoomqENE6PDvH96DzJ0Ar
         LlykU76ogqjzD57UJLLvF1BxivYnwasvZTBbq9EYF8+8jvZ5wzSwllboXZK8I9xJDjnU
         ErLL9jsRcOSwYCYGFyPlTwoYd5Wz7tFvmfW6XnNbGRcN0i4UeeEYx5YrMGE8OBsPttIE
         zyrwUDoFQ4vnOpjrvJLUjxsb6EkM+Cyagpqhc/2pgrBwxblMPd7uTNZD+GHX2W1tQ5+1
         hh2cmweDjLtFVmGNtvcWuAxjs72xtpuSU7+St1MWVsPXDmJ55YPsgKe5nWPuD8OLw33i
         d6lA==
In-Reply-To: <509AC8D2.9070500@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: dimas000@ya.ru
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060709020803090705070506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2012 09:47 PM, Edward Shishkin wrote:
> On 11/07/2012 04:49 PM, dimas wrote:
>> hello, Edward!
>
> Hello.
>
>> as promised, i've made some tests with latest R4 stuff on Linux 3.6.7 
>> with bfq (otherwise 3.x kernels like to hangup on high i/o).
>> i'm running Debian testing i386 on my "home server" machine with R4 
>> on /. my params are "reg40,formatting=extents"
>> well, i've built my shiny new kernel and left it working. 3 days of 
>> normal usage passed without any single message from R4. and that 
>> looks nice.
>> but today i ran aptitude full-upgrade as some sort of stress-test. 
>> first thing i noticed is that upgrade runs very sloooow (because of 
>> "extents" ot what?). but there was no memory or cpu burn. ok. does 
>> not matter to much. but when dpkg started to configure packages, 
>> output was littered with warnings like that:
>>
>>> [269875.492865] ------------[ cut here ]------------
>>> [269875.492928] kernel BUG at fs/reiser4/plugin/object.c:58!
>>> [269875.492981] invalid opcode: 0000 [#43]
>>> [269875.493062] Pid: 5818, comm: insserv Tainted: G D      
>>> 3.6.7-309.12+pf+r4 #1 3Q IPP72-CPV/To be filled by O.E.M.
>>> [269875.493139] EIP: 0060:[<b10e3bb6>] EFLAGS: 00010282 CPU: 0
>>> [269875.493192] EAX: dd0b0600 EBX: 00000001 ECX: daa93f34 EDX: b693530c
>>> [269875.493246] ESI: b693530c EDI: b10e3bb6 EBP: 00000001 ESP: daa93f1c
>>> [269875.493300]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
>>> [269875.493353] CR0: 80050033 CR2: a76fd9b0 CR3: 29698000 CR4: 000007c0
>>> [269875.493407] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>>> [269875.493461] DR6: ffff0ff0 DR7: 00000400
>>> [269875.493512] Process insserv (pid: 5818, ti=daa92000 
>>> task=e3412900 task.ti=daa92000)
>>> [269875.493579] Stack:
>>> [269875.493623]  b1057d3d 00000001 dd0b0600 00000000 00000000 
>>> b6935310 e7ea1db4 e7ea1db4
>>> [269875.493896]  91827364 daa93f40 daa93f40 daa93f48 daa93f48 
>>> 00000000 00000000 0000d04a
>>> [269875.494168]  00000200 00000000 b1057f17 00000200 00000000 
>>> b693530c dd0b0600 00000000
>>> [269875.494441] Call Trace:
>>> [269875.494488]  [<b1057d3d>] ? 0xb1057d3d
>>> [269875.494539]  [<b1057f17>] ? 0xb1057f17
>>> [269875.494588]  [<b1053f98>] ? 0xb1053f98
>>> [269875.494637]  [<b128d897>] ? 0xb128d897
>>> [269875.494685] Code: 5f c3 90 90 90 31 c0 c3 b8 ea ff ff ff c3 85 
>>> c9 53 89 cb 74 0f 89 d1 89 da 5b 2d 9c 00 00 00 e9 ec fd ff ff b8 ea 
>>> ff ff ff 5b c3 <0f> 0b 56 89 d6 53 89 c3 e8 58 d3 ff ff f6 40 08 01 
>>> 74 33 89 d8
>>> [269875.494765] EIP: [<b10e3bb6>]  SS:ESP 0068:daa93f1c
>>> [269875.496554] ---[ end trace f4d149c808c3cc9c ]---
>
>
> This indicates that reiser4 doesn't make a friendship with VFS in some 
> bits.
> By the way, what the "pf" stands for in 3.6.7-309.12+pf+r4? ;)
> Could you please apply this temporary patch (it should prevent the oops),
> and send me the output of "strace insserv -nv"?

oops, forgot the patch..

--------------060709020803090705070506
Content-Type: text/x-patch;
 name="reiser4-dont-oops-on-bugop.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-dont-oops-on-bugop.patch"

---
 fs/reiser4/plugin/object.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-3.6.2_.orig/fs/reiser4/plugin/object.c
+++ linux-3.6.2_/fs/reiser4/plugin/object.c
@@ -55,8 +55,8 @@
 
 static int _bugop(void)
 {
-	BUG_ON(1);
-	return 0;
+	//BUG_ON(1);
+	return -EINVAL;
 }
 
 #define bugop ((void *)_bugop)

--------------060709020803090705070506--
