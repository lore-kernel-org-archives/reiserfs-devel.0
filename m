From: Yury Umanets <umka@namesys.com>
Subject: Re: Mapping reiserfs errors to hardware devices or filesystems
Date: Mon, 28 Jul 2003 09:04:06 +0400
Message-ID: <1059368646.6531.2.camel@haron.namesys.com>
References: <54872.192.168.101.1.1059368461.squirrel@www.lunanet.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <54872.192.168.101.1.1059368461.squirrel@www.lunanet.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dlt@lunanet.biz
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-28 at 09:01, Donald Thompson wrote:
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
> 
> The entire system, including the root device uses reiserfs. 4 of the
> filesystems sit on logical volumes. This is a debian sid system, kernel
> 2.4.20.
> 
> Is there any way from the messages generated to identify what filesystem
> is having problems? I figure my only other option is to go into single
> user mode, mount everything read-only and fsck each filesystem. I'm just
> lazy and was hoping there was an easier way of tracking it down.
> 
> Any help is much appreciated.

Hello,

This is fixed in last pre kernels.


> 
> -Don
-- 
We're flying high, we're watching the world passes by...

