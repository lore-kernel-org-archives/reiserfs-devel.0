From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 21:43:34 -0500
Message-ID: <41007B56.2030103@slaphack.com>
References: <40FE0B47.3010600@slaphack.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com> <200407221410.25043.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407221410.25043.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: =?KOI8-R?Q?Markus_To=22rnqvist?= <mjt@nysv.org>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




Vitaly Fertman wrote:
|>First question:  Can I manually enable/disable a particular plugin for a
|>particular directory?  (like how cryptocompress is supposed to be...)
|
|
| you can change a plugin for a file if it does not destroy its structure.
| Thus for an empty directory you can :
| 	# cat somedir/metas/plugin/hash ; echo
| 	1 r5 r5 hash
| 	# echo -e "tea\0" > somedir/metas/plugin/hash
| 	# cat somedir/metas/plugin/hash ; echo
| 	2 tea tea hash
|
|
|>Second question:  Would such a setting be recursive?  Can I tell it
|>whether to recurse or not?
|
|
| plugins are inherited at the creation time from the parent of the object
| being created. Thus in the above example all subdirs would have the
| hash r5 before changing the 'somedir' hash to 'tea' and will have the
| 'tea' hash after.

wait -- what does this do:
echo -e "tea\0" > somedir/metas/plugin/hash
echo -e "something_differenet\0" > somedir/subdir/metas/plugins/hash
echo -e "r5\0" > somedir/metas/plugins/hash

What is the hash of "subdir" now?

What about new subdirs?  What hash will they get?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQQB7VngHNmZLgCUhAQLxLA/+PWfdMA1LVzwY3HjINl/ZsGD0TtrW6oxc
eMJVbtGFXYeCSv5hV1bqE9IbSX/HgMEyqq/8TFvf4Cy66s1aUAcbflXiZQOzEMXa
UwW69kGH7H74ENP9TYyrySLNpvx54rhm/uU+g0XTaQHQ85VjuGC/0fruspCITTGX
+nLhMNDO/FPtokAHunug3dqBV7WI9oNhtj43lCslhlYAKK926GrEblYqFDFbEwIj
p+DK9QSALxGq4FvkDbb+70sgL8dK1WEQ7x/j2gGLMKgXbwrqfjSkIv6Zhk2BmOwM
W9sQRtkx6ovcJWmH6QhdwH8PScxreN/w22+JO28g8hhKUrb/YxR8RMR4U3kBflf0
xXonMAISVRBCT0hBuOPyOvFHuPXlKNruW9LExmNOyVE1NzmMCs97uY7FyEP87kJl
cffhA1+z6EjDJC3yqYCQlG7lIAGtISxB0zJWHAhZVKPNxH1bYH5xxDc/VGvs6O2K
33jnta8MXMP7r4PBaCe0frE85krsqtk9NxviTf7REabJprXD1zmPa7w/XvGSynVK
N71Y01fsLqKJoalXgedSpIAsohtBBDWPix+RJglmqULJddNWJppcayVlHCGJ8EcD
YILWo/gWloSmYHPpppDAmDG7YkbJBc2FXeuIyxiP9oWiBJm61b10VK8btfyKmmtQ
2GyhYEmH69w=
=wL4f
-----END PGP SIGNATURE-----
