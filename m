From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: different block sizes and badblocks
Date: Thu, 20 Jun 2002 14:05:11 +0100
Message-ID: <5.0.2.1.2.20020620135847.01c3bdb0@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have two questions: I see that in reiserfsprogs 3.x.1c-pre5 we have the 
option to make filesystem with different block sizes than the default 4096 
bytes. what does this mean? I can choose whatever blocksize I want? or it 
has to be a multiple of 4096? actually as I heard if I have a filesystem 
that has big files it is better to have big blocksizes, so the HDs have to 
seek less. actually I have a fileserver having mostly 7-10 meg files, that 
means that we can consider these as large files, and using lets say 256k 
block sizes would be more efficient than 4k block sizes right? and as 
reiserfs has the 'tail' option, I wont loose a single byte because of this 
big blocksize right? could somebody clear my mind about this?

the other question is about badblocks. we have badblock support in 
reiserfsprogs 3.x.1c-pre5, but its disabled by default. Oleg, could you 
give me some infos about it, how can I reenable it, or how does it work 
actually? it would be really nice :)

regards,
greg



