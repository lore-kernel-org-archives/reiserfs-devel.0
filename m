From: lJoublanc@softhome.net
Subject: reiser4progs-1.0.3 : superblock backups
Date: Wed, 15 Dec 2004 11:30:38 -0700
Message-ID: <courier.41C082CE.00004F63@softhome.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

Regarding the new release of reiser4progs: 

it's unclear to me from the release announcement whether prevoius versions 
of reiser4progs correctly backup superblocks or not. You imply it's been 
corrected - so it wasn't working before? 

i.e. if I had previously used libaal 1.0.2, and my superblock got corrupted, 
could I rebuild it from teh backup if upgarded to 1.0.3? 

I'm asking because recently that's exactly what happened to me. My disc is 
failing due to hardware level problems, the superblock is wrecked, it won't 
mount, and I need to recover my stuff! 

In a final rescue effort, I've updated to 1.0.3, but if I run fsck.reiser4 
 --build-sb, I get: 

[...]
Warn : A new master superblock is created on '/dev/hdd1'.
Enter the key plugin name [key_large]:
Error: Can't read bitmap block 18. Input/output error.
Error: Can't load ondisk bitmap.
Error: Can't initialize block allocator.
Fatal: Failed to open the block allocator. 


Can anyone tell me what it means? Is the problem to do with reiser4 
superblocks or is the disk so buggered it can't write the table anymore? 

Any help is greatly appreciated... 

Luciano 

p.s. shame I'm having these hardware problems, as besides that r4 has worked 
pretty well! 
