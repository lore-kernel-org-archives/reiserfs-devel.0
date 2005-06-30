From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 or qmail problem?
Date: Thu, 30 Jun 2005 17:00:41 +0400
Message-ID: <1120136440.3441.47.camel@tribesman.namesys.com>
References: <200506301156.39263.dancho@aiidatapro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506301156.39263.dancho@aiidatapro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dancho <dancho@aiidatapro.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-06-30 at 12:56, Dancho wrote:
> Hello, 
> 
> I use reiser4 in small mail server. After 102 days uptime the computer
> stopped responding. In the syslog the following message appeared:
> 
> Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 16384
> 
> Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 32768
> 
> Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 65536
> 
> Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 131072
> 
> Jun 30 09:09:07 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:07 parhelia kernel: WARNING: Flushing like mad: 262144
> 
> Jun 30 09:09:09 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:09 parhelia kernel: WARNING: Flushing like mad: 524288
> 
> Jun 30 09:09:12 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:12 parhelia kernel: WARNING: Flushing like mad: 1048576
> 
> Jun 30 09:09:19 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:19 parhelia kernel: WARNING: Flushing like mad: 2097152
> 
> Jun 30 09:09:44 parhelia kernel: reiser4[qmail-queue(18124)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
> 
> Jun 30 09:09:44 parhelia kernel: WARNING: Flushing like mad: 4194304
> 

This is reiser4 problem. But you are using quite old version. Please
update to 2.6.12-mm2. It is possible that the problem is fixed already.

> The system's info:
> 
> parhelia:~# uname -a
> 
> Linux parhelia 2.6.9-mm1 #5 Mon Jan 31 22:21:31 EET 2005 i686
> GNU/Linux
> 
> parhelia:~# cat /proc/cpuinfo
> 
> processor : 0
> 
> model name : Intel(R) Celeron(R) CPU 2.00GHz
> 
> parhelia:~# mount
> 
> dev/hda3 on / type reiserfs (rw)
> 
> proc on /proc type proc (rw)
> 
> sysfs on /sys type sysfs (rw)
> 
> devpts on /dev/pts type devpts (rw,gid=5,mode=620)
> 
> tmpfs on /dev/shm type tmpfs (rw)
> 
> usbfs on /proc/bus/usb type usbfs (rw)
> 
> /dev/hda4 on /home type reiserfs (rw)
> 
> /dev/hda1 on /var type reiser4 (rw) !!!!!/all qmail data stored here/
> 
> Debian unstable
> 
> reiser4progs ver.1.0.4-1
> 
> I could provide more info, if necessary
> 
> -- 
> 
> In God we Trust (all others must submit a X.509 certificate)
> 

