From: "Doug Bazarnic" <doug@cavecreek.net>
Subject: RE: How to mount reiserfs with a relocated journal? -- Figured out
Date: Thu, 10 Jul 2003 20:26:19 -0700
Message-ID: <009a01c3475c$31dc9990$7000000a@hardwarehq.local>
References: <008b01c34751$ec654a10$7000000a@hardwarehq.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <008b01c34751$ec654a10$7000000a@hardwarehq.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I had forgotten to run lilo to actually USE the patched kernel.  Oops!
:)

Duh... 

Any way, is there a down side to using a large journal?  8193 vs ~125000
block size?   Right now, I've allocated the entire 512 meg flash card
for the journal size.   


Thanks for you help,

Doug




-----Original Message-----
From: Doug Bazarnic [mailto:doug@cavecreek.net] 
Sent: Thursday, July 10, 2003 7:13 PM
To: reiserfs-list@namesys.com
Subject: How to mount reiserfs with a relocated journal?

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

