From: David Masover <jedi@ninja.dynup.net>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes
 too Far))
Date: Fri, 05 Dec 2003 08:07:40 -0600
Message-ID: <3FD0912C.1090700@ninja.dynup.net>
References: <2342084747-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2342084747-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:

>David Masover wrote on Thu, 04 Dec 2003 21:58:42 -0600:
>  
>
>>I agree that hardlinking directories should be allowed, and I think it's
>>worth it to check whether it creates a loop, unless rm can be modified
>>to simply rm the directory, and the filesystem (and maybe VFS) would be
>>modified to have directories have link counts that don't include . or
>>.., so when a directory is to be deleted, the system does its own manual
>>deletion of each of the files within it.  Then, if I type 'rm loop' and
>>it removes the link of 'loop/loop' to 'loop', there are now no more
>>links to 'loop' and it gets destroyed.
>>    
>>
>
>I think you need more than link counts.  Like I mentioned earlier, I used
>a graph traversal in my BeOS file system to handle deletion of loops.
>
>Unfortunately that implies locking potentially large numbers of files while
>doing the traversal, which can fail or deadlock if the file system is in
>continuous use (like it might be on a server).  But then you already have
>that sort of problem on regular file systems, though only for one file at
>a time.
>  
>
Yes, locking, as a transaction.  Which means either the whole deletion 
fails (couldn't get the lock, user got annoyed and hit ^C) or it 
succeeds (got lock on all the files by doing some sort of recursive lock 
on the root dir).  From inside the transaction, it should look as though 
everything is happening in realtime, but it only flushes when it can get 
the lock.  (right?)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9CRLAisZLIF6uqOAQJoLg/7Bou4ztb1My4YJ7NTFtLz6lg9WeRqGTaN
Kocw64tzSIR9+iyFh0z1zHRzwTwJr35W7TBbitf6zdNIDbkMi/qK6fehaG6ipRXh
+FX4ZEyjLpW5Q9ST39wEo4rpGNC9YVGvoOVz4YVITz/wASBsh8ZoY87lM43OD/n5
5UQodUFnXtPBcJrEqWeFRGkl0viOPdq3XTu5XNLATClszN/k9BYKXeyWRgNLH9xl
LbcWMCAW0DtsyB4V7Kwv/gCKicpVT8ss4V+91Jq0Ls1jvr53TTY9eMLejfjMtrcA
hAkioRjJjsJrqEh2LLRl5QvXamWNPu5B3ghL+aSBLjSHz3BboQn14U/zVN/42svE
B+2QYB7cY+JguzuYsBEbFN7qtjFzgMTQH5AMlg1SdXY+dYL+XIHmcROHvFkB/uaT
vlICasDktv1dzubyw9TI9nbGuttSleuqi4gqM/51IaP09BHTzY+mdluup86zZD8+
8ShE440Hq8swLlVN7JTYMDxwqJ78yJTvDrgKxlgUWulAjQqRTWPyZ1Hbru0iaA5F
ayIXFXSwlgRU1zDM/6rNsNpCoMiMPdZjH+NOd/3QSBnIWoc7ybsp6hxyOZruz5ej
1yA7jI0Qjs/FhAPMswZGVGI4/qY08nEYqA1ffrjApcdjLQFWx02Z0s1NTeVy2XGd
8D3gUzOLmoc=
=Mp6q
-----END PGP SIGNATURE-----

