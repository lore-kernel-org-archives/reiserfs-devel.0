From: David Masover <ninja@slaphack.com>
Subject: Re: flush earlier?  (was Re: Congratulations! we have got hash function
 screwed up)
Date: Sun, 09 Jan 2005 17:26:16 -0600
Message-ID: <41E1BD98.2080809@slaphack.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net> <20050106162619.GG18173@ZenIV.linux.org.uk> <41DEC53A.40403@namesys.com> <41DF1AE1.8090306@slaphack.com> <41DF20A8.20506@namesys.com> <41DF699C.3030400@slaphack.com> <41E04707.9060101@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41E04707.9060101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
[...]
|> I'm not sure I understand that.  Is the idea of that to build up a write
|> buffer which insists on flushing bytes off the front as they are added
|> onto the back, without flushing huge chunks at once?
|
|
| Yes.
|
|>
|> Would that be as efficient at packing (no fragmentation)?
|
|
| No.

Really?  I'd think that it would waste more CPU, but you could actually
end up packing better, if you allocate for the end of the buffer as it's
flushed, because you can look at the whole buffer and what's already on
disk.  What would be a good idea with one flush could be inefficient by
the next, and this system can react faster to that change.

But, there's still laptops, and there's CPU usage.

Will it be hard to implement both approaches?  One example would be
someone trying to create a clean fs "image", or someone who's installing
software, so they don't care how long it takes, but they do want it to
be tightly packed.  Someone who can't afford the repacker :(

|> But the main problem was it would basically lock the fs entirely -- no
|> access at all.
|
|
| Which is why we need to allow fusing a little bit.

What do you mean by "fusing" here?

|> This especially hurts with read access.
|
|
| Read access?  Do you have one CPU?  Maybe the problem isn't what I
| thought it was.

Yes, I have one CPU.  But I only have one reiser4 drive per machine.  I
think that reiser4 locks all fs access until the flush is done, or at
least it used to.  But even if it didn't, reads take _forever_ when the
disk is in use, and reads are usually more urgent than writes (hence
asynchronous writes).  And the disk will be in use trying to write a
huge chunk of data for some time, and will take longer the more RAM you
have.

|> For now, how about a quick fix.  Can we force a flush when we get to
|> 80%?
|
|
| VM already has an asynchronous flush mechanism.  We just need to clean
| up our interaction with it a bit to smooth things out.

What I want to avoid is doing away with lazy writes entirely (laptops)
and doing something like ext3's "flush every five seconds" concept.  But
I also want to avoid truly _massive_ spikes in disk activity.

That's what the 80% is about.  You still get lazy writes, but they can
be at a lower priority than reads, hopefully minimizing seeks, too --
thrashing between reading and writing.  But when the lazy write happens,
you don't slow down the rest of the system, because it still has some
room to write.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQeG9l3gHNmZLgCUhAQJFqQ/9FH9OVdTEM3DLCfRef0Xc6N+ZA4Wv4kCp
T1W4OHbxq3AL31TcLv5hRDA8xhv3ivp/ODQfcGNyM2mg2UcV61xwHWxvUwQmBTPG
0Nl2o4uM51LuoqW4V1OoVPD4sSr/Ak08ahyeG1vZY5T5kpLk+V6Ms6jklRrQqTDZ
r6PgBvDyw7C9JVuX911MMIzOJpDjx2vJavJZu0C4M/X2k9Tl2A99O2gpLB3Vuvcn
kCKEctXb6K+bt+kiFrnsMl4tqBhrc6fYMSQq+ZP4uU1Ttzxz1T59lT+gtMf2yqZL
hUZgMZ/DNpEdyzU7QOTMFOHFr5l73D4YainEJ7XP9zHzMf4tkHEwUiE3/H7/0ktD
FIqAnJ7khiDwC9r/yqAliecqWg+fspvyLy85aVsmG/5RWbEMYHhyxM4e+vEM5EMs
5dJ1XpSuoVrujiKFx2h/5drQ4KFui9bplbfoSahEsFpdcJ+MtNYHvNOqJ5l2ZLfe
s75j4DtsbWTXK/tGFRmIcL8gPzlUszfXrRVtQw+bhIxAtxmoABuqbCMYDd9LyclO
Kyzy0Ha0AYQy5pIFwm5cTCkC7GBThLBzPk7863J4jxHJ23izg5B/IyEEhOk9NOx2
jC3zf6ZwD1nEIWbZ/yH4s2J8kXw/wno92GLwxI5hpPFPqZxxGMG7xeND1vhcHBvF
1fozX/nMpN4=
=puoc
-----END PGP SIGNATURE-----
