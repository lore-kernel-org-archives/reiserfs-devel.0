From: Chris Mason <mason@suse.com>
Subject: Re: data-logging 2.4.23 patches: 1 reject in fs/inode.c in 2.4.25
Date: Mon, 23 Feb 2004 09:12:04 -0500
Message-ID: <1077545524.23064.96.camel@watt.suse.com>
References: <c12ap7$vor$1@sea.gmane.org>
	 <1077304113.26934.8.camel@watt.suse.com> <c1cv3s$iqi$1@sea.gmane.org>
	 <200402231448.22657.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RksYmaWJT1HGvPpK75SR"
Return-path: <reiserfs-list-return-16890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402231448.22657.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, johan@ekenberg.se
Cc: Jens Benecke <jens@spamfreemail.de>, reiserfs-list@namesys.com

--=-RksYmaWJT1HGvPpK75SR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-02-23 at 08:48, Dieter N=FCtzel wrote:
> Am Montag, 23. Februar 2004 14:29 schrieb Jens Benecke:
> > Chris Mason wrote:
> > > On Thu, 2004-02-19 at 07:40, Jens Benecke wrote:
> > >> Hi,
> > >>
> > >> Chris' data-logging patches do not apply cleanly to 2.4.25, are they
> > >> being updated?
> > >>
> > >> I think the fix for inode.c is not very hard but I don't dare to fid=
dle
> > >> around with file system code. ;)
> > >
> > > Ok, I'll rediff the data logging + quota against 2.4.25.
>=20
> Have you missed this one, Jens?
>=20
> updated data logging and quota for 2.4.25
> http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D107749109315488&w=3D2

There seems to be some ftp.suse.com problems, that patches haven't made
it over yet.  The only one that changed was kinoded, I've attached it.

-chris


--=-RksYmaWJT1HGvPpK75SR
Content-Disposition: attachment; filename=07-kinode-10.diff.gz
Content-Type: application/x-gzip; name=07-kinode-10.diff.gz
Content-Transfer-Encoding: base64

H4sICKwyOUAAAzA3LWtpbm9kZS0xMC5kaWZmAKVWaW/bRhD9TP2KiYM6lKhb8g0HNhzZISDLaeyg
QFFgQZMraSFql9ldRnHT/PfOHtSRxGmAEobFY96cb2b2tyLR6bwW84x+PoWc8fJzuz/sTFWHcZHR
dlo7//9XrdVqrXW3hWSzLQNBv9sdtrr9Vr8PvcFp//B00G13qwta3YNutxZF0Y+c+wZ7MDwdHH2H
vbiA1kF30DyCyP1cXNQg+FoD/Ku1lE40S+GTYBlo+US0IOqJp6TkpaIZsYZUaD83IJGzei36dUi9
Bl/QltKyTDWosqCSPOYiXaAu9XiGnxjXwKXHwDm4G2JMtPG9U3nmYuj3bQz4c+xiUAXjKGIUhvsW
Scx9/Ww3Nm9efyT+bsdRMs1LNSc6UYuzdWxvRlfjy/cj8sdl/EB+/zD6MCJvR5dvwoXFZGSVMF2H
jXyixZKlREMlMBNJjuFcPtzdxlcknsQPYdcAoAadRqMG0AhWkmnqnCBcrIKWewMJd1kALSBjamGD
Pzo+NMEfHR9VBYQXDjpPFHksp1MqVWjf1DHrLzM6ZZxCPLl7MwopxzLVgzBnShP74F41q9RYXBMY
MRIGX2vZ6hay5OhimqRzGppSmbC+YQB5RshWfhzfP7jMWc1nGzJYX+Y0QVp5XxpTSWnymFPM2775
7Mp+3B80ewcQHfeHzZP/rDt+xZwVQlEbS1jpxG+tWivoNDC0ANkXT2FFMb0Zf6XBCGVAuShnc0hz
WlVAgcKYsjKnDpSA4TmIKei5AUv95AWbRluacC40ZAKYdoCpFEuYU0lBSJR4hTeUIVZaRXMp0KTK
nxAyU7lYOZAVhQxTYztlhQAQYtm2Xzv4n00htPx6Dd06PgeVl5bE4f5z9MYcRMFiSZfE1oqouWR8
4UjjXhVWpNKPhQ6C5xvcpfslmyLX4Opuch3fkLfxzdvb0S1WodNw1Ts5avaHWL2TfrPnyveS8gxN
YCl2QSY427fRT7iHrIoC321Jllk/m7C/3XbrGLyYxEyGuxKYud6h0xWskgUlZYFRaSplWWiGdNnI
2043Gr+iY19rUQ2MLy513juCKRXYU+ZDIRnOd410ti5PC7I0mXfdYF6losT/59CtCOmKPkkUkmld
9MSkIOEpbbuyO6E/KCyTJ5iLPINPCVoqFVzfg0EgAxOeWeIIpLSTXyVoCqeIpGkpFTUuCUtdBOl5
gs4keY7ML5WTZ9yy34/jsG5VTiXDgqn2Lv9ehFVssA+E3Fy/I9f3dctGSXUpuQsQgireHw526KwT
5qR3im6hpnErlb/A3Y1xSyXwNOz1T7rNQ4h6/eNuc3DgxoiXlVR56cgUyBferzz0V+qysFxB9dUq
wbirZdLQmINzwAxLHGSWe56sZj/gY5YgPTj7m4bWQ4SlxVOIqNbrVCyXTdjzJvfqDoCdYesPM6o1
4zNQbMaTXJnsR274mZITJj+G+1YPCphSVFMwClzTe5yx5Uyz2ZTluaLa4+wuppnPHLIhNZjCNCif
bWCbcfsTmyiIteR6EVbxgE0ezf7ie3ZXIheWRU41DUOfO/+CCQ6NepVqI7maM2zCnmtR8JdpRUI/
YZa/adbtXm1uAZ67nh8M1vjannUi9Kv8JyA/SYLdVbieRUE1sFT5+OzACmxbeRa1XnPcSGjLTnY7
hzdT3tEID3BbM6ljjxQQc6ZZkiPXbJvj0WCOXMUUqbb53nG9MBj28AQV9QaH3WbPnybMBZMP47Hd
0bbDd3rLiBQJZ2m459dcipnQ1B9VVJ48ghW1JLanr+C5PdSWotTmdHL+/PERlWAb4DgziTAzzLID
N7Cemwq4aec8ZBg0hlogbRVKCsAJhjt1invUDLla1GgYBSshF22Ae4HYLDO7nKbCKkH4tMS9jqrt
CWAp7DI1HxDcWR93TF8TZ85ZRkH76M+60Rfb3ttnzi2Ce3p7DVmiE4z/6u723Xj0EN9N7BkxvhzH
f47eh9utsKCS05y4uCuqI4O8TBOuxneTEU5f+Ke6jcejzdN9fDO5HLuuMg2EeSEbt8L9bVvfT08/
PodImQFSZnh40nTT0353q9z0/lbOwt3kmFPvv58JaSlmDQAA

--=-RksYmaWJT1HGvPpK75SR--

