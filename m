From: <doiggl@velocitynet.com.au>
Subject: need assistance with a parameter
Date: Mon, 27 Sep 2010 11:09:32 +1000
Message-ID: <33401a7838e8fde139223db04119ecfb@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Hello.
I am trying to compile in [opensuse buildservice] the 2.6.35 kernel wit=
h
r4 patch and get the following errors in [1].

I have set CONFIG_CROSS_COMPILE=3Dn in the .config file.
Its failing on line
"Cross-compiler=E2=80=82tool=E2=80=82prefix=E2=80=82(CROSS_COMPILE)=E2=80=
=82[]=E2=80=82(NEW)=E2=80=82aborted!"
What else am I missing here [i.e  mis-spelt parameter]. Im not cross
compiling anything. It seems to abort on any new parameters not in the
=2Econfig
Thanks Glenn

+=E2=80=82make=E2=80=82prepare=E2=80=82-C=E2=80=82
/usr/src/packages/BUILD/kernel-vanilla-2.6.34.7/linux-2.6.35=E2=80=82
O=3D/usr/src/packages/BUILD/kernel-vanilla-2.6.34.7/linux-obj
make:=E2=80=82Entering=E2=80=82directory=E2=80=82`/usr/src/packages/BUI=
LD/kernel-vanilla-2.6.34.7/linux-2.6.35'
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/basic/fixdep
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/basic/docproc
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/basic/hash
=E2=80=82=E2=80=82GEN=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82/usr/=
src/packages/BUILD/kernel-vanilla-2.6.34.7/linux-obj/Makefile
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/kconfig/conf.o
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/kconfig/kxgettext.o
=E2=80=82=E2=80=82SHIPPED=E2=80=82scripts/kconfig/zconf.tab.c
=E2=80=82=E2=80=82SHIPPED=E2=80=82scripts/kconfig/lex.zconf.c
=E2=80=82=E2=80=82SHIPPED=E2=80=82scripts/kconfig/zconf.hash.c
=E2=80=82=E2=80=82HOSTCC=E2=80=82=E2=80=82scripts/kconfig/zconf.tab.o
=E2=80=82=E2=80=82HOSTLD=E2=80=82=E2=80=82scripts/kconfig/conf
scripts/kconfig/conf=E2=80=82-s=E2=80=82arch/x86/Kconfig
=2Econfig:571:warning:=E2=80=82symbol=E2=80=82value=E2=80=82'm'=E2=80=82=
invalid=E2=80=82for=E2=80=82PCCARD_NONSTATIC
=2Econfig:2966:warning:=E2=80=82symbol=E2=80=82value=E2=80=82'm'=E2=80=82=
invalid=E2=80=82for=E2=80=82MFD_WM8994
*
*=E2=80=82Restart=E2=80=82config...
*
*
*=E2=80=82General=E2=80=82setup
*
Prompt=E2=80=82for=E2=80=82development=E2=80=82and/or=E2=80=82incomplet=
e=E2=80=82code/drivers=E2=80=82(EXPERIMENTAL)=E2=80=82[Y/n/?]=E2=80=82y
Cross-compiler=E2=80=82tool=E2=80=82prefix=E2=80=82(CROSS_COMPILE)=E2=80=
=82[]=E2=80=82(NEW)=E2=80=82aborted!

Console=E2=80=82input/output=E2=80=82is=E2=80=82redirected.=E2=80=82Run=
=E2=80=82'make=E2=80=82oldconfig'=E2=80=82to=E2=80=82update=E2=80=82con=
figuration.

make[3]:=E2=80=82***=E2=80=82[silentoldconfig]=E2=80=82Error=E2=80=821
make[2]:=E2=80=82***=E2=80=82[silentoldconfig]=E2=80=82Error=E2=80=822
make[1]:=E2=80=82***=E2=80=82No=E2=80=82rule=E2=80=82to=E2=80=82make=E2=
=80=82target=E2=80=82`include/config/auto.conf',=E2=80=82needed=E2=80=82=
by=E2=80=82`include/config/kernel.release'.=E2=80=82=E2=80=82Stop.
make:=E2=80=82***=E2=80=82[sub-make]=E2=80=82Error=E2=80=822
make:=E2=80=82Leaving=E2=80=82directory=E2=80=82`/usr/src/packages/BUIL=
D/kernel-vanilla-2.6.34.7/linux-2.6.35'
error:=E2=80=82Bad=E2=80=82exit=E2=80=82status=E2=80=82from=E2=80=82/va=
r/tmp/rpm-tmp.I8rPxE=E2=80=82(%prep)

[1] - Its a long build log.
https://build.opensuse.org/package/rawlog?arch=3Dx86_64&package=3Dkerne=
l-vanilla&project=3Dhome%3Adoiggl&repository=3DopenSUSE_11.3
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
