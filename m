From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 needs more testers
Date: Tue, 30 Mar 2004 16:56:32 -0800
Message-ID: <406A1740.7020501@namesys.com>
References: <16484.24086.167505.94478@laputa.namesys.com>	 <406462C1.5020507@namesys.com> <1080686376.2023.4.camel@spc0.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080686376.2023.4.camel@spc0.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Cole <elenstev@mesatop.com>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Yes, it is a readdir related NFS bug.  I should have added that it is 
serious enough to make NFS over reiser4 a bad idea.

Hans

Steven Cole wrote:

>On Fri, 2004-03-26 at 10:05, Hans Reiser wrote:
>  
>
>>We have one NFS related bug remaining, [snipped]
>>    
>>
>
>Is this the NFS bug you have in mind, or a different one?
>
>I get "Input/output error" when I try to ls the contents of
>a directory on an nfs exported reiser4 system from the client system.
>
>spc2 is the nfs server, running kernel 2.6.5-rc2 with latest reiser4 patch.
>spc0 is the nfs client, running kernel 2.6.5-rc3-mm1 with nfs-utils 1.0.6.
>
>[steven@spc2 r4_testing]$ df -T
>Filesystem    Type   1K-blocks      Used Available Use% Mounted on
>/dev/sda1     ext3      798476    156840    601076  21% /
>/dev/sda8     ext3     7147260   5570304   1213892  83% /home
>none         tmpfs      257456         0    257456   0% /dev/shm
>/dev/sda6     ext3     4024188   1874192   1945572  50% /usr
>/dev/sda7     ext3      806368    130220    635184  18% /var
>/dev/sda9  reiser4     3930680    241556   3689124   7% /r4_testing
>
>[steven@spc2 steven]$ cat /etc/exports
>/home/steven/kernels    128.165.67.190(rw)
>/r4_testing             128.165.67.190(rw)
>
>[steven@spc2 r4_testing]$ pwd
>/r4_testing
>[steven@spc2 r4_testing]$ ls
>linux-2.6.5-rc2-r4
>
>I lightly tested the reiser4 filesystem by copying the kernel
>tree from the /home ext3 system and running one compile.
>
>On the client system, I mounted a few nfs systems:
>
>[steven@spc0 steven]$ df -T
>Filesystem    Type    Size  Used Avail Use% Mounted on
>/dev/hda7     ext3    471M  111M  337M  25% /
>/dev/hda11    ext3     26G   15G   11G  59% /home
>/dev/hda1     vfat    2.0G  1.9G  135M  94% /mnt/windows
>/dev/hda9     ext3    3.9G  1.8G  2.0G  47% /usr
>/dev/hda10    ext3    580M  118M  432M  22% /var
>/dev/hda5     vfat    1.9G  920M  963M  49% /win_d
>/dev/hda6     vfat    1.8G  1.3G  511M  72% /win_e
>spc5:/share/from_spc0
>               nfs     34G   25G  8.7G  74% /spc5_backup
>spc2:/r4_testing
>               nfs    3.8G  236M  3.6G   7% /home/steven/r4_testing
>spc2:/home/steven/kernels
>               nfs    6.9G  5.4G  1.2G  83% /home/steven/spc2_kernels
>[steven@spc0 steven]$ uname -r
>2.6.5-rc3-mm1
>
>The ext3 system works just fine:
>
>[steven@spc0 steven]$ ls /home/steven/spc2_kernels
>2.6.0-test8-mm1   fs/                              linux-2.6.2-r4/       linux-2.6.5-rc2-r4/  r4/
>2.6.0-test9-mm1   getit                            linux-2.6.2-rc2-mm1/  patch-2.6.2-rc2      r4.tar.gz
>2.6.2-rc2-mm1     kexec-260test8-mm1.patch         linux-2.6.2.tar.bz2   patch-2.6.5-rc2      reiser4/
>2.6.4-mm1         kexec-260test9-mm1-update.patch  linux-2.6.4-mm1/      patch-fixk           reiser4.tar.gz
>4g4g_kexec.patch  kexec-260test9.patch             linux-2.6.4.tar.bz2   patch-nikita         thediff
>all.diff          linux-2.6.1.tar.bz2              linux-2.6.4-vanilla/  patch-nikita2
>
>But the reiser4 system does not:
>
>[steven@spc0 steven]$ ls /home/steven/r4_testing
>ls: /home/steven/r4_testing/linux-2.6.5-rc2-r4: Input/output error
>
>
>Steven
>
>
>
>
>  
>


-- 
Hans

