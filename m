From: David =?iso-8859-1?Q?H=E4rdeman?= <david@2gen.com>
Subject: What is the mening of this error message?
Date: Sun, 15 Aug 2004 20:25:13 +0200
Message-ID: <20040815182510.GA3830@hardeman.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

After an error which filled the filesystem on the harddrive completely=20
(kernel 2.6.7, reiserFS on an LVM volume) I corrected it and ran=20
resierfsck on the filesystem.

However, every now and then I am seeing the following error message=20
in my kernel logs:
ReiserFS: hda1: warning: vs-8115: get_num_ver: not directory item

Could someone enlighten me to what they mean?
(Please CC me 'cause I'm not subscribed to the list)

Regards,
David H=E4rdeman
david@2gen.com
