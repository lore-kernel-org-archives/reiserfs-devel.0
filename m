From: Tom Reinhart <rhino_tom@hotmail.com>
Subject: re: Thank you
Date: Sat, 4 Jul 2009 19:52:20 -0500
Message-ID: <BLU128-W9C984961A80DDBE7026E0942A0@phx.gbl>
References: <2JBvL8my0000422c9@blu0-omc1-s18.blu0.hotmail.com>
 <BLU128-W286A6ECCC3C56D99FA0B9942A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <BLU128-W286A6ECCC3C56D99FA0B9942A0@phx.gbl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-devel@vger.kernel.org


> Hello,
> Since 2006 I have been a happy reiser4 user, but recently I got tired=
 of patching my
> kernel and therefore I finally gave up (but I already miss its effici=
ency at least
> with small files).
> I wanted to thank Edward and the various people still making this pro=
ject alive :)

I agree with these thoughts.  It's a nice piece of code, and I hope it =
is successful but
it's too difficult to keep up with external patches.
I think it needs to be in the main kernel.  That's the only way it will=
 ever get wide testing
and new developers interested.  I hope this becomes a high priority for=
 Ed Shishken and
whoever else still works on this project.
Also, due to some reputational issues, a name change would be good for =
the
filesystem's future.  I would suggest "dancefs" for the dancing trees. =
 Has a nice
ring to it, and parallels the naming convention used for other competin=
g filesystems
like btrfs which is also named after a data structure.  Also "plugins" =
have been=20
controversial, they could be renamed to "filesystem objects" for the sa=
me reason
which probably more accurately describes the
abstraction anyway.

Just some observations from a long time lurker, feel free to listen or =
ignore as you like.

Tom

_________________________________________________________________
Windows Live=99 SkyDrive=99: Get 25 GB of free online storage.
http://windowslive.com/online/skydrive?ocid=3DTXT_TAGLM_WL_SD_25GB_0620=
09--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
