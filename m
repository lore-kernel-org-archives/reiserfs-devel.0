From: David Masover <ninja@slaphack.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 09:25:40 -0500
Message-ID: <430B31E4.6080807@slaphack.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>	 <430B26A1.4080003@slaphack.com> <194f6255050823065872f42089@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f6255050823065872f42089@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:
> Hello David and thanks a lot for answering my question.
> 
> 
>>Have you tried "-o noatime"?
> 
> Why do you think this could help? 
> Since the machine does absolutly nothing (no services, simply nothing
> than a open bash).

I remember someone explaining this before.  It went something like this: 
  The atime update happens whenever something is accessed.  Something 
(/bin/atime?  not on my system) needs to be accessed in order to make 
that update.  So, every five seconds, there _will_ be a new atime that 
must be written, and since ReiserFS3 doesn't do lazy writes, it _will_ 
be flushed out to disk.  (Reiser4 would just keep it in RAM until memory 
pressure or a sync/fsync forced it out to disk.)

So, the simplest way is to do "-a noatime", unless you really need the 
atime updates.  It'll boost your performance, too...

But this is all from memory, from a long time ago.  I have no idea if 
any of the above is still true.

>>Also, Reiser4 is much more standby-friendly.  If you've got the RAM, it
>>won't touch your disk too much.
> 
> Yes I know - but its a bit too complicated for me to get everything
> up&running from ground up using Reiser4 since its not in the
> default-kernel of debian :-(

Nor Gentoo, but I use it there anyway.

