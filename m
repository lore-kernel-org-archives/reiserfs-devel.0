From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sun, 30 Mar 2003 16:08:11 +0100
Message-ID: <200303301708.11703.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303291606.54910.bernd-schubert@web.de> <20030329203711.A16762@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_bhwh+js7wrSZDsD"
Return-path: <reiserfs-list-return-13447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329203711.A16762@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_bhwh+js7wrSZDsD
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> See the patch below.
> It should not break anything.
>

I just tried to cause the problems again, but without any success. I simply 
don't get the messages today. I tried to call /usr/bin/uptime from all 
clients as endless loop, rebooted the server -- no success. Then I stopped 
the nfs-server, copied uptime to uptime.old, removed uptime and moved 
uptime.old to uptime (to make the filehandle invalid) and rebooted -- still 
no success. I also tried several other things, but none of them helped.

Anyway I also tested the kernel-patch, but it causes problems with mounts from 
another nfs-server. Well, mounting works fine, but e.g. running 'ls 
{mountdir}'  returns 'Unknown error 524' (or was it 542 I can't remember). So 
even my homedirectory was not available on the server when I tried the 
iget-patch.
Well on system-reboot there I also get an oops. I have attached the ksymoops 
output.

Best regards,
	Bernd
--Boundary-00=_bhwh+js7wrSZDsD
Content-Type: text/plain;
  charset="iso-8859-1";
  name="ksymoops.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ksymoops.out"

ksymoops 2.4.8 on i686 2.4.20-athlon-pp.  Options used
     -v vmlinux__2.4.20-athlon-pp-igetp (specified)
     -K (specified)
     -L (specified)
     -o /lib/modules/2.4.20-athlon-pp-igetp/ (specified)
     -m System.map__2.4.20-athlon-pp-igetp (specified)

No modules in ksyms, skipping objects
Mar 30 16:21:38 hamilton kernel: kernel BUG at inode.c:1268!
Mar 30 16:21:38 hamilton kernel: invalid operand: 0000
Mar 30 16:21:38 hamilton kernel: CPU:    0
Mar 30 16:21:38 hamilton kernel: EIP:    0010:[<c0149870>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
Mar 30 16:21:38 hamilton kernel: EFLAGS: 00010246
Mar 30 16:21:38 hamilton kernel: eax: f6dc6280   ebx: f6dc6280   ecx: f89afad4   edx: f6dc63a0
Mar 30 16:21:38 hamilton kernel: esi: f6d82400   edi: 00000000   ebp: 080551f0   esp: f6d21f28
Mar 30 16:21:38 hamilton kernel: ds: 0018   es: 0018   ss: 0018
Mar 30 16:21:38 hamilton kernel: Process umount (pid: 892, stackpage=f6d21000)
Mar 30 16:21:38 hamilton kernel: Stack: f89afad4 f6d824d4 f89afca0 f89a930d f6dc6280 f6d82400 f89a9df8 f6dc6280
Mar 30 16:21:38 hamilton kernel:        f6d82400 f6d82444 c013b3e1 f6d82400 c342a540 f6d82400 0804ffd8 c014af0e
Mar 30 16:21:38 hamilton kernel:        f6d82400 c342a540 f744bc40 f6d21f98 00000000 c013f067 c342a540 f6d21f98
Mar 30 16:21:38 hamilton kernel: Call Trace:    [<f89afad4>] [<f89afca0>] [<f89a930d>] [<f89a9df8>] [<c013b3e1>]
Mar 30 16:21:38 hamilton kernel:   [<c014af0e>] [<c013f067>] [<c014b5af>] [<c01283b5>] [<c014b5cc>] [<c0108837>]
Mar 30 16:21:38 hamilton kernel: Code: 0f 0b f4 04 bd 0b 27 c0 85 f6 74 03 8b 7e 20 85 ff 74 0d 8b


>>EIP; c0149870 <iput+20/200>   <=====

Trace; f89afad4 <END_OF_CODE+3865ec30/????>
Trace; f89afca0 <END_OF_CODE+3865edfc/????>
Trace; f89a930d <END_OF_CODE+38658469/????>
Trace; f89a9df8 <END_OF_CODE+38658f54/????>
Trace; c013b3e1 <kill_super+a1/e0>
Trace; c014af0e <__mntput+1e/30>
Trace; c013f067 <path_release+27/30>
Trace; c014b5af <sys_umount+6f/80>
Trace; c01283b5 <sys_munmap+35/60>
Trace; c014b5cc <sys_oldumount+c/10>
Trace; c0108837 <system_call+33/38>

Code;  c0149870 <iput+20/200>
00000000 <_EIP>:
Code;  c0149870 <iput+20/200>   <=====
   0:   0f 0b                     ud2a      <=====
Code;  c0149872 <iput+22/200>
   2:   f4                        hlt    
Code;  c0149873 <iput+23/200>
   3:   04 bd                     add    $0xbd,%al
Code;  c0149875 <iput+25/200>
   5:   0b 27                     or     (%edi),%esp
Code;  c0149877 <iput+27/200>
   7:   c0 85 f6 74 03 8b 7e      rolb   $0x7e,0x8b0374f6(%ebp)
Code;  c014987e <iput+2e/200>
   e:   20 85 ff 74 0d 8b         and    %al,0x8b0d74ff(%ebp)


--Boundary-00=_bhwh+js7wrSZDsD--

