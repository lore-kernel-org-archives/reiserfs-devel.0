From: David Greaves <david@dgreaves.com>
Subject: Re: Can't mount after mkfs -b 8192
Date: Fri, 04 Jun 2004 10:10:12 +0100
Message-ID: <40C03C74.5090509@dgreaves.com>
References: <40BF9993.5060409@dgreaves.com>	 <200406041006.30278.christian.mayrhuber@gmx.net> <1086338975.31416.54.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086338975.31416.54.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hello
>
>On Fri, 2004-06-04 at 12:06, Christian Mayrhuber wrote:
>  
>
>>On Thursday 03 June 2004 23:35, David Greaves wrote:
>>    
>>
>>>Help :)
>>>
>>>This seems odd...
>>>
>>>Kernel 2.6.6
>>>progsreiserfs 0.3.0.4-3
>>>
>>>I have a raid5 array in an LVM2 VG with a 600Gb LV defined.
>>>If I make a reiserfs with a block size of 8192 it won't mount.
>>>      
>>>
>
>reiserfs does not support blocksize > page size. Does ext2 do that?
>  
>
dunno - not even tried ;)

But now you said that, I tried XFS and it says:
XFS: Attempted to mount file system with blocksize 8192 bytes
XFS: Only page-sized (4096) or less blocksizes currently work.
XFS: SB validate failed

>Please send your /proc/cpuinfo
>  
>
OK - why? (just curious)
cu:/everything/devel/mdadm# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 4
model name      : AMD Athlon(tm) Processor
stepping        : 2
cpu MHz         : 1276.255
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 mmx fxsr syscall mmxext 3dnowext 3dnow
bogomips        : 2506.75

>>I'm almost sure that reiserfs supports a blocksize of 4096, only.
>>
OK
I saw:
http://www.namesys.com/mkreiserfs.html

    -b | --block-size N

    N is block size in bytes. It may only be set to a power of 2 within 
the 512-8192 interval.

and man has the elipsis:
-b N, --block-size=N
              block size (1024, 2048, 4096...)


So I'm sure I'm forgiven ;)

David

