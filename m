From: "David Dabbs" <david@dabbs.net>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 16:18:16 -0000
Message-ID: <20040831161821.4ECB515F84@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>, ReiserFS List <reiserfs-list@namesys.com>
Cc: ReiserFS-Dev@Namesys.com

> 
> My pleasure. Thank /you/ for helping to debug!
> 
*-*-*-*-*-*-*-*-*-*
if have a rather long answer this time, this is a test run i made today. 
i wanted to include full details. i'm wondering if there is still 
something these files have in common. first i created some test files on 
a spare partition with "touch":
*-*-*-*-*-*-*-*-*-*

Michael, thank you for taking the time to retest and for sending the detailed traces. From the look of the messages like the following:

FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:20c8b16c855]. Should be
[2a:0(NAME):131323334353637:3839303132333435:20c8b1617a5].

the problem directory entries differ in the final key element, which is the hash value as I mentioned before. If I had access to the source I could look into this further. My suspicion is that the reiserfstools have slightly different hash calculation or some hash variance caused when extended ASCII chars appear in the hashed portion of a filename. 

Can anyone at Namesys comment on Michael's posts? 

David



