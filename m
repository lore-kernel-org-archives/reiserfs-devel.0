From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: read-only drive with reiserfs partiton not mountable
Date: Thu, 03 Jul 2003 19:27:52 +0200
Message-ID: <3F046798.7070906@gmx.net>
References: <3F046341.8000408@ncsu.edu> <3F04668C.8090603@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F04668C.8090603@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Joel Ebel <jbebel@ncsu.edu>

[Sorry, I hit send a bit too early]
Carl-Daniel Hailfinger wrote:
> Joel Ebel wrote:
> 
>> Ok.  I've got an unusual problem.  My hard drive decided yesterday to
>>  turn read-only.  I can't write anything to it.  The data seems to be
>> all there and readable, but any write to the drive fails.  I have 
>> partitions of NTFS, FAT32, ext3, and reiserfs.  I'm able to mount all
>>  the other partitions and copy files off of them, but the reiserfs 
>> partition refuses to mount saying wrong fs type, bad superblock,
>> etc... Is there a reason that a reiserfs partition on a read-only
>> drive wouldn't mount?  I'd sure like to get what data I can off of
>> it.  Any ideas?
> 
> 
> Use UML (user-mode Linux) and arrange for writable backing store on 
> another fs.

To be more clear, the block device with reiserfs is the base for a COW
(copy on write) device which can be used under UML. For the writes, you
need to provide a file on a writable fs which will store the differences.
ReiserFS inside the UML will not notice the fact that you tricked it.

Carl-Daniel


-- 
http://www.hailfinger.org/

