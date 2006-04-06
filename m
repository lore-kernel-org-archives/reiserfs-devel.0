From: Brian Uhrain <buhrain@rosettastone.com>
Subject: Re: can anybody check that the attached patch eliminates reiser4
 compilation warnings on 64bit platforms?
Date: Thu, 06 Apr 2006 08:51:26 +0100
Message-ID: <4434C87E.1040308@rosettastone.com>
References: <200604061120.37578.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200604061120.37578.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

Alexander Zarochentsev wrote:
> would you please help to check the attached patch (for 2.6.17-rc1-mm1) 
> because our Alpha does not want to boot now.

I'm not sure what the last kernel version you had booting was (or what 
the error is now the your Alpha system does not want to boot), but I 
recently discovered a problem with kernels booting on my Alpha that was 
introduced in one of the 2.6.16-rc's.  Yesterday I was able to track 
down and squash the bug, and submitted my patch (two versions, one for 
2.6.16.1 and the other for 2.6.17-rc1) to the LKML.  After fixing the 
issue with CPU initialization, which looks like it would affect any 
Alpha system as it was a case of things changing/being added in all of 
the other architectures but not for the Alpha architecture, the system 
has been running fine with a 2.6.16.1 kernel and reiser4 root 
filesystem. :)  You can find my email with the patch at 
http://lkml.org/lkml/mbox/2006/4/5/69

  - Brian


BTW, your patch to silence the printf-style format string argument 
warnings looks fine to me. :)
