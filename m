From: sbenni@gmx.de
Subject: Re: reiser4 causes system freeze for 1-2 seconds
Date: Wed, 4 Apr 2007 19:55:39 +0200
Message-ID: <20070404195539.6fe2d61f@pluto.milky.way>
References: <20070403153755.1fc7bc4b@pluto.milky.way>
	<4612DE74.4060804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4612DE74.4060804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: edward@namesys.com
Cc: reiserfs-list@namesys.com, xucanhao@gmail.com


After some hours the problem has occured again. 


with azureus running, almost three second freezed

top - 19:28:24 up  8:25,  9 users,  load average: 6.89, 2.72, 1.26
Tasks: 110 total,  11 running,  98 sleeping,   0 stopped,   1 zombie
Cpu(s):  2.6% us, 95.8% sy,  0.2% ni,  0.0% id,  0.0% wa,  0.7% hi,  0.7% si
Mem:    510208k total,   505184k used,     5024k free,      776k buffers
Swap:  1959888k total,     2660k used,  1957228k free,   193908k cached

  PID  USER     PR   NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND              
 2168 root        15      -5     0      0      0     D  91.9     0.0        0:11.10 ent:hda8!            
10470 benni     18      0  6564   580  432    R   3.8     0.1        0:01.25 cp                   
 4511  root        5     -10  100m  55m 6452 S   3.3    11.2      13:40.66 XFree86              
 6443  azureus  35    19   381m  80m  21m R  0.5    16.2        9:57.66 java                 



without azureus, decoding a encrypted file, one second freezed

top - 19:43:22 up  8:40,  9 users,  load average: 1.89, 1.80, 1.44
Tasks: 110 total,   2 running, 107 sleeping,   0 stopped,   1 zombie
Cpu(s):  8.7% us, 89.7% sy,  0.3% ni,  0.0% id,  0.0% wa,  0.7% hi,  0.7% si
Mem:    510208k total,   504368k used,     5840k free,     7728k buffers
Swap:  1959888k total,     2660k used,  1957228k free,   236652k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND              
10746 benni      25   0  7148   1048  836   D 76.2     0.2        0:28.56 otrdecoder           
 2168  root        11  -5     0          0    0     S 19.6      0.0        0:13.63 ent:hda8.            
10747 benni      20   0  7148   1048  836   R  1.3      0.2        0:01.14 otrdecoder           
 4511  root         5 -10  100m   52m 6452  S  0.7     10.6      13:58.77 XFree86       
 




On Wed, 04 Apr 2007 03:08:36 +0400
Edward Shishkin <edward@namesys.com> wrote:

> sbenni@gmx.de wrote:
> 
> Hello.
> 
> >Hello,
> >
> >I have a 120Gb partition with reiser4. If I start a command like "cp <500mb file> dd" within it the system frequently freezes for 1-2 seconds and ent:hda8! uses nearly 100% cpu. This causes the sound output from xmms to be interrupted and my mouse freezes also. If i renice X and xmms to -10 it is okay. 
> >
> >Is this the desired behaviour ?
> >  
> >
> 
> No.
> 
> >Can I do sth. else than renicing all time critical programs ?
> >
> >My system is a debian amd64 with linux-2.6.16-mm2.
> >  
> >
> 
> How much RAM is available in your system?
> If this is much more then 512M, then boot with "mem=512M", and let
> us know if this freeze still takes place (to make sure this is because of
> unwisely assigned atom_max_size).
> 
> Thanks,
> Edward.
> 
> >
> >Best Regards
> >
> >Benni
> >
> >
> >  
> >
