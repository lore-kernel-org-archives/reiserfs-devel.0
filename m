From: Dancho <dancho@aiidatapro.com>
Subject: reiser4 or qmail problem?
Date: Thu, 30 Jun 2005 11:56:38 +0300
Message-ID: <200506301156.39263.dancho@aiidatapro.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="Boundary-00=_HP7wCx56e0SFcJ9"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_HP7wCx56e0SFcJ9
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit

Hello, 
 
I use  reiser4 in small mail server. After 102 days uptime the computer 
stopped responding. In the  syslog  the following message appeared:

Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 16384
Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 32768
Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 65536
Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 131072
Jun 30 09:09:07 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:07 parhelia kernel: WARNING: Flushing like mad: 262144
Jun 30 09:09:09 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:09 parhelia kernel: WARNING: Flushing like mad: 524288
Jun 30 09:09:12 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:12 parhelia kernel: WARNING: Flushing like mad: 1048576
Jun 30 09:09:19 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:19 parhelia kernel: WARNING: Flushing like mad: 2097152
Jun 30 09:09:44 parhelia kernel: reiser4[qmail-queue(18124)]: 
commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:
Jun 30 09:09:44 parhelia kernel: WARNING: Flushing like mad: 4194304



 
The system's info:
parhelia:~# uname -a
Linux parhelia 2.6.9-mm1 #5 Mon Jan 31 22:21:31 EET 2005 i686 GNU/Linux
 
parhelia:~# cat /proc/cpuinfo
processor       : 0
model name      : Intel(R) Celeron(R) CPU 2.00GHz

parhelia:~# mount
dev/hda3 on / type reiserfs (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw)
usbfs on /proc/bus/usb type usbfs (rw)
/dev/hda4 on /home type reiserfs (rw)
/dev/hda1 on /var type reiser4 (rw)  !!!!!/all qmail data stored here/
     
Debian unstable

reiser4progs  ver.1.0.4-1
   

I could provide more info, if necessary


-- 

In God we Trust (all others must submit a X.509 certificate)




--Boundary-00=_HP7wCx56e0SFcJ9
Content-Type: text/html;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit

<html><head><meta name="qrichtext" content="1" /></head><body style="font-size:12pt;font-family:Lucida Console">
<p>Hello, </p>
<p> </p>
<p>I use  reiser4 in small mail server. After 102 days uptime the computer stopped responding. In the  syslog  the following message appeared:</p>
<p></p>
<p>Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 16384</p>
<p>Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 32768</p>
<p>Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 65536</p>
<p>Jun 30 09:09:06 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:06 parhelia kernel: WARNING: Flushing like mad: 131072</p>
<p>Jun 30 09:09:07 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:07 parhelia kernel: WARNING: Flushing like mad: 262144</p>
<p>Jun 30 09:09:09 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:09 parhelia kernel: WARNING: Flushing like mad: 524288</p>
<p>Jun 30 09:09:12 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:12 parhelia kernel: WARNING: Flushing like mad: 1048576</p>
<p>Jun 30 09:09:19 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:19 parhelia kernel: WARNING: Flushing like mad: 2097152</p>
<p>Jun 30 09:09:44 parhelia kernel: reiser4[qmail-queue(18124)]: commit_current_atom (fs/reiser4/txnmgr.c:1206)[nikita-3176]:</p>
<p>Jun 30 09:09:44 parhelia kernel: WARNING: Flushing like mad: 4194304</p>
<p></p>
<p></p>
<p></p>
<p> </p>
<p>The system's info:</p>
<p>parhelia:~# uname -a</p>
<p>Linux parhelia 2.6.9-mm1 #5 Mon Jan 31 22:21:31 EET 2005 i686 GNU/Linux</p>
<p> </p>
<p>parhelia:~# cat /proc/cpuinfo</p>
<p>processor       : 0</p>
<p>model name      : Intel(R) Celeron(R) CPU 2.00GHz</p>
<p></p>
<p>parhelia:~# mount</p>
<p>dev/hda3 on / type reiserfs (rw)</p>
<p>proc on /proc type proc (rw)</p>
<p>sysfs on /sys type sysfs (rw)</p>
<p>devpts on /dev/pts type devpts (rw,gid=5,mode=620)</p>
<p>tmpfs on /dev/shm type tmpfs (rw)</p>
<p>usbfs on /proc/bus/usb type usbfs (rw)</p>
<p>/dev/hda4 on /home type reiserfs (rw)</p>
<p>/dev/hda1 on /var type reiser4 (rw)  !!!!!/all qmail data stored here/</p>
<p>     </p>
<p>Debian unstable</p>
<p></p>
<p>reiser4progs  ver.1.0.4-1</p>
<p>   </p>
<p></p>
<p><span style="color:#010101">I could provide more info, if necessary</span></p>
<p></p>
<p></p>
<p>-- </p>
<p></p>
<p>In God we Trust (all others must submit a X.509 certificate)</p>
<p></p>
<p></p>
<p></p>
<p></p>
</body></html>
--Boundary-00=_HP7wCx56e0SFcJ9--
