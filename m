From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: umount and sync delays
Date: Mon, 14 Mar 2005 20:59:00 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0503142052410.26303@dacun>
References: <Pine.LNX.4.61.0503141338470.25427@dacun> <4235CCAE.9030408@namesys.com>
 <Pine.LNX.4.61.0503142008090.26303@dacun> <4235EAAD.1070205@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4235EAAD.1070205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

>
> I have no idea, and so I must guess.  I guess that if you try the same
> application on a different computer it will work reasonably fast and
> that the problem is hardware doing extensive retries.
We have tests on ext3 and it wasn't like fast, but few minutes, not 30 
minutes.. 
>
> Or, you are doing completely random IO with tiny little bits of dirty
> data in a large file, and so each 4k is a seek.  I doubt this, but in
> theory....
No.. there is really "random" data in this files, but files are small 
(most of them less than 4 kb).

> Or you have something else on that machine dirtying lots of memory after
> the application closes, and perhaps there is a flaw in our method for
> forcing atoms to disk after they get old that we should look into.
There were no other applications on that system and none of user land 
deamons were using that partition.
>
> Finally, it could be none of the above and something is wrong in our
> sync algorithms, and somebody should log onto your machine and look at it.
Thanks.
>
> Probably all guesses are wrong, but I have to ask them as a start.
Hope it helped..

tnx, gorazd
