From: "Wolfgang Riedmann" <wolfgang@riedmann.it>
Subject: (Fwd) wait_buffer_until_released on Debian 3 i386 2.4.22
Date: Tue, 20 Jan 2004 19:07:14 +0100
Message-ID: <400D7C62.28502.314998@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-printable
Return-path: <reiserfs-list-return-16589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-description: Mail message body
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

the problem with the server crash has been repeated.

It' s a completely new machine, installed december, 21 2003.

The exact error in the logs is 

Jan 20 18:54:50 lxworksystem kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:07, size 
4096, blocknr 3145728, count 3, list 0, state 0x10019, page c1568940, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-1710000000)  JDIRTY 
!JWAIT

and a smbd process is using 99% CPU. No Samba connect ist possible, 
ssh works so I could read the errors from /var/log/messages.

Please let me know what I can do to solve this error as it's 
occurring now every 2-3 days!

As I wrote before the machine is a HP Compaq ProLiant ML 350 G3 with 
512 MB of memory, a Compaq Smart Array 641 with 128 MB cache and 4 
discs (Compaq, I don't know the manufacturer) each 36 GB 10k rpm that 
are forming a hardware RAID5 array so the OS sees only one big drive 
with around 100 GB, and yes, the biggest partition with 87 G has 
about 46 GBs of data.

Thank you in advance!

Wolfgang 

------- Forwarded message follows -------
From:           	"Wolfgang Riedmann" <wolfgang@riedmann.it>
Organization:   	Riedmann
To:             	reiserfs-list@namesys.com
Date sent:      	Fri, 16 Jan 2004 13:53:27 +0100
Subject:        	wait_buffer_until_released on Debian 3 i386 2.4.22
Priority:       	normal

[ Double-click this line for list subscription options ] 

Hi,

I' m having a problem on a HP/Compaq ProLiant ML350 with a SmartArray 
641 RAID controller. Sometimes (the first time ten days ago, the 
second time yesterday eventing) a smbd process seems to provocate a 
wait_buffer_until_released error. The smbd process is taking 100% of 
the CPU, no Windows client can do anything, but sshd works so I can 
connect.

Unfortunately, I was not able to see the messages after the reboot. 
For the OS the drive is one big drive with about 100 G space....

Is there any patch or fix or something other I can do?

Thank you very much!

Wolfgang


------- End of forwarded message -------
-- 
-- Wolfgang Riedmann
-- Individuelle EDV-L=F6sungen - Soluzioni informatiche personalizzate
-- I-39012 Meran, V. Laurin-Str. 2d
-- http://www.riedmann.it - wolfgang@riedmann.it


