From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Fails to build: Reiser4-patched Linux kernel 3.16
Date: Tue, 5 Aug 2014 08:32:45 -0700
Message-ID: <CAM12Q5QHn9JrN3M4Dw9ig+hc_zATTdBBnsqWj5ie8_wbGKBtVg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, all-

A while ago I built an AUFS3 and Reiser4-patched Linux kernel 3.15.8
-- which I am using at the moment -- because building newest kernel
3.16 fails.

I patched both kernels with:

< https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/=
 >

PATCHV7 (1-6)
< http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201407&w=3D2 >

Of course, only the kernel 3.15.8 was patched with SuSe's Mahoney
patch set (1-29):

< http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201404&w=3D2 >

Below are the Reiser4 patch failed sections:

------------------------------------------
[...]
  CC [M]  drivers/isdn/gigaset/interface.o
  CC [M]  drivers/infiniband/hw/qib/qib_qp.o
  CC [M]  drivers/isdn/gigaset/proc.o
fs/reiser4/init_super.c: In function =E2=80=98reiser4_init_read_super=E2=
=80=99:
fs/reiser4/init_super.c:614:14: warning: argument to =E2=80=98sizeof=E2=
=80=99 in
=E2=80=98strncmp=E2=80=99 call is the same expression as the second sou=
rce; did you
mean to provide an explicit length? [-Wsizeof-pointer-memaccess]
        sizeof(REISER4_SUPER_MAGIC_STRING))) {
              ^
  CC [M]  drivers/input/misc/mc13783-pwrbutton.o
  CC [M]  drivers/gpu/drm/nouveau/core/engine/graph/ctxnvd7.o
  CC [M]  net/rds/send.o
[...]
 CC [M]  drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.o
  CC [M]  drivers/input/misc/rotary_encoder.o
fs/reiser4/plugin/object.c:130:14: error: =E2=80=98generic_file_aio_rea=
d=E2=80=99
undeclared here (not in a function)
  .aio_read =3D generic_file_aio_read,
              ^
fs/reiser4/plugin/object.c:140:18: error: =E2=80=98generic_file_splice_=
write=E2=80=99
undeclared here (not in a function)
  .splice_write =3D generic_file_splice_write
                  ^
make[3]: *** [fs/reiser4/plugin/object.o] Error 1
make[2]: *** [fs/reiser4] Error 2
make[1]: *** [fs] Error 2
make[1]: *** Waiting for unfinished jobs....
scripts/Makefile.build:257: recipe for target
'fs/reiser4/plugin/object.o' failed
scripts/Makefile.build:404: recipe for target 'fs/reiser4' failed
Makefile:901: recipe for target 'fs' failed
  CC [M]  drivers/input/misc/uinput.o
  CC [M]  drivers/input/misc/wm831x-on.o
[...]
LD [M]  drivers/staging/vt6656/vt6656_stage.o
  LD [M]  drivers/staging/wlan-ng/prism2_usb.o
  LD [M]  drivers/staging/xgifb/xgifb.o
make[1]: Leaving directory '/build-directory/tlacauhtli-3.16.0/build/li=
nux-3.16'
make: *** [debian/stamp/build/kernel] Error 2
debian/ruleset/targets/common.mk:295: recipe for target
'debian/stamp/build/kernel' failed


Best Professional Regards.

--=20
Jose R R
http://www.metztli-it.com
-----------------------------------------------------------------------=
----------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
-----------------------------------------------------------------------=
----------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
-----------------------------------------------------------------------=
----------------------
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
