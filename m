From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Fri, 04 Jun 2004 23:50:23 -0500
Message-ID: <40C1510F.5020608@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <873c5j0zm3.fsf@uhoreg.ca> <40B91A65.2060302@slaphack.com> <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu> <40BBA23D.7000109@slaphack.com> <87ekp0ghbo.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87ekp0ghbo.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Hubert Chan wrote:
|>>>>>"David" == David Masover <ninja@slaphack.com> writes:
|
|
| [...]
|
| David> But back to the point.  No encryption by default.  My grandmother
| David> would wonder why her computer is so slow, and if you told her
| David> it's so that the FBI can't read anything when they sieze her
| David> computer, she wouldn't be happy.  Except for the fact that my
| David> grandmother is a very patient woman, so she might not care that
| David> it's slow.  But my brother would, and he plays games, so...
|
| Well, filesystem performance probably won't affect games that much.
| Unless your game is very filesystem-bound, but then it'll be slow
| anyways (and the programmer should be given a swift smack to the head
| for doing something that stupid).

Suppose we've got a game which dynamically loads a level, such that the
player only has to watch the thing load when it boots up.  Now, if our
filesystem is too slow, the horizon in the game shrinks.

Or suppose we simply don't want people to have to wait 2-3 times as long
for a level to load, or for the game to load.  Games tend to be huge
apps these days (or at least have a huge amount of content to load at
once).  Every few minutes (or 5-10 mins) in ut2004, the server changes
levels.  The levels currently take 15-30 seconds to load, most of it
pure disk activity.

Also, what do you mean by "filesystem-bound"?  Most games I've seen make
their own databases -- there's things all over with names like
"textures.mycoolgame".  I wouldn't, I'd probably have it use whatever
the reiser interface to multiple files is.  The last thing I want to
think about when writing a game engine (a huge beast on its own which I
will attempt one of these days) is data storage.

Or suppose we're talking about databases.

| Filesystem performance is more likely to be an issue for things such as
| compiling programs, running a webserver, etc.

Actually, no.  Not compiling programs, anyway.  Most of the time there
is spent doing the actual compiling, which moves surprisingly small
amounts of data at a time, although it does help to have things
buffered/cached.  And running a webserver may want encryption anyway,
depending on the kind of server it is, but mine doesn't have enough
bandwidth to want fast performance.

| But I agree.  No encryption by default.  Especially since encryption is

And I agree that excessive encryption isn't all that bad.

Enough said from the both of us.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMFRD3gHNmZLgCUhAQJyJQ/7BrH3bHwyMVH4DlZnXf4Ntbx6ftLKVQZt
t71dyNcEHn8ksRGA711tEIgmf1wrMiPP3lm6sgOmJuHlrfi06jJi0+YsmINIYX/T
im2W5Zht6h6ie0Saa5w1QUh96vok6HF11FpqgHyctOz11yVa7zPKLWD1tXYQz79I
wAvid217Mb9FzpBu/qkptJt2NpRYshSZYdTeKx08iow7kwtDXddlmEWZ6fDLyTQJ
bunqfzUlOOgYJv4jdi715t660YsrUlswS/36q51TR1lAMYb1BiZZippV5hZpJ0wr
ECcZKnVdXVKadkAIjmnp9dconSNSmqguKNA2zpJaeCekBLsOyJkEh3EqZJcqjM4J
fPeUqKKblGmQ+oT1VRx9RbSdO40wZ9Yaxndo//jxARe0yEnRV3Rw/jjh0EfxWKH0
3XxWeDOWgGOl+92irxRHWQNszZEjPh46Y7IAIb0pxLAvTtmhqk7k5TS7yVskzncA
tzSgpk7ZH9RY2WR6v98zZjOY8bVadbbWr+2TALxDMrUJ0mhRZMQdakiMpHOLHIpr
MTTV1WO+eKlZlABmZzhF33tE0v9bec01rcM2glqj72FfNHWGAjTjvwlZeGYW/Rpj
f0eHykBou7yjSNgS/txdk0dRRl2ZWSaRL3xYtk6T80HMCgeMkx3YPSbAXszv0GY2
T01oXQxEpbc=
=rKKZ
-----END PGP SIGNATURE-----
