From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Fragmentation
Date: Sun, 22 Feb 2009 19:32:19 +0300
Message-ID: <49A17E13.3040102@gmail.com>
References: <1385878997.819661234829671975.JavaMail.root@zimbra4-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1385878997.819661234829671975.JavaMail.root@zimbra4-e1.priv.proxad.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: geearf@free.fr
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

geearf@free.fr wrote:
>> measurefs.reiser4 is pretty ancient, and I guess
>> that it works incorrectly for compressed files.
>>
>>     
>> (External) fragmentation resulted in a number of "extents" is
>> a sticky thing inherent to all linux file systems, including reiser4.
>> Currently there is no tools to reorganize reiser4 without having
>> a spare partition. However, it is possible to create something
>> simple like xfs_fsr: it would be an appreciable help.
>>     
>> The "smart reiser4 repacker" based on the flush algorithm was
>> supposed to be the paid option, and therefore there are some
>> obvious issues of its development.
> Well I ended up taring my /, mkfs and untaring it.
> So it should not be fragmented in any way anymore.
> I will look at the internal fragmentation of my /home, but this is not under ccreg40.
>
> I've also just looked at the xfs_fsr thing and it looks pretty useful.
> Can't that be done with a simple script? (sort of like Con's defrag script) or does it need to be related to R4 ?
>
>   

Hello.

Perhaps a simple script is useful, but it has a number of
disadvantages, which make it a software of "not enterprise" level ;)
1) it doesn't take care of holes;
2) it doesn't report about cases when reorganization makes things worser.

Both (1) and (2) need active support of kernel. As to "xfs_fsr simplicity":
it seems, I have misled you. Xfs provides special ioctls to show/allocate
"in place" map of extents, whereas reiser4 doesn't have such service.

Edward.
