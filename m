From: "Doug Bazarnic" <doug@cavecreek.net>
Subject: How to mount reiserfs with a relocated journal?
Date: Thu, 10 Jul 2003 19:12:48 -0700
Message-ID: <008b01c34751$ec654a10$7000000a@hardwarehq.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008C_01C34717.40067210"
Return-path: <reiserfs-list-return-14871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_008C_01C34717.40067210
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,  
 
I'm running RH7.3 with a patched 2.4.21 kernel (03-relocation-8.diff.gz
<ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21/03-relo
cation-8.diff.gz> ).    
 
I can't get my relocated journal drive to mount.   Are there any special
arguments I have to pass to mount?
 
Mount complains that it can't find a superblock on /dev/sdb1
 
I used  mkreiserfs /dev/sdb1 -j /dev/hda1 .   
 
/dev/sdb1 is my 73 gig Scsi HD, and /dev/hda1 is a 512 meg compact flash
card hooked up to the ide port.
 
Mkreiserfs works fine, writes the journal to /dev/hda1, syncs and says
"OK"
 
Any help would be appreciated!
 
 
Thanks so much,
 
Doug

------=_NextPart_000_008C_01C34717.40067210--

