From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de> (by way of Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>)
Subject: Re: [PATCH CFT] tons of logging patches + addon
Date: Tue, 9 Jul 2002 16:24:29 +0200
Message-ID: <200207091624.29288.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tuesday 9 June 2002 00:22, Manuel Krause wrote:

[-]

> The notebook now works like I bought it: fine, stable and the thermal
> (fan start/stop) patterns are quite well though I didn't replace the
> thermal pads between CPU&fan and the heatsink-to-graphix-and-chipset as
> always and everywhere recommended. (Oh, try to get these special parts
> once!!!)
> We had up to 35=B0C today here in Germany. That's a good restart!

You are not exaggerate? Aren't you?
Eastern German...;-)

We have ~30=B0C (shadow) and I have 26=B0C in my "working room", today here=
 in
Hamburg, Northern Germany.

Have you ever considered to use lm_sensors?
You need the latest kernel patch (2.6.4 CVS).

My brand new dual Athlon MP 1900+, 1 GB DDR-SDRAM 266 CL2 is running even
today sweet and "cool".

SunWave1 /home/nuetzel# /usr/local/sbin/smartctl -a /dev/sda
Device: IBM      DDYS-T18350N     Version: S96H
Device supports S.M.A.R.T. and is Enabled
Temperature Warning Disabled or Not Supported
S.M.A.R.T. Sense: Okay!
Current Drive Temperature:     33 C
Drive Trip Temperature:        85 C
Current start stop count:      65678 times
Recommended start stop count:  2555920 times

SunWave1 /home/nuetzel# sensors
eeprom-i2c-0-50
Adapter: SMBus AMD768 adapter at 06e0
Algorithm: Non-I2C SMBus adapter
Memory type:            SDRAM DIMM SPD
SDRAM Size (MB):        invalid
12 1 2 144

eeprom-i2c-0-51
Adapter: SMBus AMD768 adapter at 06e0
Algorithm: Non-I2C SMBus adapter

w83627hf-isa-0290
Adapter: ISA adapter
Algorithm: ISA algorithm
VCore 1:   +1.72 V  (min =3D  +4.08 V, max =3D  +4.08 V)
VCore 2:   +2.49 V  (min =3D  +4.08 V, max =3D  +4.08 V)
+3.3V:     +3.36 V  (min =3D  +3.13 V, max =3D  +3.45 V)
+5V:       +4.94 V  (min =3D  +4.72 V, max =3D  +5.24 V)
+12V:     +12.08 V  (min =3D +10.79 V, max =3D +13.19 V)
-12V:     -12.70 V  (min =3D -13.21 V, max =3D -10.90 V)
-5V:       -5.10 V  (min =3D  -5.26 V, max =3D  -4.76 V)
V5SB:      +5.39 V  (min =3D  +4.72 V, max =3D  +5.24 V)
VBat:      +3.42 V  (min =3D  +2.40 V, max =3D  +3.60 V)
U160:        0 RPM  (min =3D 3000 RPM, div =3D 2)
CPU 0:    4500 RPM  (min =3D 3000 RPM, div =3D 2)
CPU 1:    4354 RPM  (min =3D 3000 RPM, div =3D 2)
System:   +35.0=B0C   (limit =3D +60=B0C, hysteresis =3D +50=B0C) sensor =
=3D thermistor
CPU 1:    +38.5=B0C   (limit =3D +60=B0C, hysteresis =3D +50=B0C) sensor =
=3D 3904
transistor
CPU 0:    +40.5=B0C   (limit =3D +60=B0C, hysteresis =3D +50=B0C) sensor =
=3D 3904
transistor
vid:      +18.50 V
alarms:   Chassis intrusion detection
beep_enable:
          Sound alarm disabled

Regards,
	Dieter

BTW "Ich liebe die Ossies" ;-)

--
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel@hamburg.de
