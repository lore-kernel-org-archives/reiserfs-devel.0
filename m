From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: fsck.reiser4 v. 0.51 problem
Date: Wed, 25 Feb 2004 19:03:44 +0000
Message-ID: <200402251903.44612.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QGPPAOtkhO72LEg"
Return-path: <reiserfs-list-return-16934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_QGPPAOtkhO72LEg
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

i try the latest snapshot of the reiser4 code with 2.6.3 on my system. I 
create a new reiser4 partition with mkfs version 0.51.

After one hour the compilation of xfree on this fs aborts with a linker error. 
I try to fix the filesystem with fsck, it complains about a fatal corruption 
and suggested the option "build-fs". 

Fsck with --build-fs aborts with the following error for me:

***** AddMissing Pass: inserting unconnected nodes into the tree.
vpf-676: Assertion (place->node->p.node != NULL) at tree.c:2635 in function
reiser4_tree_split() failed.
Aborted

I attached the output from the fsck --check and fsck --build-fs run. I is safe 
to continue use this filesystem?


Best regards, 

Henning

--Boundary-00=_QGPPAOtkhO72LEg
Content-Type: application/x-gzip;
  name="fsck.hdd8-build-fs.out.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="fsck.hdd8-build-fs.out.gz"

H4sICLLoPEAAA2ZzY2suaGRkOC1idWlsZC1mcy5vdXQAtVTbbttGEH3fr5i+SUVI8y6SaB2ojRwE
kN1AVpD2KeBlKC1E7RLcpWPl6ztLUhe7NRIgCSFA2LnsOTNzZitV7OwWucI2gKsSH662ZRmDZeUd
r0urUmDVUJkgYz9Zbdlp9uv3f2y95QrolwlY/P1+sXp3u7hbz5fwgK3iUoCsBvSRog0rzEpYLea3
bxZQ8VZp+4fwYDeEwsUG9BYv+pDXstgBHXmBNvvI6xqKLZLJhBVSKK40iuJgeBrTauzkfddg+4dJ
HrP6xj0JueE13h8ofW+zP6XQXHT4mk3+QXV1J6cpHFANlcFfDQpx5Ea9Z8craDqfM0X0NBYaS6B+
PaFvs9uMAFpQhs5YzMSNpinbZxtepHD6VvhOLdqA5fVO8S948gROErFKtvtMn6OdRwcmgzFwpqzr
eHlxFcwCP/CTOLTKMsmtII89KwsTtMI8D52Qzn4WszrLsb7I+k1Igdc0h/7aZ4xnxLipuw0X54wj
PitRFS1vNMml977hamcNXhMEo3ReGU3Z4Nih7b5UvnMjV/u5ZlXdqS2qU4DD9jtq9kWZzmOYO2Xp
uBXrSZ5jwQsCN555rGoR4cLpxu7MjTzWSqkH+5ATBHEURUxnvIZG1rw4pANCABO1z1o9ZQIfNcgz
vPPoOn6UsIo0RDLsxDiceOYzbWC3yDfbweizHR4uL4blfPV2wUZxrU34us3MwiG8zxSRVUV2Ftzx
ceCClCSyGgyAzc6do30UkoYA7sl4159rrDSl9bf0rM4Bx2+JBKzG7dmD+wrWn/nmbHBOGWu+x4HD
Q0a6+Uhyv8EcvJD6mnp+6s7Ac5wArBddx4IJ4J4KHGvt19nUSi1GoalRPUhPIaPF1YbPs3J728/g
ZqR7we3JHBpSAjci70XdCXp9xLD2fff/dyKRF4RJcvK8lfLo8UgqydfG4cVu4jwfSRgk3154/ELh
Qer7P2Uo387uROHr7OZlecuVMoQGflzQSmhz/s8cDKA8Sd5mD01lRbMohbnqc2h+k6bOCrSuTbx1
3djmH375He4+LJdToFerzyxSL/JDsz8VgZhENq7iJ+P/pJqa68kUKno3sLTZPJctsWD/AoGJFH3S
BwAA

--Boundary-00=_QGPPAOtkhO72LEg
Content-Type: application/x-gzip;
  name="fsck.hdd8.out.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="fsck.hdd8.out.gz"

H4sICM7oPEAAA2ZzY2suaGRkOC5vdXQAtVXbbts4EH3nV8xjUlSKJMs3YdEi29qLAklaOAbaotgH
ShzZhCXSIKnE7tfv6Ga5AYJF21QwDHAunDMzZ4a5zXa+QWnRxHAl8OFqK8SMvfr9j6230gL9uILF
l0+L1Yfbxd36+gYe0FipFegc8rPoPqyQC1gtrm/fLyCXxjr/RXCwJUWRagNui0OKkBY62wEdZYY+
+yyLArItkqg2y7Sy0jpU2bHGWYtWXZHuqz2av2vnn/FaygLvj6QrffZOKydVhW/ZxVe0V3f6MoEj
2jZZ+LhHpXq4ufVZf0Vu4ZFbQuwwcyiASvhDRj675RTAgK0RdvldhJPLhJV8I7METt8KP9iFiVla
7Kz8jidNHMwnLNem5G6wDg4BXLTCOLhkVSXF2VUwjUfxaD4be0LMUy9OZ5HHx3P0xmk6DsZ0HvEZ
K3iKxZnXX0orfEOtaa59gnhKiPdFtZFq8OjjM4E2M3LviEGN9r20O6/V1kbQsel1TTMfAn/sh8+l
Hyz1qrx2LC8qu0V7MghYuaNin6UZHMZpIEQQ5qwBOdhCFMfhbBqx3CDCmTKchdNwEjGjtWvlrU8c
zyaTCXNcFrDXhcyOSRshhgtbcuMumcKDAz2EDw5hMJrMWU4cIo5VqmvObDpirg67RbnZtsIR2+Hx
/GK4uV79s2Aduda1+drwegYRPnFLYG3GB8L1q0AqYpLiBdQBfDZUjkZUaWoChCfhXXMuMHfk1tzS
oBoM+u8GKbDtRqOE8DWsH+VmEAQnj7UsscXwwIk3n4nuS0whGlNdk2iSBDFEAf15z6r6hCnAPSXY
5drMap0rlRiVo0I1QRoInGbZ1XiepNvI/gS2eyw5bYLsaUP6Hthe35Szh+6zhTHaJLAkClEAp8kh
0xtFg9wUvx2dZhjqo5Ckdtoc4Vs0T4Ik4v+errgj35qfg42utw8K/yWz7YJ9VJ6gYYXKkmE7KfQ2
CEJPlT/+IBYyz2l8uzqdvxL0MChJ0yqA5v3ZiO8Kbesu0/r0fUGrhrEQcu6Iz5k2pmrWB61TNDjs
U6rZ2ZaGVaXgUboteF5ayUJ4tBJ048io5Lk8NJz1GXuBfsD/NwR+vYzA/gObn3bA5gcAAA==

--Boundary-00=_QGPPAOtkhO72LEg--
