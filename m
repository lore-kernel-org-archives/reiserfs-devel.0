From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: rijndael loopback encryption was [Re: Corrupted/unreadable journal: reiser vs. ext3]
Date: 13 Feb 2003 13:17:18 -0500
Message-ID: <b2gnfe$osp$1@satsuki.furryterror.org>
References: <b2f3ja$jg7$1@satsuki.furryterror.org> <200302121515.46953.russell@coker.com.au> <b2f3ja$jg7$1@satsuki.furryterror.org> <20030213113003.7ee7af6e.philippe.gramoulle@mmania.com>
Return-path: <reiserfs-list-return-12742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030213113003.7ee7af6e.philippe.gramoulle@mmania.com>,
Philippe =?ISO-8859-15?Q?Gramoull=E9?=  <philippe.gramoulle@mmania.com> wrote:
>Hi Zygo,
>
>This is a little bit OT from the thread on ReiserFS ML, but could you tell =
>me more
>about your laptop setup with rijndael loopback encryption and how you insta=
>lled it
>, what kernel version/patches ( link to a guide or FAQ or tutorial about ho=
>w to set this up)
>
>I had once a NOC latop full of critical infos stolen in the tube in Paris,F=
>rance
>and it had been a mess to change all the passwords, etc...
>
>Having every FS encrypted would make my paranoid ego feel much better ;o)

Linux 2.4.20, loop-AES 1.7b (replaces the standard loop.o module).
See http://loop-aes.sourceforge.net for loop-AES.  The package tarball
contains a crypto-ramdisk-boot script and some information on how to
set things up.

Note that you should probably encrypt swap as well, and watch out for
features like suspend-to-disk (aka "hibernate") that save the contents
of RAM without encryption.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
