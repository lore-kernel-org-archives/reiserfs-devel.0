From: David Masover <ninja@slaphack.com>
Subject: Re: Impressed. Any info other than source?
Date: Tue, 01 Feb 2005 19:16:29 -0600
Message-ID: <420029ED.1090509@slaphack.com>
References: <1107223140.28831.110.camel@cunegonde.paulshome.acculin.com> <41FFADD5.7010605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41FFADD5.7010605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Info <info@acculin.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Info wrote:
|
|> Hello,
|>
|> I am really impressed by what you're doing with Reiserfs.
|> It is a wonderful mix of the immediately usable and great
|> promise for the future.
|> I am somewhat amazed that this is such a low traffic list.
|> Am I missing some other place where this stuff is discussed?
|>
|>
| Not really.  We are in a period of stabilizing rather than designing new
| stuff.  Unfortunately, one always spends far more time stabilizing than
| designing.....
|
|> Quoting from your website:
|>
|>
|>> Looking at the coin from the other side, we want to make
|>> it an order of magnitude less work to add features to ReiserFS so
|>> that both users and Namesys can add at least an order of magnitude
|>> more of them.
|>>
|>
|>
|> To this end is there any documentation between the general
|> descriptions (.../v4/v4.html and .../whitepaper.html) and
|> the actual source code? I have searched your site and the
|> web (although I haven't tried BitKeeper yet) and can't find
|> anything. It is not the actual internal workings so much as
|> how to modify a plugin that I'm interested in. Any sort of
|> howto type documentation?
|>
|>
| The source code is intended to be very readable.  I don't think there
| should be any documentation besides web site and source code.

I agree in principle, but in practice, a short "HACKING" file would be
nice with any project.  You have documentation for how to install, even
though it's a standard kernel patch & config, so why not a quick
"foo/bar/main.c might be a good place to start" kind of doc?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQgAp7HgHNmZLgCUhAQLsYg//ZChMl9gsQ3F7HeYwtjFb+nQw84Xv8YNu
3RCFebJrPkU0oWqq/V6ZLbJj1+ZcjlA6Hgnc/exEJH0Ms3XZD0nzl4jGoUr7NsMe
KWsChP7F0PfpnSg6aG5j6RBYLP4J7WAegZ7+UgSA71adgVTrE6/I8rv6M4bfhTyj
PXLGgtXxOK3u6WtudtOp5P7vTGBr52Qc1JrEGveErkkoHHx4GLgdRjR+dvDDdkfB
Uk71iTtEYYw6Q4dYBfQu94yw3d9x+J0N+ENgpImnN3SdT+QmwFVPB3gMmTfJyTcj
nj9p8PTHNcYMs5UxPwj4jctN10xp1VNk/hp50zsc6a1BegpuvvtNSlDa/8Q8+JcJ
DXvCMzeQ6iStIxg50PSTVuk1IJ6Zq6XkyQpTpYAxtssuJn8US/pCWQ0htJmoEaMY
Cl2dYXaUM/N28SSvfTxuK/0mcnJhs/yUQL9R5TcGPSnNjBx/hlJfQk69Zhi+yl+I
oDcl+phnlcSwbUUwAHoTF7O2fCVgUmyzv6jGIJKx6XEVdbvvgXwunpzgXztuA8g3
bYgAkP3AFswyo7+qFsNtqQEORLs0E5zr9cv07LhQb+6S+6M4vg6/j605G/TLOBqE
gqgEERy6thcdtMyFkjhXxyAlKGs3prRKzP47YMOQyuwI8OaprihrecgISC5lPGUQ
jAmy3xiwlNs=
=ymtG
-----END PGP SIGNATURE-----
