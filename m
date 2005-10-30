From: David Masover <masover@gmail.com>
Subject: zlib support...
Date: Sun, 30 Oct 2005 16:21:39 -0600
Message-ID: <1ddd44e40510301421k127e316eo4f46b4277fc80858@mail.gmail.com>
Reply-To: ninja@slaphack.com
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10982_28216151.1130710899300"
Return-path: <reiserfs-list-return-26732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_10982_28216151.1130710899300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Compiling a 2.6.12.5 <http://2.6.12.5> kernel on my Powerbook, I discovered
something odd. Reiser4 (vanilla patch) was insisting on being a module.

Alright, why does it still depend on CONFIG_ZLIB_INFLATE and
CONFIG_ZLIB_DEFLATE, even when the cryptocompress plugin isn't being used a=
t
all, and is in fact nonfunctional?

Anyway, I can live with a little RAM bloat, but for some reason, I couldn't
find the options to enable any zlib in the kernel. I could enable INFLATE
support by forcing something I know uses it to be compiled in -- compressed
isofs support. But I couldn't find something sane to force DEFLATE on.
DEFLATE defaults to being a module, and INFLATE seems to follow whatever I
set isofs support to be -- if I want INFLATE compiled in, to compile Reiser=
4
in, I have to compile isofs in.

Still workable, but very, very stupid, especially considering zlib is never
actually used, only compiled against and depended on.

Ok, first actual bug:
I could try to compile Reiser4 in at this point, but the final link fails,
because it does need deflate support, even though it doesn't depend on
CONFIG_ZLIB_DEFLATE.
Solution: Either remove cryptocompress until it works, or depend on
CONFIG_ZLIB_DEFLATE.

Now, second actual bug, not actually your fault:
Neither DEFLATE nor INFLATE can be configured manually, yet you depend on
one (or both) of them, without actually setting them. Thus, if
CONFIG_ZLIB_DEFLATE is compiled as a module, Reiser4 must be a module, and
there's no way to change that from inside menuconfig. Editing the .config
file manually doesn't work.
Solution: Make it possible to select INFLATE and DEFLATE support manually,
just like CRC32 and other library functions, or have Reiser4 enable them
when it needs them, instead of insisting on being a module.

The real surprise is, this problem only started happening on my PPC system.
I'm not sure if it's a config script glitch, an architecture-specific
problem, or something else entirely. But then, my PPC is the only
2.6.12system I currently run that tries to compile in Reiser4 support
-- the
desktop loads it from a ramdisk, because it needs the ramdisk anyway, and
the other amd64 box is running 2.6.13. Maybe configure is supposed to work
this way, but the dependencies are wrong.



I realize this is all probably old news, but I'm sending it anyway, because
maybe it's not. I'm sending it from a gmail address because I don't have
networking on said Powerbook yet.

------=_Part_10982_28216151.1130710899300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Compiling a <a href=3D"http://2.6.12.5">2.6.12.5</a> kernel on my Powerbook=
, I discovered something
odd.&nbsp; Reiser4 (vanilla patch) was insisting on being a module.<br>
<br>
Alright, why does it still depend on CONFIG_ZLIB_INFLATE and
CONFIG_ZLIB_DEFLATE, even when the cryptocompress plugin isn't being
used at all, and is in fact nonfunctional?<br>
<br>
Anyway, I can live with a little RAM bloat, but for some reason, I
couldn't find the options to enable any zlib in the kernel.&nbsp; I
could enable INFLATE support by forcing something I know uses it to be
compiled in -- compressed isofs support.&nbsp; But I couldn't find
something sane to force DEFLATE on.&nbsp; DEFLATE defaults to being a
module, and INFLATE seems to follow whatever I set isofs support to be
-- if I want INFLATE compiled in, to compile Reiser4 in, I have to
compile isofs in.<br>
<br>
Still workable, but very, very stupid, especially considering zlib is
never actually used, only compiled against and depended on.<br>
<br>
Ok, first actual bug:<br>
I could try to compile Reiser4 in at this point, but the final link
fails, because it does need deflate support, even though it doesn't
depend on CONFIG_ZLIB_DEFLATE.<br>
Solution:&nbsp; Either remove cryptocompress until it works, or depend on C=
ONFIG_ZLIB_DEFLATE.<br>
<br>
Now, second actual bug, not actually your fault:<br>
Neither DEFLATE nor INFLATE can be configured manually, yet you depend
on one (or both) of them, without actually setting them.&nbsp; Thus, if
CONFIG_ZLIB_DEFLATE is compiled as a module, Reiser4 must be a module,
and there's no way to change that from inside menuconfig.&nbsp; Editing
the .config file manually doesn't work.<br>
Solution:&nbsp; Make it possible to select INFLATE and DEFLATE support
manually, just like CRC32 and other library functions, or have Reiser4
enable them when it needs them, instead of insisting on being a module.<br>
<br>
The real surprise is, this problem only started happening on my PPC
system.&nbsp; I'm not sure if it's a config script glitch, an
architecture-specific problem, or something else entirely.&nbsp; But
then, my PPC is the only 2.6.12 system I currently run that tries to
compile in Reiser4 support -- the desktop loads it from a ramdisk,
because it needs the ramdisk anyway, and the other amd64 box is running
2.6.13.&nbsp; Maybe configure is supposed to work this way, but the
dependencies are wrong.<br>
<br>
<br>
<br>
I realize this is all probably old news, but I'm sending it anyway,
because maybe it's not.&nbsp; I'm sending it from a gmail address
because I don't have networking on said Powerbook yet.<br>

------=_Part_10982_28216151.1130710899300--
