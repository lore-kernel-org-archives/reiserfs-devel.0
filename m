From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Problem with the latest auto snapshot
Date: Sun, 13 Jun 2004 15:37:54 +0200
Message-ID: <200406131537.54853.henning-04@die.informatik.uni-siegen.de>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040612194649.GF4990@nysv.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_yiFzAB4UZ1Z5X2d"
Return-path: <reiserfs-list-return-19165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040612194649.GF4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?iso-8859-1?q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--Boundary-00=_yiFzAB4UZ1Z5X2d
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Samstag, 12. Juni 2004 21:46 schrieb Markus T=F6rnqvist:
> I had something similar, with an old auto-snapshot, but I didn't get
> those log messages. It also repeated on, 2004.06.09 under some mild load,
> compiling .11-19.36 and doing a dist-upgrade. I'll dig out some traces
> if it still repeats with this kernel, as they seem to have systematically
> receeded.
>
> I wonder if we have something different concerning debug?
> mjt@shrike:~$ zgrep -i reiser4 /proc/config.gz
> [snip]

Hello Markus,

i'm using the same reiser4 config like you.

I just rebuild the partition, and start a small compile job. After them i=20
started a fsck. It reported a new fatal error about a broken node. I attach=
ed=20
the output from fsck. I could reproduce this error two times.=20

The new snapshot shows also another error on a fresh fs after a simple copy=
 or=20
untar operation:
Error: On-disk used blocks and really used blocks differ.
Free block count 2354038 found in the format is wrong. Sould be 2441757.

I could reproduce this error too. If i remember it correctly, i have had th=
is=20
problem with the 03.26 snapshot before.

I start now a kde-3.2.3 compile run, lets see if the new code survive this..


Best regards,

Henning

--Boundary-00=_yiFzAB4UZ1Z5X2d
Content-Type: application/x-gzip;
  name="fsck.out.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="fsck.out.gz"

H4sICOJNzEAAA2ZzY2sub3V0AO1Y3W/bNhB/519x6B5qd7Eq2fInhg1p4hQdmqywDWzDsAdaomzW
MmmIVBLvr9+R1JdTp27RBHtYhQSQSN7d776PVlIIBrc0gx8gUdHGyxhXLAvhdcxuX6/jeERefftD
FmuuAP+ogOkfH6azd9fTm8X5e7hlmeJSgEwOpHswYzSG2fT88noKCc+U9p4EB7lCKVysQK9ZrSIs
UxltAD95xDzyO09TiNYMl8yxSArFlWYi2hucZmlWGGme71j2xhB/DdUVT9l8j3tbj1xIobnI2S+k
9SdTr29kewJ7ppyy8NuOiRJtojxScvgo80zQFFrFS+i3Aa1YKTQBH3RGhaKRRvMqyNgupXsWl1C0
1EjuO8UbjBMFd1ShJTSLtDneYOqRa4qgM1BG68JmrWDQnpAtXfFoAtUzY+/UNAvJMt0o/g+rdkJ/
PCCJzLZU16f9ex9abhH1IHnO4wYrGHWX/TgZR51BP0g6YTwKOzSOu51+RIfLJR1T1u2TlC5Z2qD6
SUjBfkZ3W7YPEA8R8S7NV1zUFKV8EjMVZXxnzGZ3L7nadNyuOQRFhJ6Z0PXA9/pe+Jj6/pWcbc81
SdJcrZmqDvhku0FDN9T07wdxEPbHSY84j9TMumEYjIZdkmSMQWOz2+sHY39EMim1W3c0o/Ew7BFN
eQo7mfJoP3ECQmipLc10mwh2r0HW0v37YNBbjkmCYYlhm4vCN91gPBgQbeSuGV+t3XJINmzfZA3v
z2dvp6SI2IU5vsioSWwGH6hCtCqiogrjsr5wgaFkYtgI8Mg0y2Q2gRsZM2gZHQbtM+CYItDyMSXs
2xoj07C4yyQyS5lY6TW0hqO2B/O1zNMYlkgchu2T7JaZ3DDhFhLUOD5KMbHShFnB0uVoPPggDfQY
kkxu6wOWpN8Qcga54Nq8ebAwoNcyZUTlS2tQ5Kc2fLdjKLmOGix5hpmCwB8Mg2rjxq6lLNFoNZe+
hoc55FeHyuc9Q9urIs+3eKjv985gccdXjcVBWNG9caaotk4yfMishrDgW+b8eksxGee5gF/xP+hB
EE7C0aTXh67vh9A5sjW0W2UQoYA5Bk0RP7aomvjBwGVCY/BZIRYCxaKrDZ4HdrRrB4qeRDc8iY5c
UVM2I5ll+c4V1juWsSKEYM62FKt5BDuEfeDiqyp5XYKV2esoS68WVQYJbYQjwzKo3fFx0QMPG3XC
BcfyEgOSPor8IpXKWBCbiOfFWBsJCSA5rk1V/BFWo1XBDBnfcUy5TmeZ8zTuYA2TlhDbCcK4t/Hg
EXVypGhweJKu/n+ZLqzRvo8S9vk+SliFv48SzzxKYIrds+PzwQmurluZ+rOlygTL+JB7r2Z+0Lq+
cgQ43bFxBAg/NwJcYAdwOVqIfq4ZoO9PguB4lzVb3f92BqghnEZnUrmB7iAsd5ga3PrdJHkuItMP
a/Me9XZtwLdSfrr4iB/8b/BD73FNe8/ih2fAdh7H11zZwcah4wILgjbfn5jdCJRV5tQIrQEnWEsQ
KNrTcWD2fbm3ad2E7hzwxcefTNNqtHxQD8sSqMp9WxZKJzWqFrzECVD/aOfNl4Cey/bl2PrGTBXG
ZhQEuwO5/Ihmc5OeMZep0V068ScJPhXHK+wKqDaaFEuHXAlszS74bTO0kW8+Y24qi0Rhf1U8/q6Y
LLK9TRrHBPV6nKbGE7OE5qkuJHU6eDz0a5ZmvDHdp0kbS/S/wOa2RuOhmnNN9SUOv9ZfHlygN3XD
AILhLc/pccj88hgyJ9NZ9IX3wsyhRlRh3Hc2QI5wblnWn7+qdrGxVFiLcesT5Q6bjpmR3PXTthZj
21bw5FKWe40WPRBDWn2jzRNEfvcg8i9SRkW+K8uP+bL5vTsYARR6ha4e5vaMbTGq4q9Oy+5nwIVN
cF94EWvQHbmIYXLWd7Dy54h/AdwnjaOYFQAA

--Boundary-00=_yiFzAB4UZ1Z5X2d--
