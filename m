From: David Masover <ninja@slaphack.com>
Subject: Re: flush earlier?  (was Re: Congratulations! we have got hash function
 screwed up)
Date: Fri, 07 Jan 2005 23:03:24 -0600
Message-ID: <41DF699C.3030400@slaphack.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net> <20050106162619.GG18173@ZenIV.linux.org.uk> <41DEC53A.40403@namesys.com> <41DF1AE1.8090306@slaphack.com> <41DF20A8.20506@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DF20A8.20506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Hans Reiser wrote:
| David Masover wrote:
|
|> Hans Reiser wrote:
|> | Chris Dukes wrote:
|> |
|> |>
|> |>
|> |> All filesystems will fail or suffer degraded performance under
|> |> certain conditions, you need to determine what conditions are
|> acceptable
|> |> for your data.
|> |>
|> |>
|> |>
|> | and each generation of software reduces the extent of such conditions.
|> | Reiser4 fixes this problem cleanly.
|>
|> I think Reiser4's degraded performance condition is when it gets lots of
|> RAM.  First, a disclaimer -- I don't have the latest reiser4 patch.  But
|> in all versions of the FS, I've found that if I'm ever trying to do
|> anything when reiser finally decides to flush to disk, basically my
|> whole system is locked up.  I haven't tested, but I think this would
|> actually be worse with more RAM, because it would be longer until the
|> flush was forced, so each flush would take longer.
|>
|> What is needed is some sort of estimator or estimate.  An estimator
|> would be something that would flush when, based on recent fs load, it
|> was reasonable to expect that RAM would fill up just as the flush was
|> completing.  An estimate would be to flush if a certain percentage of
|> RAM was full, and to go to synchronous mode if memory usage didn't go
|> back below that percentage.
|
|
| We need to throttle rather than flush, so as to ensure that for every
| page added to an atom, at least X pages must reach disk, until close to
| the end of the atom when we just flush it out.

I'm not sure I understand that.  Is the idea of that to build up a write
buffer which insists on flushing bytes off the front as they are added
onto the back, without flushing huge chunks at once?

Would that be as efficient at packing (no fragmentation)?

But the main problem was it would basically lock the fs entirely -- no
access at all.  This especially hurts with read access.  When fs is
under heavy load, I can wait several minutes to start a browser,
especially when a lot of writing is happening.

For now, how about a quick fix.  Can we force a flush when we get to
80%?  Is there a synchronous mode, and can we use that after 80%, or do
we have to fake it by trying to flush every few seconds?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQd9pm3gHNmZLgCUhAQLj6BAAnzjp7PNnNr952pOg1LLckELJbG0Cq/Kj
smMR5VknCSeM0ho30gnjWOzI9FE/O1nAk6sMEdEcX6MGwCB8KUeQLo2OebIQCMi2
PdzB+nh6VImqeOZkgccBMQL6OK7o8QHYhQ/QtqBQ+3UIXTuJdBG4YZjNAkYDXF3s
ObJcLDKwaN3yZCzrLmcpK2+BQSckBu797Z3mwnbj1jpOiki76BqCrMCI7+081V/j
A4aOBeSQwKXfsld4vdIbWZzKF2lpUGx1jzfynYMVfQ9sj/aqtpKMbwDWiUOBdSv+
OX01ARcU1O90ZdL+zjT6qhJXgXOjbZu5Tpp9slJaYuvSbv516DJn2l1A+ADlbEkk
fxEHx2RRT0rqtepiBKu+QsGrO3ixl4lGZtyx4d8cj/yRjbHtNNI0YYg5w1kJ+udE
H93Y3JpdJi6iBdKvblJpRW1bA/HR9g+p/PsQy6jdwcKthzjTvFwXjSfGCy0u+nF7
mKry8Axd3QiANs4x8Pc6CDdbFEiPjo4FVpfBASb5qq7TbQVSSpvzEoWPn5AE5xE9
ZBuHireWoGG5XzwxkhfS14Y6letoKx1tbkZHSULwlTdmNffxIXDf0cc//G4H8waU
T3T8FOHQZtK+lnAMD7ImeNInJlPKde90JGYUg1YGeVcJqgfvroc+Ke0F4YTlhKi6
zaj+QkeKf7Q=
=ev3/
-----END PGP SIGNATURE-----
