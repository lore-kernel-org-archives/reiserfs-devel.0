From: David Masover <ninja@slaphack.com>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 13:15:59 -0600
Message-ID: <43836E6F.2030701@slaphack.com>
References: <200511171447.41362.mail@earthworm.de> <200511221144.34541.marcel@hilzinger.hu> <43832B3B.8070802@slaphack.com> <200511221601.47095.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511221601.47095.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Marcel Hilzinger wrote:
> Am Dienstag, 22. November 2005 15:29 schrieb David Masover:
> 
>>Marcel Hilzinger wrote:
> 
> [...]
> 
>>>It's not about Debian or Suse. It's about kernel 2.6.13 or 2.6.14. At
>>>least it seems, that the problem does not appear on older kernels
>>>(right?)
>>
>>Wrong.
>>
>>You are talking about the fsync issue, right?  As far as I know, while
>>there has been progress lately, fsync has always been slow on Reiser4,
>>because until recently, it was basically a call to sync, and reiser4


> Thanks a lot. I understand now. But is there any bug to hunt within reiser4 
> then?

You could call it that.

Last I checked, Reiser4's fsync just called 'sync'.  The way it should
work is to only flush the file being fsynced, not the whole FS.

If this were fixed, Reiser4 fsync performance should approach that of,
say, XFS, which also has lazy writes.  But, I haven't been keeping up
with this discussion, so maybe someone did fix that, and it's still slow.

But, even if fsync is as fast as it can possibly be, Evolution should
also be fixed.

