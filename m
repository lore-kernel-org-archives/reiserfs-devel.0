From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Help please
Date: Wed, 09 May 2012 22:52:33 +0200
Message-ID: <4FAAD911.6000403@gmail.com>
References: <CANish_k+TucLHQQCkx5kHaqN6e7kJOFqKG4fsey18BhWBs=BWA@mail.gmail.com>	<20120507201208.5eec936a@Ulf.tvoe.tv> <CANish_nX=_XLJgALwLrMV-WjMsBSsPQMXOJG4jTVZBnxbFY23g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cko0YL6oom8Wrjz8kGIGEqVMzr7Wq0ZNaFajfBhVg+4=;
        b=prqAALw/zllSdUCgQNcVRjUa0psitOl7o+WXj3fM6QgK0wuPyzSL4rUvnkM5oIuIw7
         afHS553uMnoOW7g/VB2r4fn9QbZqpCw5XU4I9Q4bNq+XtK87jM0ipRPBPQAt0KFfdZ4d
         tZyBzkLqfF4ADngcy3xkyfn/7UsnQjU+LQrak+GGURUNR3xJY5ZG3S3Lnu/zgIoLCFoR
         Gyhe7W1+x2V8Iuh7gNQnhhamEIuwIthNLx4H6tpyxX0nOVgVkzlhlIFSRS9RKPx2GDQA
         qyTwvK9G5dANMbmFt/lnVqbxc/vxI8IVNpHuYuHA99/JYIYgC9HHWeFUEblfA3FCD3MM
         7pBg==
In-Reply-To: <CANish_nX=_XLJgALwLrMV-WjMsBSsPQMXOJG4jTVZBnxbFY23g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: dimas000@ya.ru, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 05/09/2012 08:24 PM, Sandro Souza wrote:
> Thanks Dimas for your answer.
>
> Following your advice, here is the first part of syslog content (sorry
> for the big text):
>

[...]

> May  9 17:58:01 localhost kernel: [    0.000000] Linux version
> 2.6.32-reiser4 (2.6.32) (root@debian-virtual) (gcc version 4.4.5

[...]

> May  9 18:03:13 localhost kernel: [  319.440007]  [<ffffffff81187ac9>]
> ? checkin_logical_cluster+0x21/0x1ba
> May  9 18:03:13 localhost kernel: [  319.440011]  [<ffffffff81189698>]
> ? capture_page_cluster+0xa6/0xe0
> May  9 18:03:13 localhost kernel: [  319.440014]  [<ffffffff81189e03>]
> ? write_end_cryptcompress+0xd8/0x158
> May  9 18:03:13 localhost kernel: [  319.440017]  [<ffffffff81186893>]
> ? reiser4_write_end_careful+0x10d/0x194
> May  9 18:03:13 localhost kernel: [  319.440022]  [<ffffffff81109622>]
> ? pipe_to_file+0x13f/0x14e

Hmmmm.... splice.....
Looks like an old bug, which has been fixed in further reiser4
patches. Could you please use more fresh kernels? I definitely
don't have a time to backport fixups to 2.6.32..

Thanks,
Edward.


> May  9 18:03:13 localhost kernel: [  319.440026]  [<ffffffff8117949b>]
> ? reiser4_dirty_inode+0xd/0x70
> May  9 18:03:13 localhost kernel: [  319.440029]  [<ffffffff811094e3>]
> ? pipe_to_file+0x0/0x14e
> May  9 18:03:13 localhost kernel: [  319.440032]  [<ffffffff81108487>]
> ? splice_from_pipe_feed+0x4c/0xd0
> May  9 18:03:13 localhost kernel: [  319.440035]  [<ffffffff81109465>]
> ? generic_file_splice_write+0xb8/0x136
> May  9 18:03:13 localhost kernel: [  319.440038]  [<ffffffff811091e1>]
> ? sys_splice+0x369/0x477
> May  9 18:03:13 localhost kernel: [  319.440042]  [<ffffffff81010a82>]
> ? system_call_fastpath+0x16/0x1b
> May  9 18:03:13 localhost kernel: [  319.440043] Code: 2f 00 00 00 01
> 74 05 e8 62 76 e9 ff 48 89 d0 c3 fa 66 0f 1f 44 00 00 3e 81 2f 00 00
> 00 01 74 05 e8 49 76 e9 ff c3 b8 00 00 01 00<3e>  0f c1 07 0f b7 d0 c1
> e8 10 39 c2 74 07 f3 90 0f b7 17 eb f5
> May  9 18:03:13 localhost kernel: [  319.440064] RIP
> [<ffffffff81356a7d>] _spin_lock+0x5/0x1b
> May  9 18:03:13 localhost kernel: [  319.440067]  RSP<ffff88003a67fc00>
> May  9 18:03:13 localhost kernel: [  319.440069] CR2: 0000000000000050
> May  9 18:03:13 localhost kernel: [  319.440071] ---[ end trace
> 291a4085ba950956 ]---
> May  9 18:03:22 localhost AptDaemon: INFO: Quiting due to inactivity
> May  9 18:03:22 localhost AptDaemon: INFO: Shutdown was requested
>
> Any help is wellcome. :)
>
> 2012/5/7 dimas<dimas000@ya.ru>:
>>> I made 3 videos (by XVidCap without sound) with these tests.
>>> They're available in http://www.smartsolutionfactory.com.br/reiser4
>> screencasts? for what reason?
>>
>>> After reboot the VM, no problem. But after it, I've tried to copy a
>>> folder from a reiser3 partition to a reiser4 partition, and
>>> unfortunally it has failed. :(
>>> I need to know what I'm doing wrong.
>> simply show output of smth like "cp -av /mnt/reiser3/folder /mnt/reiser4"
>> and maybe following dmesg/syslog messages, if copying triggers some oops/warning
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

