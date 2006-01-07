From: Andrea Gelmini <dislessico@gmail.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Sat, 7 Jan 2006 13:41:50 +0100
Message-ID: <13dbb67f0601070441q559b156ep@mail.gmail.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_5066_26258683.1136637710524"
Return-path: <reiserfs-list-return-27616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_5066_26258683.1136637710524
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

2006/1/6, Robert Hulme <rob@robhulme.com>:
>
> http://linuxgazette.net/122/TWDT.html#piszcz
>
> It seems to come off fairly badly in most of the tests.


I really did not understand  this kind of benchmark. I don't care which
filesystem is faster creating 10.000 files (something I never have to do). =
I
care about which filesystem fits better with my everyday use of my data.
Days ago I wrote a few script trying to simulate a tipical desktop session,
*my* tipical desktop session. With different filesystem I've got difference
of minutes. That's a benchmark that mean something to me.
Why I'm trying/looking at reiser4?
Because:
a) seeks are the real problem of hd (they kill performance);
b) journal in a fixed position creates a lot of seeks;
c) I love ext2, but my laptop crash a lot of time in a day (tests, battery
and so on).

Testing reiser4 is giving to me a good feeling with wondering logs. You
know... less seek, less HD stress... so more responsiveness.
Well, it's too early to express an opinion about R4 (I'm using it since las=
t
week), but the only way to test a FS is to use it for a long time.

Sorry for my bad english,
gelma

------=_Part_5066_26258683.1136637710524
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div><span class=3D"gmail_quote">2006/1/6, Robert Hulme &lt;<a href=
=3D"mailto:rob@robhulme.com">rob@robhulme.com</a>&gt;:</span><blockquote cl=
ass=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); mar=
gin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<a href=3D"http://linuxgazette.net/122/TWDT.html#piszcz">http://linuxgazett=
e.net/122/TWDT.html#piszcz</a><br><br>It seems to come off fairly badly in =
most of the tests.</blockquote><div><br>I really did not understand&nbsp; t=
his kind of benchmark. I don't care which filesystem is faster creating=20
10.000 files (something I never have to do). I care about which filesystem =
fits better with my everyday use of my data.<br>Days ago I wrote a few scri=
pt trying to simulate a tipical desktop session, *my* tipical desktop sessi=
on. With different filesystem I've got difference of minutes. That's a benc=
hmark that mean something to me.
<br>Why I'm trying/looking at reiser4?<br>Because:<br>a) seeks are the real=
 problem of hd (they kill performance);<br>b) journal in a fixed position c=
reates a lot of seeks;<br>c) I love ext2, but my laptop crash a lot of time=
 in a day (tests, battery and so on).
<br><br>Testing reiser4 is giving to me a good feeling with wondering logs.=
 You know... less seek, less HD stress... so more responsiveness.<br>Well, =
it's too early to express an opinion about R4 (I'm using it since last week=
), but the only way to test a FS is to use it for a long time.
<br><br>Sorry for my bad english,<br>gelma<br></div><br></div>

------=_Part_5066_26258683.1136637710524--
