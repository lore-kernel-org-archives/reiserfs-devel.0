From: Hans Reiser <reiser@namesys.com>
Subject: Re: umount and sync delays
Date: Mon, 14 Mar 2005 11:49:01 -0800
Message-ID: <4235EAAD.1070205@namesys.com>
References: <Pine.LNX.4.61.0503141338470.25427@dacun> <4235CCAE.9030408@namesys.com> <Pine.LNX.4.61.0503142008090.26303@dacun>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0503142008090.26303@dacun>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Gorazd Golob wrote:

> Hi!
>
>>>
>> Probably you just have a lot of dirty buffers in RAM and they need to
>> flush to disk?
>>
> Hmm.. I'll try explain .. Before I did sync or unmount, application,
> that previosly wrote to reiser4 partition was closed. In moment of
> running sync or umount OS had about 1.7gb of data in cache memory.
> Sync was finished in about 45 minutes after. I'm not sure why does it
> take so long on u320s scsi. The problem can be in files which are
> written to this partition - a lot (>1M) of really small files. . Do we
> have to use some mount arguments?

I have no idea, and so I must guess.  I guess that if you try the same
application on a different computer it will work reasonably fast and
that the problem is hardware doing extensive retries. 

Or, you are doing completely random IO with tiny little bits of dirty
data in a large file, and so each 4k is a seek.  I doubt this, but in
theory....

Or you have something else on that machine dirtying lots of memory after
the application closes, and perhaps there is a flaw in our method for
forcing atoms to disk after they get old that we should look into.

Finally, it could be none of the above and something is wrong in our
sync algorithms, and somebody should log onto your machine and look at it.

Probably all guesses are wrong, but I have to ask them as a start.

Zam can probably login and look at things for you.  Zam, this guy is a
friend of mine, could you do that?

> It's not really practical if server goes out of power and ups will
> last only 5 minutes - not enought time to safe shutdown of system..
>
> Thanks, Gorazd
>
>

