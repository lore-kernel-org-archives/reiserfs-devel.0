From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Mapping reiserfs errors to hardware devices or filesystems
Date: Mon, 28 Jul 2003 14:35:29 +0400
Message-ID: <200307281435.29029.vitaly@namesys.com>
References: <54872.192.168.101.1.1059368461.squirrel@www.lunanet.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <54872.192.168.101.1.1059368461.squirrel@www.lunanet.biz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dlt@lunanet.biz, reiserfs-list@namesys.com


Hi, 

On Monday 28 July 2003 09:01, Donald Thompson wrote:
> I believe I'm having a hardware issue, but I have no idea what device is
> the problem from the error messages I'm getting.
>
> I'm seeing the following repeated:
>
> vs-500: unknown uniqueness 26169
> vs-500: unknown uniqueness 26169
> vs-500: unknown uniqueness 26169
> vs-500: unknown uniqueness 26169
> vs-500: unknown uniqueness 26169
> vs-500: unknown uniqueness 26169
> vs-5150: search_by_key: invalid format found in block 90922. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
> data of [26164 26256 0x0 SD]
>
> Its been repeating itself over several reboots. It does not seem to be
> fatal, as the system remains up and working properly.

This was just a bad phrasing, the problem is in tree structure only here, 
obtain the latest reiserfsprogs from out ftp site please and run reiserfsck.

> The entire system, including the root device uses reiserfs. 4 of the
> filesystems sit on logical volumes. This is a debian sid system, kernel
> 2.4.20.

you can reiserfsck --check on all fs's. Or you can run 
    debugreiserfs -1 90922 /dev/xxx
for all fs's to print their block #90922 content. It will have messages like 

|  0|280725 786601 0x0 SD (0), len 32, location 4064 ..... 

where '280725 786601 0x0 SD (0)' is the key of an item and 'SD (0)' is 
the uniqueness. reiserfsck the fs whose block #90922 has an item with 
uniqueness 26169.

> Is there any way from the messages generated to identify what filesystem
> is having problems? I figure my only other option is to go into single
> user mode, mount everything read-only and fsck each filesystem. I'm just
> lazy and was hoping there was an easier way of tracking it down.

If I recall correctly, Oleg made some improvements in these warnings some 
time ago.

-- 
Thanks,
Vitaly Fertman
