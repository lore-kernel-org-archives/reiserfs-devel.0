From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10% - FIXED
Date: Mon, 24 Jul 2006 18:32:46 -0400
Message-ID: <44C54A8E.3010703@suse.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca> <1153779982.5735.128.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153779982.5735.128.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Benoit wrote:
> I applied the attached patch that Jeff supplied me and so far it is
> working flawlessly. I currently have less than 4% free space on my drive
> and the CPU usage is less then 3% with two recordings going. I'll let it
> run until about 2% free space just to test further.
> 
> It also _appears_ that overall CPU usage is down slightly based on the
> vmstat output from when we were trying to diagnose the problem before
> compared to now. The SYS CPU time was hovering between 3-10% before, and
> now it seems to be between 0-2%. I haven't done any actual performance
> tests though.
> 
> Jeff, what drawbacks does this patch have?
> 
> Thanks for all your hard work, I'm sure many other MythTV users will be
> appreciate it.

Hi Mike -

There really shouldn't be any. I suspect that the window searching was
actually causing more problems than it was solving. The original goal
would have been to try to keep chunks of blocks contiguous for better
access patterns, but if those chunks end up getting spread out all over
the disk, that's hardly the outcome we were looking for.

So, what will now happen is that the allocator will allocate the next n
blocks it can find, regardless of the window size. If there happens to
be a window of the size we needed, it will automatically find it through
the normal process of allocating one block at a time.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFExUqOLPWxlyuTD7IRAuaFAJ47W+zr2ZwIs//vMgm3RNHuw4dpwACdECdv
ueI91PGuCLQdeKipY5G9kqk=
=vk6Z
-----END PGP SIGNATURE-----
