From: Will Smith <will@willsmith.org>
Subject: Re: kmail crash, reiser4 errors
Date: Fri, 24 Sep 2004 00:42:39 +0800
Message-ID: <4152FCFF.6060704@willsmith.org>
References: <200409230943.14710.rmeijer@internet.gr> <1095947018.6117.27.camel@tribesman.namesys.com> <200409231651.57772.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409231651.57772.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: rmeijer@internet.gr

Well, a clue is the -28 error messages, which is
(from /usr/include/asm/errno.h):

#define ENOSPC          28      /* No space left on device */

I agree that the error message is currently rather cryptic :)

 From my very limited understanding of the reiser4 source code, I believe you
can get ENOSPC for a number of reasons, where a limited resource
gets used up ; it doesn't always mean partition full.

Will Smith


Raymond A. Meijer wrote:
 >
 > Where could I have found the answer to this myself? Something like "filesystem
 > full" would have been a more helpful error message ;)
 >
> 
>>>Yesterday afternoon kmail crashed unexpectedly:
>>>
>>>Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: extent2tail (fs/reiser4/plugin/file/tail_conversion.c:654)[nikita-2282]:
>>>Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Partial conversion of 280274: 0 of 1: -28
>>>Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: release_unix_file 
> 




