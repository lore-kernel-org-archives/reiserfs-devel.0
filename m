From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: umount and sync delays
Date: Tue, 15 Mar 2005 12:55:59 +0300
Message-ID: <20050315095559.GV6814@backtop.namesys.com>
References: <Pine.LNX.4.61.0503141338470.25427@dacun> <4235CCAE.9030408@namesys.com> <Pine.LNX.4.61.0503142008090.26303@dacun> <4235EAAD.1070205@namesys.com> <Pine.LNX.4.61.0503142052410.26303@dacun>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0503142052410.26303@dacun>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello,

On Mon, Mar 14, 2005 at 08:59:00PM +0100, Gorazd Golob wrote:
> >
> >I have no idea, and so I must guess.  I guess that if you try the same
> >application on a different computer it will work reasonably fast and
> >that the problem is hardware doing extensive retries.
> We have tests on ext3 and it wasn't like fast, but few minutes, not 30 
> minutes.. 
> >
> >Or, you are doing completely random IO with tiny little bits of dirty
> >data in a large file, and so each 4k is a seek.  I doubt this, but in
> >theory....
> No.. there is really "random" data in this files, but files are small 
> (most of them less than 4 kb).

can you repeat the test with earlier kernel, like 
2.6.9 + the patch from ftp.namesys.com ?

just to be sure that the bug wasn't introduced recently.

> >Or you have something else on that machine dirtying lots of memory after
> >the application closes, and perhaps there is a flaw in our method for
> >forcing atoms to disk after they get old that we should look into.
> There were no other applications on that system and none of user land 
> deamons were using that partition.
> >
> >Finally, it could be none of the above and something is wrong in our
> >sync algorithms, and somebody should log onto your machine and look at it.
> Thanks.

It is better to find how to reproduce the bug in our test environment 
(kGDB :-).  

> >
> >Probably all guesses are wrong, but I have to ask them as a start.
> Hope it helped..

if you have managed to create tons of independed atoms, tons of independed
commits may take a lot of time :(

> tnx, gorazd

-- 
Alex.
